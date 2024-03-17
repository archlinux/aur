# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="redrock"
_templatesver="0.8.1"
pkgname=python-redrock
pkgver=0.17.9
pkgrel=2
pkgdesc="Redshifting fitting for spectroperfectionism"
arch=(any)
url="https://github.com/desihub/redrock"
license=('custom')

depends=('python-fitsio' 'python-setuptools' 'python-numba' 'python-healpy'
         'python-requests')
optdepends=("python-empca: for templates"
            "python-desiutil: for extended functionality"
            "python-desispec: for extended functionality")
backup=('etc/redrock.module')

source=("$_pkgname-$pkgver"::"https://github.com/desihub/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"$_pkgname-templates-$_templatesver"::"https://github.com/desihub/${_pkgname}-templates/archive/refs/tags/${_templatesver}.tar.gz")
sha256sums=('e1b4bc59d972094dbbbbc6baee2b994af25e1d20de38341e49945dc67b1cf4f4'
            '6f2cbf5758329e69d25a3c1440528baff53e260603a6408f71f65d1bcf210d45')

prepare()
{
  cd "$srcdir/${_pkgname}-$pkgver"
  mkdir -p "py/redrock/templates"
  cp -rf "$srcdir/${_pkgname}-templates-${_templatesver}"/* "py/redrock/templates" 
  sed -e "s/^setup_keywords\['use_2to3'\]/#setup_keywords['use_2to3']/g" -i "setup.py"
}

build()
{
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
  python setup.py install --root="$pkgdir"
}

