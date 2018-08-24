# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=molecular
version=1.03
#fragment="#commit=7e49329 "
files=(__init__.py cmolcore*.so cmolcore*.html)
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}
pkgver=1.03_r193.7f8282e
pkgrel=2
pkgdesc="Blender addon for advance particle physics, multithreaded."
arch=(i686 x86_64)
url="http://pyroevil.com/category/scripts-addons/molecular-script/"
license=('GPL')
depends=(blender)
makedepends=(git cython)
source=("${name}::git+https://github.com/Pyroevil/Blender-Molecular-Script.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${name}/${name}/sources/
  sed -i "s/'-march=i686',//" setup.py 
  python setup.py build_ext --inplace
  cp cmolcore*.so cmolcore*.html -t ../
}

package() {
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  for file in  ${files[@]} ; do install -m644 ${name}/${file} ${addons}/${name}; done
}

# vim:set ts=2 sw=2 et:
