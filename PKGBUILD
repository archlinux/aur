# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname="itex2mml"
pkgver=1.6.1
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version')
depends=('glibc' 'gcc-libs')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::http://golem.ph.utexas.edu/~distler/blog/files/itexToMML.tar.gz"
        "${pkgname}_fix_makefile.patch")
noextract=("${_pkgsrc}.tar.gz")
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f'
            '88905ddf2aa4add02ba100afa71b209f1f9eae51e26239b1590de7b4df407c75')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}"
  
  cd "${_pkgsrc}/itex-src"
  sed -i "s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  
  cd "itex-src"
  install -d "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
