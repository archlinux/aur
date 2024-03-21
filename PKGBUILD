# Maintainer:

# options
: ${_build_git:=false}
: ${_nodeversion:=18}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="thorium-reader"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.4.0
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
arch=('any')

# main package
_main_package() {
  depends=(
    'electron'
  )
  makedepends=(
    'gendesk'
    'git'
    'nvm'
  )

  if [[ "${_build_git::1}" != "t" ]] ; then
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
    cd "$_pkgsrc"
    local _pkgver=$(
      git describe --tags --exclude='*[a-z][a-z]*' \
        | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    )
    echo "${_pkgver%%.r*}"
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
    git describe --long --tags --exclude='*[a-z][a-z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}


# common functions
prepare() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/usr/share/thorium-reader"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

_ELECTRON=/usr/bin/electron
_ASAR="${APPDIR}/app.asar"
_FLAGS_FILE="$XDG_CONFIG_HOME/thorium-reader-flags.conf"

if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox $_USER_FLAGS "$@"
fi
EOF

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="Thorium Reader"
    --exec="$_pkgname %u"
    --icon="$_pkgname"
    --terminal=false
    --categories="Office"
    --mimetypes="application/epub+zip"
    --startupnotify=true
    --custom="StartupWMClass=EDRLab.ThoriumReader"
  )

  gendesk "${_gendesk_options[@]}"
}

build() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  export SYSTEM_ELECTRON_VERSION=$(</usr/lib/electron/version)
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

  # build
  cd "$_pkgsrc"
  npm install --no-audit --no-fund --prefer-offline
  npm run package:build
  npm exec -c "electron-builder --linux --x64 --dir --publish never -c.electronDist='/usr/lib/electron' -c.electronVersion=${SYSTEM_ELECTRON_VERSION}"
}

package() {
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "$pkgdir/usr/share/$_pkgname/"
  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# execute
_main_package
