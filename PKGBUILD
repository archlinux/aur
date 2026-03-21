# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>

pkgname=doclifter
pkgver=2.22
pkgrel=1
pkgdesc="Lift documents in {n,t}roff markups to XML-DocBook"
arch=('any')
url="http://www.catb.org/~esr/doclifter/"
license=('BSD-2-Clause' 'MIT-0')
depends=('python')
makedepends=('python' 'xmlto' 'gzip' 'asciidoctor')
optdepends=('groff: troff level support' 'plotutils: plotting utilities')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
"fix-makefile.patch"
"manlifter-outdir.patch")
sha256sums=('22e5da1a49ccdb59b54f65eab994d14a236fa16310e9e241f428dc9137d9f09d'
            'ae79d3c27a89a838593f1bd6ad58701f65c30f174f994f885f329b99f2db4dbb'
            '39ee2db950ce4c148a2dd28940beab11944142e402a2e450e65dea3a5b124e0b')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/fix-makefile.patch"
  patch -p1 < "${srcdir}/manlifter-outdir.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 doclifter "$pkgdir/usr/bin/doclifter"
  install -Dm755 manlifter "$pkgdir/usr/bin/manlifter"
  install -Dm644 doclifter.1 "$pkgdir/usr/share/man/man1/doclifter.1"
  install -Dm644 manlifter.1 "$pkgdir/usr/share/man/man1/manlifter.1"
  install -dm755 "$pkgdir/usr/share/doc/${pkgname}"
  install -m644 README* "$pkgdir/usr/share/doc/${pkgname}/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}

check() {
  cd "${pkgname}-${pkgver}"
  make check || true
}
