# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name="luxcorerender"

pkgname=blender-plugin-${_name}
pkgver=2.2
_rel="beta3"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
epoch=1
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
conflicts=(luxblend25 luxblend25-hg)
source=("https://github.com/LuxCoreRender/BlendLuxCore/archive/blendluxcore_v${_pkgver}.tar.gz")
sha256sums=('40a4727c2aa20cc610b00a0860ccd735cac39e658c157cb6a57fd630164369e3')

package() {
  depends=(blender luxcorerender)
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=)')
  install -d -m755 ${pkgdir}/usr/share/blender/${_blender}/scripts/addons
  cp -a ${srcdir}/BlendLuxCore-blendluxcore_v${_pkgver} ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
  for file in `grep -rl import\ pyluxcore ${pkgdir}` ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' $file; done
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/bin
  rm -rf ${pkgdir}/usr/share/blender/${_blender}/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
