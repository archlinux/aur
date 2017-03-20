# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=candl-git
pkgver=0.6.2.r73.ad0fa5a
pkgrel=1
pkgdesc="Data Dependence Analysis Tool in the Polyhedral Model"
arch=(x86_64)
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/candl/"
license=('LGPL3')
depends=("gmp" "isl" "osl" "piplib-git")
provides=("candl")
source=(
  ${pkgname}::git+https://github.com/periscop/candl.git
  configure.ac.patch
)
md5sums=(
  'SKIP'
  '02f099e2c18447128f863b16e013a122'
)

pkgver() {
  # `git describe` can not be used because there are no tags in the GitHub
  # repository. Commit 5db92063d176980bbb1c51b6974440069d440409 was tagged
  # '0.6.2' in the old git repository (http://repo.or.cz/candl.git/).
  cd "${srcdir}/${pkgname}"
  printf "0.6.2.r%s.%s" \
      "$(git rev-list --count 5db92063d176980bbb1c51b6974440069d440409..HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -i "${srcdir}/configure.ac.patch" "configure.ac"
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -i
  ./configure \
      --prefix=/usr \
      --with-gmp=system \
      --with-osl=system \
      --with-piplib=system \
      --enable-mp-version
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  # Run sequentially the tests because there is a race condition on the tests.
  make -j 1 check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
