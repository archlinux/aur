# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgname=decklink
pkgver=11.4
pkgrel=2
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt5-base' 'qt5-svg' 'dkms')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/14b0524fb0dc4115b89847530192f9f8"
_pkgsrc_file=${pkgname}-${pkgver}.tar.gz

DLAGENTS=("https::/usr/bin/curl \
              -o %o \
              -H Referer:\ %u \
              $(curl \
                  -s \
                  -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0" \
                  -H 'Content-Type: application/json;charset=utf-8' \
                  --data "{\"country\":\"us\",\"platform\":\"Linux\"}" \
                  "${_pkgsrc_url}" \
              )"
)

source=("${_pkgsrc_file}"::"${_pkgsrc_url}")
sha256sums=('20140faf551c5ee0cb99f3b75e465de6c795b11931db9b5902d4ef100153d692')

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  chmod 755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  tar xf desktopvideo-*-${_arch}.tar.gz
  cp -a desktopvideo-*-${_arch}/* $pkgdir
  rm -rf $pkgdir/usr/sbin

  tar xf mediaexpress-*-${_arch}.tar.gz
  cp -a mediaexpress-*-${_arch}/* $pkgdir

  chmod 755 "$pkgdir/usr"
  chmod 755 "$pkgdir/usr/share"
  chmod 755 "$pkgdir/usr/share/doc"
}

