# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname="itex2mml"
pkgver=1.6.1
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1')
depends=('gcc-libs' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.gz")
source=("${_pkgsrc}.tar.gz::https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz")
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components=2 -C "${srcdir}/${_pkgsrc}" "itexToMML/itex-src"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components=1 -C "${srcdir}/${_pkgsrc}" "itexToMML/README"
  
  cd "${_pkgsrc}"
  sed -i "s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
  sed -i "s/\$(CXX) \$(CFLAGS)/ \$(CXX) ${CFLAGS} ${LDFLAGS}/" Makefile
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -d "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
