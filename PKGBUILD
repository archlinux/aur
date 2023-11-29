# Maintainer:

# options
#: ${_pkgtype:="git"}

# basic info
_pkgname="thorium-reader"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=2.3.0
pkgrel=2
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

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=("$_pkgname.sh")
  sha256sums+=('74bc28848d52be2dc78414b3fdb25b19e1064a40fa05103bb544b1d7c1b6546a')
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
_ensure_local_nvm() {
  export NVM_DIR="${NVM_DIR:-"${startdir}/nvm-node"}"
  export NODE_MODULE_CACHE="${NODE_MODULE_CACHE:-"${startdir}/npm-cache"}"

  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install 18
  nvm use 18
}

prepare() {
  _prepare

  gendesk -q -f -n --categories "Utility" --pkgname="$_pkgname" --pkgdesc="$pkgdesc" --name="Thorium Reader" --exec="$_pkgname"
}

build() {
  _ensure_local_nvm

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
