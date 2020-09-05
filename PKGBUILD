# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=gimp-elsamuko-git
pkgver=r84.d64e603
pkgrel=1
pkgdesc='Varoius Gimp scripts and plugins made by elsamuko'
arch=('i686' 'x86_64')
url='https://github.com/elsamuko/gimp-elsamuko'
license=('GPL3')
groups=()
depends=(gimp)
makedepends=(git)
optdepends=()
conflicts=(gimp-elsamuko-plugins gimp-elsamuko-scripts)
source=("git+$url")
_gitname='gimp-elsamuko'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
build(){
  msg2 "Building get-curves plugin"
  cd "$srcdir/$_gitname/plugins/elsamuko-get-curves"
  gimptool --build elsamuko-get-curves.c

  msg2 "Building depthmap-cv plugin TODO"
  cd "$srcdir/$_gitname/plugins/elsamuko-depthmap-cv"
#   TODO:  ld: undefined reference to symbol '_ZTIPKc@@CXXABI_1.3'
#   ld: /usr/lib/libstdc++.so.6: error adding symbols: DSO missing from command line
#   export CFLAGS="-I/usr/include/opencv4"
#   gimptool --build elsamuko-depthmap-cv.cpp

  msg2 "Building saturation plugin"
  cd "$srcdir/$_gitname/plugins/elsamuko-saturation"
  gimptool --build elsamuko-saturation.c
}
package(){
  cd "$srcdir"/$_gitname
  _base_dir="$pkgdir/usr/share/gimp/2.0"
  _scripts_dir="$_base_dir/scripts"
  _plugins_dir="$_base_dir/plug-ins"

  msg2 "Installing scripts"
  install -dm755 "$_scripts_dir"
  for script in scripts/*; do 
    install -Dm755 $script "$_base_dir/$script"
  done

  msg2 "Installing plugins"
  install -dm755 "$_plugins_dir"
  cd "$srcdir/$_gitname/plugins/elsamuko-get-curves"
  install -Dm755 elsamuko-get-curves "$_plugins_dir/"

  cd "$srcdir/$_gitname/plugins/elsamuko-saturation"
  install -Dm755 elsamuko-saturation "$_plugins_dir/"
}
