# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgname=decklink
pkgver=10.11.4
pkgrel=2
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/f9a1f5fda76447838a8d0e5fb363dcd8"
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
sha256sums=("f6ef48313309a0a06e54a66e2bfd1421ff6ece93394045d2fc23669e6fbc9e0f")

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  chmod 755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  tar xf desktopvideo-*-${_arch}.tar.gz
  cp -a desktopvideo-*-${_arch}/* $pkgdir
  rm -rf $pkgdir/usr/sbin

  sed -ir 's/\.a/.o/' $pkgdir/usr/src/blackmagic-*/Makefile
  mv $(echo $pkgdir/usr/src/blackmagic-$pkgver*)/bmd-support.{a,o_shipped}
  mv $(echo $pkgdir/usr/src/blackmagic-io-$pkgver*)/blackmagic.{a,o_shipped}

  find ${pkgdir} -name dkms.conf -exec sed -i 's|POST_INSTALL="../../lib/blackmagic/blackmagic-loader $PACKAGE_NAME $PACKAGE_VERSION"||' {} \;

  tar xf mediaexpress-*-${_arch}.tar.gz
  cp -a mediaexpress-*-${_arch}/* $pkgdir
}

