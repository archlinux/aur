# Maintainer:

# options
#: ${_electron_version:=30}
: ${_nodeversion:=20}
: ${_install_path:=usr/share}

: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="thorium-reader"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.4.2
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
arch=('any')

# main package
_main_package() {
  depends=(
    "electron${_electron_version:-}"
  )
  makedepends=(
    'git'
    'nvm'
  )

  if [[ "${_build_git::1}" != "t" ]]; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
}

# git package
_main_git() {
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-z][a-z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() {
  _nvm_env

  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"
  npm install --no-audit --no-fund --prefer-offline
  npm run package:build
  npm exec -c "electron-builder --linux --x64 --dir --publish never -c.electronDist='/usr/lib/electron${_electron_version:-}' -c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
}

package() {
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
XDG_CONFIG_HOME="\${XDG_CONFIG_HOME:-\$HOME/.config}"

_FLAGS_FILE="\$XDG_CONFIG_HOME/${_pkgname}-flags.conf"

if [ -r "\$_FLAGS_FILE" ]; then
  _USER_FLAGS="\$(cat "\$_FLAGS_FILE")"
fi

if [[ \$EUID -ne 0 ]] || [[ \$ELECTRON_RUN_AS_NODE ]]; then
    exec electron${_electron_version:-} /$_install_path/$_pkgname/app.asar \$_USER_FLAGS "\$@"
else
    exec electron${_electron_version:-} /$_install_path/$_pkgname/app.asar --no-sandbox \$_USER_FLAGS "\$@"
fi
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Thorium Reader
Comment=Cross-platform desktop reading app based on the Readium Desktop toolkit
Exec=thorium-reader %u
Icon=thorium-reader
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=application/epub+zip;
StartupWMClass=EDRLab.ThoriumReader
END

  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# execute
_main_package
