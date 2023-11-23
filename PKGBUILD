#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name="luxcorerender"

pkgname=blender-plugin-${_name}
pkgver=2.7
_rel="beta1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
epoch=2
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
source=("https://github.com/LuxCoreRender/BlendLuxCore/archive/blendluxcore_v${_pkgver}.tar.gz")
sha256sums=('9add31b93b5a6fb665a65aac93cf23e7740f028ab2df68706f33b4ef9e5fd156')

package() {
  depends=("blender>=2.80" "luxcorerender>=$pkgver")
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=)')
  install -d -m755 "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons
  cp -a "${srcdir}"/BlendLuxCore-blendluxcore_v${_pkgver} "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
# shellcheck disable=SC2013 # works until path has no white space.
  for file in $(grep -rl import\ pyluxcore "${pkgdir}") ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' "$file"; done
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/bin
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
