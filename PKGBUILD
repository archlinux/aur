# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=blender-plugin-animation-nodes-git
pkgver=2.1.5.r5344.b75b9435
pkgrel=1
pkgdesc="Node based visual scripting system designed for motion graphics in Blender."
arch=('any')
url="https://animation-nodes.com/"
license=('GPL')
depends=('blender' 'python-numpy')
makedepends=('git' 'sed' 'cython')
source=('git+https://github.com/JacquesLucke/animation_nodes.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "animation_nodes"
  echo $(sed -n 's/ *"version":[^(]*(\([0-9]*\), \([0-9]*\), \([0-9]*\).*/\1.\2.\3/p' animation_nodes/__init__.py).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  echo "{\"Copy Target\" : \"$pkgdir/usr/share/blender/$_blender_version/scripts/addons\"}" > conf.json
}
package() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  mkdir -p $pkgdir/usr/share/blender/$_blender_version/scripts/addons
  python setup.py build --copy --noversioncheck
}
