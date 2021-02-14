# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-b2sdk
_pkgname=b2sdk
pkgver=1.3.0
pkgrel=1
pkgdesc='Python library to access B2 cloud storage.'
arch=(any)
url='https://github.com/Backblaze/b2-sdk-python'
license=('MIT')
depends=('python'
         'python-arrow>=0.8.0'
         'python-logfury>=0.1.2'
         'python-requests>=2.9.1'
         'python-setuptools'
         'python-tqdm>=4.5.0'
        )

source=("https://files.pythonhosted.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('af53e2449414b772a0bd6fad311d98a171c3693f77ebca933499946e786715ae')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # This requriement seems overly complex, losen the
  sed -i -e 's:\(arrow>=.*\),<0\.13.*:\1<=0.13.*:' requirements.txt

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   # https://wiki.archlinux.org/index.php/Python_package_guidelines
   local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
   rm -rf "${pkgdir}${site_packages}/test"
}
