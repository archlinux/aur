# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')
_name="luxcorerender"

pkgname=blender-plugin-${_name}
pkgver=2.1.beta3
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="http://www.luxrender.net/"
license=('GPL')
depends=(blender luxcorerender)
conflicts=(luxblend25 luxblend25-hg)
source=("https://github.com/LuxCoreRender/BlendLuxCore/archive/blendluxcore_v2.1beta3.tar.gz")
md5sums=('de64a28212719e55386c4721093947c3')

package() {
  cd ${srcdir}/BlendLuxCore-blendluxcore_v2.1beta3/
  install -d -m755 ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  cp -a ${srcdir}/BlendLuxCore-blendluxcore_v2.1beta3// ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
  for file in `grep -rl import\ pyluxcore ${pkgdir}` ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' $file; done
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/bin
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
