# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com>
pkgname=decklink
pkgver=10.11.4
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/f9a1f5fda76447838a8d0e5fb363dcd8"
pkgsrc_file=$pkgname-${pkgver}.tar.gz
pkgsrc_sha256sum="f6ef48313309a0a06e54a66e2bfd1421ff6ece93394045d2fc23669e6fbc9e0f"

prepare() {
  if [ -f $pkgsrc_file ]; then
    echo "File $pkgsrc_file found, skipping download"
  else
    echo "Downloading package"
    temp_url=`curl $pkgsrc_url -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0' -H 'Content-Type: application/json;charset=utf-8' --data '{"country":"us","platform":"Linux"}'`
    curl -o $pkgsrc_file $temp_url
  fi
  shasum=`sha256sum $pkgsrc_file | cut -d " " -f1`
  [ "${shasum}" != "${pkgsrc_sha256sum}" ] && ( echo "Integrity check failed."; exit 1 )
  tar xf ${pkgsrc_file}
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  chmod 755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

  tar xf desktopvideo-*-${_arch}.tar.gz
  cp -a desktopvideo-*-${_arch}/* $pkgdir
  rm -rf $pkgdir/usr/sbin

  find ${pkgdir} -name dkms.conf -exec sed -i 's|POST_INSTALL="../../lib/blackmagic/blackmagic-loader $PACKAGE_NAME $PACKAGE_VERSION"||' {} \;

  tar xf mediaexpress-*-${_arch}.tar.gz
  cp -a mediaexpress-*-${_arch}/* $pkgdir
}

