# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=MPDCon
pkgname=mpdcon.app
pkgrel=1
pkgver=1.5.1
pkgdesc='A client for the Music Player Daemon (MPD)'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/gap/mpdcon/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'sqlclient' 'libmpdclient')
makedepends=('gcc-objc' 'gnustep-make' 'libbsd')
source=("http://savannah.nongnu.org/download/gap/MPDCon-1.5.1.tar.gz")
sha256sums=('24afca2f8bee967849e28d046dcfc364e26d2dd26ab3c027de2987c89b7ee8da')

prepare() {
  # Makefile is bash-incompatible, we enforce libbsd
  cd "$_pkgname-$pkgver"
  sed -i "s/"\${LIBBSD_CPPFLAGS}"/-DNEED_BSD_H=yes/g" GNUmakefile.preamble
  sed -i "s/"\${LIBBSD_LDFLAGS}"/-lbsd/g" GNUmakefile.preamble
}

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
