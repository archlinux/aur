# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Bader <Bad3r@pm.me>
# Contributor: @pychuang (logseq-desktop-git)

## options
: ${_nodeversion:=20}
: ${_install_path:=usr/share}
: ${_electron_version=34}

_pkgname="logseq-desktop"
pkgname="$_pkgname"
pkgver=0.10.14
pkgrel=3
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=('x86_64')

depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'asar'
  'clojure'
  'git'
  'nvm'
  'patchelf'
  'python-setuptools'
)

_pkgsrc="logseq-${pkgver}"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver}.$_pkgext")
sha256sums=('0e6da0a48933f4c7c4fcdd0e195e0eb7d6eeb8fad4eb1a6226910f78345d1777')

_nvm_env() {
  # avoid cluttering user home, while allowing data to be cached
  export HOME="$SRCDEST/node-home"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"

  export NVM_DIR="$SRCDEST/node-nvm"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() (
  _nvm_env

  local _electron_version=$(cat /usr/lib/electron${_electron_version:-}/version)
  export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron${_electron_version:-}"

  sed -E -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"

  npm install -g yarn
  npm_config_build_from_source=true yarn install --force

  # create and sync files to folder `static`
  yarn gulp:build

  # download clojure dependencies
  clojure -P -M:cljs

  # build
  yarn cljs:release

  # package javascript files to an executable
  cd "static"
  npm_config_build_from_source=true yarn install --force
  yarn electron-forge package
)

package() {
  local _electron_version=$(cat /usr/lib/electron${_electron_version:-}/version)
  depends=("electron${_electron_version%%.*}")

  # eol electron warning
  local _warning_eol="${_electron_version:+Logseq uses Electron ${_electron_version}.  To check whether this version of Electron still receives security updates, see https://endoflife.date/electron}"
  if [ -n "$_warning_eol" ]; then
    # colors in /usr/share/makepkg/util/message.sh
    printf "${BOLD}${YELLOW}WARNING:${ALL_OFF} %s\n" "${_warning_eol:-see https://endoflife.date/electron}"
    install -Dm644 /dev/stdin "$pkgdir/$_install_path/$_pkgname/electron_version" <<< "${_electron_version}"
    eval "install='$_pkgname.install'"
  fi

  # fix rpath
  local _out_path="$_pkgsrc/static/out/Logseq-linux-x64"
  for i in "$_out_path"/resources/app/node_modules/dugite/git/libexec/git-core/*; do
    if [ "$(patchelf --print-rpath "$i" 2> /dev/null)" = "/tmp/build/curl/lib" ]; then
      patchelf --remove-rpath "$i"
    fi
  done

  # asar
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  asar pack "$_out_path/resources/app" "$pkgdir/$_install_path/$_pkgname/app.asar"

  # icon
  install -Dm644 "$_out_path"/resources/app/icon.png "$pkgdir/usr/share/pixmaps/logseq.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Logseq
Comment=$pkgdesc
Exec=logseq %u
Icon=logseq
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=x-scheme-handler/logseq;
StartupWMClass=Logseq
END

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/logseq" << END
#!/usr/bin/env bash

name=logseq
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

if tput bold &> /dev/null; then
  ALL_OFF="\$(tput sgr0)"
  BOLD="\$(tput bold)"
  YELLOW="\$(tput setaf 3)"
fi

${_warning_eol:+printf "\"\${BOLD}\${YELLOW}WARNING:\${ALL_OFF} %s\\n\"" '${_warning_eol:-see https://endoflife.date/electron}'}

exec electron${_electron_version%%.*} "\${flags[@]}" "/$_install_path/$_pkgname/app.asar" "\$@"
END
}
