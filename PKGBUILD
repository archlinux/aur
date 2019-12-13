# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany
pkgname=${_gitname}-git
pkgver=1.36.0.r37.g5cc69b3d6
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="https://github.com/${_gitname}/${_gitname}"
license=('GPL2')
depends=('gtk3' 'python')
makedepends=('doxygen' 'git' 'intltool' 'python-lxml' 'python-docutils' 'vte3')
optdepends=(
    'geany-plugins: additional functionality'
    'vte3: enbedded terminal support'
)
conflicts=("${_gitname}" "${_gitname}-gtk3" "${_gitname}-gtk3-git")
provides=("${_gitname}" "${_gitname}=$pkgver")
source=(${_gitname}::git://github.com/${_gitname}/${_gitname}.git)
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"

  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Syntax highlighting for PKGBUILD files
  sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
}

build() {
  cd "${srcdir}/${_gitname}"

  export CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64"
  ./autogen.sh \
    --enable-api-docs \
    --enable-html-docs \
    --enable-gtk3 \
    --enable-gtkdoc-header \
    --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/${_gitname}"

  make check
}

package() {
  cd "${srcdir}/${_gitname}"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
