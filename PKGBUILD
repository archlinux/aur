# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgbase=decklink
pkgname=(decklink mediaexpress)
_pkgname=decklink
pkgver=15.3
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/0d37a837bbfd457cacb29001473f9cb0"
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
        "01-makefile-clang.patch"
        "02-remove-dkms-warnings.patch"
    )
sha256sums=('f8099aa6c7afbbf646e19f15a933b77bf846071f9e092db877e2586be34c32c0'
            '8f98921632d70dbafc851b62f5ecb915320ec367dbdf60f58e4aae3590793b46'
            'c8ff10507944da9b2271fcc59a1d26d8755bd00105ed481e9300ee9b786659e5')

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

