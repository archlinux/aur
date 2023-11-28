# Maintainer:
# Contributor: Digimezzo <raphael@digimezzo.com>

# options
: ${_pkgtype:=git}

# basic info
_pkgname=knowte
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=3.0.0.r12.gb86ef565
pkgrel=1
pkgdesc="Cross platform note taking application"
url="https://github.com/digimezzo/knowte"
license=('GPL3')
arch=('x86_64')

# main package
_main_package() {
  makedepends=(
    'gendesk'
    'nvm'
  )

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=(
    "$_pkgname.sh"
  )
  sha256sums+=(
    '4fc173bf2c4c7f210e4a3fa1983ed6e502aa3bd2845b1947a472952189272b6f'
  )
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source+=(
    "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v${pkgver%%.r*}.$_pkgext"
  )
  sha256sums+=(
    '32247fbec85fcd9340e35bcb0c2655e216899ac568e7dbe91844a873da280f64'
  )

  pkgver() {
    local _pkgver="${pkgver%%.r*}"
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[A-Za-z][A-Za-z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  gendesk -q -f -n --categories "Utility" --pkgname="${_pkgname}" --pkgdesc="$pkgdesc" --name="Knowte" --exec="${_pkgname}"
}

_ensure_local_nvm() {
  export NVM_DIR="${srcdir:?}/nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install 16
  nvm use 16
}

build() {
  _ensure_local_nvm

  export XDG_CACHE_HOME="${srcdir:?}/cache"
  export XDG_CONFIG_HOME="${srcdir:?}/config"

  cd "$_pkgsrc"
  npm install --force --no-audit --no-fund
  npm install --force --no-audit --no-fund querystring
  npm run electron:linux || true
}

package() {
  depends+=(
    'electron'
  )

  install -Dm755 "$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname" 

  install -Dm644 "$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "${pkgdir:?}/usr/lib/$_pkgname/"

  install -Dm644 "$_pkgsrc/build/icon.png" "${pkgdir:?}/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "${srcdir:?}/$_pkgname.desktop" -t "${pkgdir:?}/usr/share/applications/"
}

# execute
_main_package
