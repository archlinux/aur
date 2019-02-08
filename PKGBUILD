# Maintainer: Harenome Ranaivoarivony-Razanajato <ranaivoarivony-razanajato@hareno.me>

pkgname=aftermath-git
pkgver=r625.6c0552e
pkgrel=2
pkgdesc="Aftermath: Trace-based performance analysis for OpenMP and OpenStream"
arch=('x86_64')
url="https://aftermath-tracing.com/"
license=('GPL2' 'LGPL2.1' 'FDL1.3')
depends=("libglade")
makedepends=("python2-numpy")
provides=("aftermath")
source=(${pkgname}::git://git.drebesium.org/aftermath.git#branch=staging)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # We use the number of commits and the last commit hash because:
  # - the repository has no tag.
  # - there is no reference to a version number in the source code.
  printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  # We run this twice because of an error with automake.
  autoreconf -fi || autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
