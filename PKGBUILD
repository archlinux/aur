# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=piplib-git
pkgver=1.4.0.r39.77aca10
pkgrel=3
pkgdesc="Parametric Integer Programming Library"
arch=(x86_64)
url="http://www.piplib.org/"
license=('LGPL')
depends=("gmp")
makedepends=("git")
provides=("piplib")
conflicts=("piplib")
source=(${pkgname}::git+https://github.com/periscop/piplib.git)
md5sums=('SKIP')

pkgver() {
  # `git describe` can not be used because there are no tags in the GitHub
  # repository.
  # Commit f4fd1118b9031049d0ced306b6914517c5ac6f18 is version 1.4.0.
  cd "${srcdir}/${pkgname}"
  printf "1.4.0.r%s.%s" \
      "$(git rev-list --count f4fd1118b9031049d0ced306b6914517c5ac6f18..HEAD)" \
      "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr --with-gmp=system
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  for lib in ${pkgdir}/usr/lib/libpiplib*.so*; do
    lib=$(basename "${lib}")
    old_name=$(echo "${lib}" | sed 's/_sp/32/;s/_dp/64/;s/_gmp/MP/')
    ln -s "${lib}" "${pkgdir}/usr/lib/${old_name}"
  done
}
