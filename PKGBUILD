# Maintainer:
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Bader <Bad3r@pm.me>
# Contributor: @pychuang (logseq-desktop-git)

## options
: ${_nodeversion:=18}
: ${_install_path:=usr/lib}

_pkgname="logseq-desktop"
pkgname="$_pkgname"
pkgver=0.10.9
pkgrel=2
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
  libdrm
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nodejs
  nspr
  nss
  pango
  perl
)
makedepends=(
  clojure
  git
  nvm # AUR
  patchelf
  python-setuptools
)

install="$pkgname.install"

_pkgsrc="logseq-${pkgver}"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver}.$_pkgext"
)
sha256sums=(
  '9fe98bbeb4355c1ad3ea5b3776f02455ee86b8157f74dd53bb9b3367df31403a'
)

_nvm_env() {
  # avoid cluttering user home, while allowing data to be cached
  export HOME="$SRCDEST/node-home"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"

  export NVM_DIR="$SRCDEST/node-nvm"

  #  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  #  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

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

  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -a -r -u "$_out_path"/* "$pkgdir/$_install_path/$_pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/logseq" << END
#!/usr/bin/bash

flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/logseq-flags.conf"

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

exec "/$_install_path/$_pkgname/Logseq""\${flags[@]}" "\$@"
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
