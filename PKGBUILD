# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=cubesurfer
version=1.0
#fragment="#commit=7e49329 "
files=(__init__.py mciso*.so mciso*.html)

pkgname=blender-plugin-${name}
pkgver=1.0_r22.1d6d9a6
pkgrel=2
pkgdesc="IsoSurface mesher addons for Blender ( wrote in Cython )"
arch=(i686 x86_64)
url="http://pyroevil.com/category/scripts-addons/cubesurfece/"
license=('GPL')
depends=(blender)
makedepends=(git cython)
#options=(debug !strip)
source=("${name}::git+https://github.com/Pyroevil/CubeSurfer.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${name}
  sed -i "s|/O2|-O2|" setup64.py 
  sed -i "s|/openmp|-fopenmp|" setup64.py 
  sed -i "s|/fp:fast|-ffast-math|" setup64.py 

  python setup64.py build_ext --inplace
  cp mciso*.so mciso*.html -t ../
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  for file in  ${files[@]} ; do install -m644 ${file} ${addons}/${name}; done
}

# vim:set ts=2 sw=2 et:
