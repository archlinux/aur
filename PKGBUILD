# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

# This is a bad PKGBUILD!

pkgname=doxy2man-git
pkgver=0.0.0.r12.5ce113f
pkgrel=1
pkgdesc="Create man pages from doxygen XML output"
arch=(x86_64)
url="https://github.com/gsauthof/doxy2man"
license=('GPL3')
depends=("qt5-base" "qt5-xmlpatterns")
makedepends=("asciidoc" "git")
provides=("doxy2man")
source=(${pkgname}::git+https://github.com/gsauthof/doxy2man.git)
md5sums=('SKIP')

pkgver() {
  # `git describe` can not be used because there are no tags in the GitHub
  # repository.
  cd "${srcdir}/${pkgname}"
  printf "0.0.0.r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's,/usr/share/asciidoc,/etc/asciidoc,' main.pro
  sed -i 's,doxy2man(8),doxy2man(1),' doxy2man.8.txt
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5
  make
  make doxy2man.8
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  cp doxy2man "${pkgdir}/usr/bin/"
  cp doxy2man.1 "${pkgdir}/usr/share/man/man1/doxy2man.1"
}
