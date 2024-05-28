# Maintainer:  dreieck
# Contributor: Manuel Palenzuela <sadshinobi@protonmail.com>

author=troglobit
pkgname=sun-git
_gitname=sun
pkgver=1.1+13.r68.20190928.5fa5be2
pkgrel=1
pkgdesc='Simple library and application that shows sunset and sunrise based on your latitude,longitude'
url='https://github.com/troglobit/sun.git'
arch=('i686' 'x86_64' 'aarch64')
license=('LicenseRef-FreeSoftware')
depends=(
  'glibc'
)
makedepends=(
  'autoconf'
  'automake'
  'libtool'
  'git'
)
conflicts=('sun')
provides=("sun=${pkgver}")

source=("${_gitname}::git+https://github.com/$author/$_gitname.git")

sha256sums=('SKIP')

prepare() {
  cd "$_gitname"

  NOCONFIGURE=1 ./autogen.sh
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "$_gitname"

  _ver="$(git describe --long --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$_gitname"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/sun" README.md "${srcdir}/git.log"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
