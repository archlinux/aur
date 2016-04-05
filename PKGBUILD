# Maintainer: Ross Harrison <rtharrison86@gmail.com>

pkgname=gameplay3d
pkgver=3.0.0
pkgrel=1
pkgdesc="Open-source, cross-platform, C++ game framework/engine for creating 2D/3D mobile and desktop games."
arch=('any')
url="https://github.com/gameplay3d/GamePlay"
license=('Apache 2.0')
depends=('gcc' 'cmake' 'unzip')

source=("$pkgname"::'git+https://github.com/gameplay3d/GamePlay.git'
        "path.patch")
sha512sums=('SKIP'
 'f8e96b9de2cb57ace265465e3d02c7314e58dc73bca91b417a1517d24106e042bed67edd5e4ddedf6a36aea2ecdb70e85baab50bc0cabbd9434ff5852474ec68')

# Path fix here
prepare() {
  local _p
  for _p in *.patch; do
   [[ -e $_p ]] || continue
   msg2 "Applying $_p"
   patch -p1 -d $pkgname < "$_p"
  done
}

build() {
  cd $srcdir/$pkgname

  # install dependencies
  ./install.sh

  # build
  rm -fr build
  mkdir build
  cd build
  cmake ..
  
  # adjust this part according to your environment
  make # -j12
}

# Since this is a self-containing development kit,
# I choose to pack this into /opt.
package(){
  mkdir -p $pkgdir/opt
  cp -r $srcdir/$pkgname $pkgdir/opt/
  
  # An intuitive use of this package is to execute newproject script,
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/$pkgname/newproject.sh $pkgdir/usr/bin/gameplay3d

  echo "execute gameplay3d to new your project!"
}
