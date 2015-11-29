# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=valyria-tear-git
pkgver=2909.a716ac3
pkgrel=1
pkgdesc="An attempt at creating a free (as meant in the Gnu Public License) J-RPG game."
arch=('i686' 'x86_64')
url="http://valyriatear.blogspot.fr"
license=('GPL')
depends=('sdl2_ttf' 'sdl2_image' 'openal' 'libvorbis' 'glew' 'gettext' 'lua51' 'boost')
conflicts=('valyria-tear')
provides=('valyria-tear')
source=("git+https://github.com/Bertram25/ValyriaTear.git"
        "valyriatear.sh")
md5sums=('SKIP'
         '58e22a465857ab39b27827d8cbc4f324')

pkgver() {
  cd $srcdir/ValyriaTear
  # the tags currently in repository are not useful for versioning
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/ValyriaTear
  git submodule update --init --remote
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLUA_LIBRARIES=/usr/lib/liblua5.1.so -DLUA_INCLUDE_DIR=/usr/include/lua5.1/ .
  make
}

package() {
  cd $srcdir/ValyriaTear
  make install DESTDIR=$pkgdir
  install -d $pkgdir/usr/lib
  # Provide wrapper to load data from /usr/share/valyriatear https://github.com/ValyriaTear/ValyriaTear/issues/505
  mv $pkgdir/usr/{bin,lib}/valyriatear
  install -m755 $srcdir/valyriatear.sh $pkgdir/usr/bin/valyriatear
}
