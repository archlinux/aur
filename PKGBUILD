# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com>
pkgname=decklink
pkgver=10.9.3
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support/family/capture-and-playback"
license=('custom')
makedepends=('curl')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')
install='decklink.install'

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/593cebbfb81f43e3a24ca19a8679df4c"
pkgsrc_file=$pkgname-${pkgver}.tar.gz
pkgsrc_sha256sum="51d53ecdbcc2253a484c3aaf5149623045ea3459926eec4b767a7d5ede683f61"

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
	ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	cd $srcdir/Blackmagic_Desktop_Video_Linux_*/other/${_arch}

	tar xf desktopvideo-*-${_arch}.tar.gz
	cp -a desktopvideo-*-${_arch}/* $pkgdir
	mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
	rm -rf $pkgdir/usr/sbin

	tar xf mediaexpress-*-${_arch}.tar.gz
	cp -a mediaexpress-*-${_arch}/* $pkgdir
}
