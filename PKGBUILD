# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=seqdiag
pkgver=3.0.0
pkgrel=2
pkgdesc="Sequence-diagram images from .diag files"
arch=('any')
url="https://blockdiag.com/en/seqdiag/index.html"
license=('Apache')
depends=('blockdiag')
checkdepends=('python-docutils' 'python-nose' 'python-pycodestyle' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/seqdiag/archive/$pkgver.tar.gz"
  "${pkgname}-2.0.0-remove_broken_test.patch"
)
sha512sums=('f2f70ed86a970d0e949092b1c49681073526daa8c06cf7ec6b09042f5194b9549924911751a5b83695f6179759eb5ffb3a40962ef379a69aeaa7d43ae84b0287'
            'de01e48df2ffbe3af30e810d74550e70bd176db6a2becfb61e44f67e2808662a10eb1348aed140b7dec10e56b3c8b17cc000184c7d9ea9203653ab9f52273710')
b2sums=('e633cfb895a1c7a753513acdda14f3cd460ea6a9cd41d245667322b6cfa482aff57ab7e9272724f776060c88c9dcf583095164cd084c35d32ed393c4ac0a3ad5'
        '4bcb3227ea42fc0b4951ad8605f14949e13eec697f89687b0b98c844a2260eabb3dac74c0d33d0bc4984705fd9b5aea771f729845e4adaa47b35efbbb328bf34')

prepare() {
  cd seqdiag-$pkgver
  # remove a broken test, that fails due to wrong font:
  # https://github.com/blockdiag/seqdiag/issues/51
  patch -Np1 -i ../"${pkgname}-2.0.0-remove_broken_test.patch"
}

build() {
  cd seqdiag-$pkgver
  python setup.py build
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd seqdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/${site_packages}" nosetests -v
}

package() {
  cd seqdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
