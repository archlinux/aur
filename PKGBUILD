#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#_fragment="#tag=blendluxcore_v2.1beta2"
_name="luxcorerender"

pkgname=blender-plugin-${_name}-git
pkgver=2.7.beta1.r1.g51501293
pkgrel=1
pkgdesc="LuxCoreRender exporter plugin for Blender"
arch=('any')
url="https://luxcorerender.org/"
license=('GPL')
depends=(python-certifi python-requests python-numpy)
makedepends=(git)
conflicts=(blender-plugin-luxcorerender)
provides=(blender-plugin-luxcorerender)
source=("${_name}::git+https://github.com/LuxCoreRender/BlendLuxCore.git${_fragment}")
sha256sums=('SKIP')

pkgver() {
  git -C "${_name}" describe --long --tags --match blendluxcore_v* | sed 's/^blendluxcore_v//;s/\(alpha\|beta\|rc\)/\.\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends+=("blender>=2.80" "luxcorerender>=${pkgver%.r*}")
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=)')
  install -d -m755 "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons
  cp -a "${srcdir}/${_name}/" "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons
  # change the search path in exporter so it finds pylux in its new location :(previous solution was much better, what happen to blendlux )
  #sed -i 's|from.*import pylux|import pylux|' "$pkgdir/usr/share/blender/$_blender/scripts/addons/luxrender/outputs/pure_api.py"
# shellcheck disable=SC2013 # works until path has no white space.
  for file in $(grep -rl import\ pyluxcore "${pkgdir}") ; do sed -i 's/from .* import pyluxcore/import pyluxcore/g' "$file"; done
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/bin
  rm -rf "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${_name}/.{git,github,gitignore}
}

# vim:set ts=2 sw=2 et:
