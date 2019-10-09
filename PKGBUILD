# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name="luxcorerender"
_fragment="#branch=2_79_maintenance"

pkgname=blender-2.7-plugin-${_name}
pkgver=2.2beta2.r24.ga5d7d33
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender 2.7"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
conflicts=(luxblend25 luxblend25-hg)
makedepends=(git)
source=("${_name}::git+https://github.com/LuxCoreRender/BlendLuxCore.git${_fragment}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  [ -v _ver_tag ] && printf %s.r%s.g%s ${_ver_tag#blendluxcore_v} $(git rev-list ${_ver_tag}..HEAD --count) $(git log --pretty=format:'%h' -n 1) \
                  || git describe --long --tags | sed 's/^blendluxcore_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends=(blender-2.7 luxcorerender)
  _blender="2.79"
  install -d -m755 ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  cp -a ${srcdir}/${_name} ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
  for file in `grep -rl import\ pyluxcore ${pkgdir}` ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' $file; done
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/bin
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
