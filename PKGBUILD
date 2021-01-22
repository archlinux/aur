# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgbase=decklink
pkgname=(decklink mediaexpress)
_pkgname=decklink
pkgver=12.0
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/9e696d8929c44646a381855bf5c24d32"
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
        "01-fix-get_user_pages.patch"
        "02-fix-have_unlocked_ioctl.patch")
sha256sums=('e5a586ee705513cf5e6b024e1ec68621ab91d50b370981023e0bff73a19169c2'
            'bc392840141bc983603092dffe53fafe6fd1e0e92d06d792c4b55a920f606dc8'
            'd0ee2eb1c20107440cb95280186c395adfa346f59f730437fb87c7560b91e765')

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

