# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="redrock"
_templatesver="0.9"
pkgname=python-redrock
pkgver=0.20.3
pkgrel=1
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
sha256sums=('1c0fbaf7550f109dca662da9010cf69fe46f4c11facb22a49f54695ff1b2e7a8'
            '312151408979f6064505bd2dcc8e881e94abe0ad4e8f94ead154a9328fce8bff')

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

