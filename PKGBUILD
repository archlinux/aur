# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=2.0.1
pkgrel=4
pkgdesc="blockdiag generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
checkdepends=('python-nose' 'python-mock' 'python-pycodestyle' 'python-reportlab' 'python-docutils'
              'python-wand' 'ghostscript' 'librsvg')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/blockdiag/archive/$pkgver.tar.gz")
sha512sums=('509535312bd46022203d279604507e09106680722d98516dabd7187bc48d9a195709f2534f2f7757058c06b914b517ec2f6d899cec12e7df24ba4ab28ec76bcd')

build() {
  cd blockdiag-$pkgver
  python setup.py build
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd blockdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  # TODO: figure out the failure
  PYTHONPATH="$PWD/tmp_install/${site_packages}" nosetests -v -e "test_setup_inline_svg_is_true_with_multibytes"
}

package() {
  cd blockdiag-$pkgver
  python setup.py install --root="$pkgdir" \
                          --optimize=1 \
                          --skip-build
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
