# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=graphqlmap
pkgname=graphqlmap-git
pkgver=r44.87b5626
pkgrel=3
pkgdesc="scripting engine to interact with a GraphQL endpoint for pentesting purposes"
arch=('any')
url="https://github.com/swisskyrepo/GraphQLmap"
license=('MIT')
depends=(
  'python'
  'python-setuptools'
  'python-argparse'
  'python-requests'
)
makedepends=(
  'git'
)
provides=("$_pyname")
conflicts=(graphqlmap)
options=(!emptydirs)
source=(
	git://github.com/swisskyrepo/$_pyname.git
  setup.py
)
sha512sums=('SKIP'
            'f8298ccecb9010627a80e12ae736ba2d7b4526bd668585cbc8a3cb1245866d1ea1d762e69511ce55c04824138f4c9bcaddf7c96149efd24f191ca06147633346')

pkgver() {
  cd "$_pyname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pyname"
  sed -i "s#from attacks#from graphqlmap.attacks#" graphqlmap.py
  sed -i "s#from utils#from graphqlmap.utils#" attacks.py
  mkdir bin
  mv graphqlmap.py bin/graphqlmap
  mkdir graphqlmap
  mv *.py graphqlmap/
  touch graphqlmap/__init__.py
  mv ../setup.py .
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
