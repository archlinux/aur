# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=3.0.0
pkgrel=3
pkgdesc="blockdiag generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
checkdepends=('python-nose' 'python-pycodestyle' 'python-reportlab' 'python-docutils'
              'python-wand' 'ghostscript' 'librsvg')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/blockdiag/archive/$pkgver.tar.gz")
sha512sums=('9eb5aa0d78dd546feafccdf66dbedbc8b8addb97ffa45f18396bfb8e144be3acfaa4493baf680922af87ff64194424b7378367f177b1a59c3b3898b5c235623c')

build() {
  cd blockdiag-$pkgver
  python setup.py build
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd blockdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  # https://github.com/blockdiag/blockdiag/issues/165
  PYTHONPATH="$PWD/tmp_install/${site_packages}" nosetests -v -e "svg_sanitizes_url_on_error_test"
}

package() {
  cd blockdiag-$pkgver
  python setup.py install --root="$pkgdir" \
                          --optimize=1 \
                          --skip-build
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
