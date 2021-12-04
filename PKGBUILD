# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=seqdiag
pkgver=2.0.0
pkgrel=6
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
sha512sums=('ec4ebfc2822dd1b4dd65881b2199f512cab3ac3772451e87a1f798f36925ebb7b5824a8cd797d9e6f128698340c04e89ba226af37b02d40cf9b38638545af9bb'
            'de01e48df2ffbe3af30e810d74550e70bd176db6a2becfb61e44f67e2808662a10eb1348aed140b7dec10e56b3c8b17cc000184c7d9ea9203653ab9f52273710')
b2sums=('b35c3b289e4dff2105b84734967744c6693033664c5c5015d5f90976ae8002f18927124c8e679d0c1795aaa361afe7a837aa7bf29be090243ef2f2ce7a8739ba'
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
