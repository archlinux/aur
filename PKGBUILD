#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name="luxcorerender"

pkgname=blender-plugin-${_name}
pkgver=2.3
epoch=2
pkgrel=2
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
source=("https://github.com/LuxCoreRender/BlendLuxCore/archive/blendluxcore_v${pkgver}.tar.gz"
        "denoise.patch")
sha256sums=('a5ea3dbac4e56decef5561ceb456be3eb6658111dd8feed55d632a52bfd7edaa'
            '118853c17d90f034e0f6e3b1e07f7d3042bc7c706c46cfb3c2dd13242e1c6ce0')

prepare() {
  cd "${srcdir}/BlendLuxCore-blendluxcore_v${pkgver}"
  patch -Np1 -i "${srcdir}/denoise.patch"
}

package() {
  depends=("blender>=2.80" "luxcorerender>$pkgver")
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=)')
  install -d -m755 "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons
  cp -a "${srcdir}"/BlendLuxCore-blendluxcore_v${pkgver} "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
# shellcheck disable=SC2013 # works until path has no white space.
  for file in $(grep -rl import\ pyluxcore "${pkgdir}") ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' "$file"; done
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/bin
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
