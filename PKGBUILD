# Maintainer: Omar Ahmad <omar.squircleart@gmail.com>
pkgname=animation-nodes-git
pkgver=2.0.1.r4629.ed9873f4
pkgrel=1
pkgdesc="Node based visual scripting system designed for motion graphics in Blender."
arch=('any')
url="https://github.com/JacquesLucke/animation_nodes"
license=('GPL')
depends=('blender' 'python-numpy')
makedepends=('sed' 'cython')
source=('git+https://github.com/JacquesLucke/animation_nodes.git#branch=cython')
md5sums=('SKIP')

pkgver() {
  cd "animation_nodes"
  echo $(sed -n 's/ *"version":[^(]*(\([0-9]*\), \([0-9]*\), \([0-9]*\).*/\1.\2.\3/p' animation_nodes/__init__.py).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
  cd "animation_nodes"
  sed -i 's/5/6/g' "setup.py"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  echo addonsDirectory = r"'$pkgdir/usr/share/blender/$_blender_version/scripts/addons'" > config.default.py
}
package() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  mkdir -p ${pkgdir}/usr/share/blender/$_blender_version/scripts/addons
  python setup.py --all
}
