# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Bader <Bad3r@pm.me>
# Contributor: @pychuang (logseq-desktop-git)

## options
: ${_nodeversion:=22}
: ${_install_path:=usr/lib}

_pkgname="logseq-desktop"
pkgname="$_pkgname"
pkgver=0.10.14
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
arch=('x86_64')

depends=(
  alsa-lib
  at-spi2-core
  cairo
  curl
  dbus
  expat
  glib2
  gtk3
  libcups
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  pango
)
makedepends=(
  clojure
  git
  nvm
  patchelf
  python-setuptools
)

install="$_pkgname.install"

_pkgsrc="logseq-${pkgver}"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver}.$_pkgext")
sha256sums=('365f1dec3565b8c96c10ea9913f7adc4d83b1d5da4a905a16aef7a944c06e10d')

_nvm_env() {
  # avoid cluttering user home, while allowing data to be cached
  export HOME="$SRCDEST/node-home"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"

  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

prepare() (
  _nvm_env

  cd "$_pkgsrc"
  npm install -g yarn

  # download required js modules
  yarn install

  # create and sync files to folder `static`
  yarn gulp:build

  # go to folder `static` and download required js modules in static
  cd "static"
  yarn install

  # go back to the top-level folder and download clojure dependencies
  cd ".."
  clojure -P -M:cljs
)

build() (
  _nvm_env

  cd "$_pkgsrc"

  # build
  yarn cljs:release

  # packaging javescript files to an executable
  cd "static"
  yarn electron-forge package
)

package() {
  local _out_path="$_pkgsrc/static/out/Logseq-linux-x64"
  for i in "$_out_path"/resources/app/node_modules/dugite/git/libexec/git-core/*; do
    if [ "$(patchelf --print-rpath "$i" 2> /dev/null)" = "/tmp/build/curl/lib" ]; then
      patchelf --remove-rpath "$i"
    fi
  done

  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a "$_out_path"/* "$pkgdir/$_install_path/$_pkgname"

  install -Dm644 "$_out_path"/resources/app/icon.png "$pkgdir/usr/share/pixmaps/logseq.png"

  # script
  local _electron_version=$(strings "$pkgdir/$_install_path/$_pkgname/Logseq" | grep -Pom1 'Electron/[0-9\.]+')
  local _warning_eol="${_electron_version:+Logseq uses ${_electron_version}.  To check whether this version of Electron still receives security updates, see https://endoflife.date/electron}"

  printf 'WARNING: %s\n' "${_warning_eol:-see https://endoflife.date/electron}"

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

printf 'WARNING: %s\n' "${_warning_eol:-see https://endoflife.date/electron}"

exec "/$_install_path/$_pkgname/Logseq" "\${flags[@]}" "\$@"
END

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

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
