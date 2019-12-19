# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=molecular
_version=1.1.1
_fragment="#tag=${_version}"
_files=(descriptions.py __init__.py names.py operators.py properties.py simulate.py ui.py utils.py core*.so core.html)

pkgname=blender-plugin-${_name}
pkgver=1.1.1_r249.e4ef6a2
pkgrel=1
pkgdesc="Blender addon for advance particle physics, multithreaded."
arch=(i686 x86_64)
url="https://github.com/bartoszek/Blender-Molecular-Script.git"
license=('GPL')
makedepends=(git cython)
source=("${_name}::git+${url}${_fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${_name}
  printf "${_version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_name}/sources/
  sed -i "s/'-march=i686',//" setup.py 
  python setup.py build_ext --inplace
  cp core*.so core.html -t ../${_name}
}

package() {
  depends=('blender>=2.80')
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')
  cd ${_name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 "${addons}/${_name}"
  for file in "${_files[@]}"; do eval install -m644 "${_name}/${file}" "${addons}/${_name}"; done
}

# vim:set ts=2 sw=2 et:
