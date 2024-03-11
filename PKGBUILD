# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgbase=decklink
pkgname=(decklink mediaexpress)
_pkgname=decklink
pkgver=12.8.1
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/0636d85539fd4446a24f5952223cc1ec"
_pkgsrc_file=${_pkgname}-${pkgver}.tar.gz

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

source=("${_pkgsrc_file}"::"${_pkgsrc_url}"
  "01-addMutex.patch"
  "02-changeMaxOrder.patch"
    )
sha256sums=('aff42d039fe1d1fbe5c5df61f0b2434a75067a4e3c861a705dff5f4083e60c02'
            'ccbe3ede7302553e00cab2fc11e4c2f974a22b8b7be602f2d4f479f13b45506b'
            'eebbccb9d8165e1a048650975b1bddd29569c35e5bbd79fb5dc6ea9688261f49')

prepare() {
  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  tar xf desktopvideo-*-${_arch}.tar.gz

  cd desktopvideo-*/usr/src

  for p in ${srcdir}/*.patch;
  do
    echo "Applying ${p}"
    patch --forward --strip=1 --input="${p}"
  done

}

package_decklink() {
  install=decklink.install
  depends=('dkms' 'qt5-base' 'libpng')

  mkdir -p "$pkgdir/usr/share/licenses/$pkgbase"
  chmod 755 "$pkgdir/usr/share/licenses/$pkgbase"
  ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgbase/DesktopVideo"

  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  cp -a desktopvideo-*-${_arch}/* $pkgdir
  rm -rf $pkgdir/usr/sbin

  chmod 755 "$pkgdir/usr"
  chmod 755 "$pkgdir/usr/share"
  chmod 755 "$pkgdir/usr/share/doc"
}

package_mediaexpress() {
  depends=('glu' 'qt5-base' 'qt5-svg' 'libpng' 'decklink')

  mkdir -p "$pkgdir/usr/share/licenses/$pkgbase"
  chmod 755 "$pkgdir/usr/share/licenses/$pkgbase"
  ln -s /usr/share/doc/mediaexpress/License.txt "$pkgdir/usr/share/licenses/$pkgbase/MediaExpress"

  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  tar xf mediaexpress-*-${_arch}.tar.gz
  cp -a mediaexpress-*-${_arch}/* $pkgdir

  chmod 755 "$pkgdir/usr"
  chmod 755 "$pkgdir/usr/share"
  chmod 755 "$pkgdir/usr/share/doc"
}

