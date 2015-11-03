# Maintainer: SpepS <dreamspepser at yahoo dot it>

_v=r17
_p=omegle
pkgname=pidgin-$_p
pkgver=$_v
pkgrel=1
pkgdesc="A plugin to use the omegle.com service in Pidgin"
arch=(i686 x86_64)
url="http://code.google.com/p/pidgin-omegle/"
license=('GPL')
depends=('json-glib' 'pidgin')
source=("http://pidgin-omegle.googlecode.com/svn-history/$_v/trunk/libomegle.c"
        "http://pidgin-omegle.googlecode.com/svn-history/$_v/trunk/libomegle.h"
        "http://pidgin-omegle.googlecode.com/svn-history/$_v/trunk/om_connection.c"
        "http://pidgin-omegle.googlecode.com/svn-history/$_v/trunk/om_connection.h"
        "$_p-16.png"
        "$_p-22.png"
        "$_p-48.png"
        "$_p.svg")
md5sums=('1467cce331515d1c062ce2253e7f8745'
         '7c8b987f1159972d68af6b70e978b81b'
         '3e5491b671c7a9963d388a6201cea475'
         '44d9cba461358f1319f7304df748d562'
         'a315958c69c37fea468cd540f8c04e04'
         '2fdd7e3a5ab5e3d7a9a75d2d1a608fb2'
         '6223cf15987fed7296fa3ef7c2b6b2c8'
         'c68267eeb0c2e49132b1ca82ece25d63')

build() {
  cd "$srcdir"

  gcc -c -fPIC -o libomegle.o libomegle.c `pkg-config --cflags pidgin json-glib-1.0`
  gcc -c -fPIC -o om_connection.o om_connection.c `pkg-config --cflags pidgin`
  gcc -shared -Wl libomegle.o om_connection.o -o omegle.so `pkg-config --libs json-glib-1.0`
}

package() {
  cd "$srcdir"

  # module
  install -Dm755 omegle.so "$pkgdir/usr/lib/purple-2/libomegle-1.so"

  # protocol icons
  for _s in 16 22 48; do
    install -Dm644 ../$_p-$_s.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/$_s/$_p.png"
  done;
  install -Dm644 ../$_p.svg "$pkgdir/usr/share/pixmaps/pidgin/protocols/scalable/$_p.svg"
}

# vim:set ts=2 sw=2 et:
