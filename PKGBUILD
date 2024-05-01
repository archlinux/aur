# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=mangl
pkgver=1.1.4
pkgrel=1
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'glfw' 'libgl' 'freetype2')
optdepends=('fontconfig: set custom font')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eb3dbe4ebd6110d2047fa68f065989b7d1ca20211a3cafc5c5dcbad9e2ebff50')

prepare() {
  cd "${pkgname}-${pkgver}"

  echo "PREFIX=\"/usr\"" >> mandoc/configure.local
  echo "MANDIR=\"\${PREFIX}/share/man\"" >> mandoc/configure.local

  sed -i "s:/usr/share:\${DESTDIR}/usr/share:" Makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure && make
}

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  mkdir -p "${pkgdir}/usr/share/applications"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
