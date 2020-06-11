#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#_fragment="#tag=blendluxcore_v2.1beta2"
_name="luxcorerender"
_ver_tag="blendluxcore_v2.2"

pkgname=blender-plugin-${_name}-git
pkgver=2.2.r3.gd23ab33
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
makedepends=(git)
conflicts=(luxblend25 luxblend25-hg blender-plugin-luxcorerender)
provides=(blender-plugin-luxcorerender)
source=("${_name}::git+https://github.com/LuxCoreRender/BlendLuxCore.git${_fragment}")
md5sums=("SKIP")

pkgver() {
  cd ${srcdir}/${_name}
  [ -v _ver_tag ] && printf %s.r%s.g%s ${_ver_tag#blendluxcore_v} $(git rev-list ${_ver_tag}..HEAD --count) $(git log --pretty=format:'%h' -n 1) \
                  || git describe --long --tags | sed 's/^blendluxcore_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends=('blender>=2.80' 'luxcorerender>2:2.2')
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=)')
  install -d -m755 ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  cp -a ${srcdir}/${_name}/ ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
  for file in `grep -rl import\ pyluxcore ${pkgdir}` ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' $file; done
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/bin
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
