# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=molecular
_version=1.1.1
_fragment="#tag=${_version}"
_files=(descriptions.py __init__.py names.py operators.py properties.py simulate.py ui.py utils.py core*.so core.html)

pkgname=blender-plugin-${_name}
pkgver=1.1.1_r249.e4ef6a2
pkgrel=3
pkgdesc="Blender addon for advance particle physics, multithreaded."
arch=(i686 x86_64)
url="https://github.com/bartoszek/Blender-Molecular-Script.git"
license=('GPL')
makedepends=(git cython python-setuptools)
source=("${_name}::git+${url}${_fragment}"
        "python313.patch")
md5sums=('35a8d294b3f62d03192c4ad486dd209a'
         'e48e24a807f0879db57f4f8d52976f1e')

pkgver() {
  cd ${_name}
  printf "${_version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_name}
  git apply -v "${srcdir}"/python313.patch
}

build() {
  cd ${_name}/sources/
  sed -e "s/'-march=i686',//;s/\(core_3\)8/\19/;s/\(minor == \)8/\19/" -i setup.py
  python setup.py build_ext --inplace
  cp core*.so core.html -t ../${_name}
}

package() {
  depends=('blender>=2.80')
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=[.-])')
  cd ${_name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 "${addons}/${_name}"
  for file in "${_files[@]}"; do eval install -m644 "${_name}/${file}" "${addons}/${_name}"; done
}

# vim:set ts=2 sw=2 et:
