# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Maintainer: Micael Dias

_fragment="#tag=blendluxcore_v2.0"
_blender=$(expac -S %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')
_name="luxcorerender"

pkgname=blender-plugin-luxcorerender
pkgver=2.0.r0.gbb9c5ee
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="http://www.luxrender.net/"
license=('GPL')
depends=(blender luxcorerender)
makedepends=(git expac)
conflicts=(luxblend25 luxblend25-hg)
source=("${_name}::git+https://github.com/LuxCoreRender/BlendLuxCore.git${_fragment}")
md5sums=("SKIP")

pkgver() {
  cd ${srcdir}/${_name}
  git describe --long --tags | sed 's/^blendluxcore_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_name}
  install -d -m755 ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  cp -a ${srcdir}/${_name}/ ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
  for file in `grep -rl import\ pyluxcore ${pkgdir}` ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' $file; done
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/bin
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
