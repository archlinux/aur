# Maintainer: Matthias Ellmer <matthias at x four eight dot org but eight is really nine>
pkgname=groopsgui-git
pkgver=r24.55a6c54
pkgrel=1
pkgdesc="A graphical user interface to create and edit groops configuration files."
arch=('x86_64')
url="https://github.com/groops-devs/groops"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake' 'gcc')
optdepends=()
install=post.install
source=('groopsgui::git+https://github.com/groops-devs/groops.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  qmake -o "${pkgname}-${pkgver}/build/Makefile" \
    "${pkgname%-git}/gui/groopsGui.pro" \
    GROOPSDIR="${pkgname%-git}" \
    DESTDIR=""

  make -C ${pkgname}-${pkgver}/build
}

package() {
  # binary
  install -D -m755 "${pkgname}-${pkgver}/build/groopsGui" -t "${pkgdir}/usr/bin"

  # license
  install -D -m644 "${pkgname%-git}/LICENSE"    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # schema
  install -D -m644 "${pkgname%-git}/groops.xsd" -t "${pkgdir}/usr/share/${pkgname}"

  # documentation
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R "${pkgname%-git}/docs/"* "${pkgdir}/usr/share/doc/${pkgname}"
  chmod -R "u=rwX,g=rX,o=rX" "${pkgdir}/usr/share/doc/${pkgname}"
}
