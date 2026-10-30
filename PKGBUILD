# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com> Théo Le Calvar <tlc@kher.nl>
pkgbase=decklink
pkgname=(decklink mediaexpress)
_pkgname=decklink
pkgver=16.5
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

_pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/010c6a33d6d54705914513986e480db8"
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
sha256sums=('5cd2e24d732c1cd969c7a364b12798d4e55955870faf558758cbed992fd3ebd1'
            '1e4085d79462defb5d19720b04072ba3601fc09e4428a5f836c2ea2ba2e6fba7'
            '465bb6d619b49c72273e2979abe7621ae6d8be3f2af37664c867b149051601e4')

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

