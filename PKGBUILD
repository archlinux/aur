# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=seqdiag
pkgver=2.0.0
pkgrel=4
pkgdesc="seqdiag generates sequence-diagram images from .diag files"
url="http://blockdiag.com/en/seqdiag/index.html"
license=('Apache')
arch=('any')
depends=('blockdiag')
checkdepends=('python-docutils' 'python-nose' 'python-pycodestyle' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/seqdiag/archive/$pkgver.tar.gz")
sha512sums=('ec4ebfc2822dd1b4dd65881b2199f512cab3ac3772451e87a1f798f36925ebb7b5824a8cd797d9e6f128698340c04e89ba226af37b02d40cf9b38638545af9bb')

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
  python setup.py install --root="$pkgdir" \
                          --optimize=1 \
                          --skip-build
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
