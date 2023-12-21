# Maintainer:

# options
: ${_build_git:=false}
: ${_nodeversion:=18}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="thorium-reader"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.3.0
pkgrel=4
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

  _backports=(
    # commits needed to fix error message
    22a49691a23c01b4041f6679dec86e1b36df7b31
    dcb98bf62cfbc85a0a0cc12bdfb5606a6d2ab8bd
    93a79a38601ad6251f0afa80be85dd240d5e7f8f
    2374d856712b8315aec2605975aa48bd37398105
    50cc65551d69d22137aeff5efa00aceb452d0bfb
    1d72280ab708fa8ac5ca8ebfbccc0412623d080b
    87d059c8d4ee7fdeab6bee9383c241be6adf2952
    7d7a1e480828200bbf0ac20a9edfeda77ebae40d
    23fdd654ae67221faa01020c36c268aa7d599eed
    1d3dc939d1d495540a0482f4e0596dc55d5157cf
  )

  _backport() (
    cd "$_pkgsrc"
    local _c
    for _c in "${_backports[@]}"; do
      git cherry-pick -n -m1 "${_c}"
    done
  )

  _prepare() {
    _backport
  }

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

  _prepare() {
    :
  }

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-z][a-z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}


# common functions
prepare() {
  _prepare

  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
set -e

APPDIR="/usr/lib/thorium-reader"
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
    --custom="StartupWMClass=ThoriumReader"
  )

  gendesk "${_gendesk_options[@]}"
}

build() {
  export HOME="${startdir:?}/node-home"
  export NVM_DIR="${startdir:?}/node-nvm"
  export NODE_MODULE_CACHE="${startdir:?}/node-module-cache"

  #export npm_config_build_from_source=true
  export npm_config_cache="${srcdir}/node-npm-cache"

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION=$(electron${_electronversion} -v | sed 's/^v//')
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

  # build
  cd "$_pkgsrc"
  npm install --no-audit --no-fund --prefer-offline
  npm run package:pack-only
}

package() {
  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname"
  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "${pkgdir:?}/usr/lib/$_pkgname/"
  install -Dm644 "$_pkgsrc/resources/icon.png" "${pkgdir:?}/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgname.desktop" -t "${pkgdir:?}/usr/share/applications/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname"
}

# execute
_main_package
