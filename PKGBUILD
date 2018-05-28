# Maintainers: Perry Hung <perry@leaflabs.com> Florent Thiery <fthiery@gmail.com>
pkgname=decklink
pkgver=10.10
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

pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/046b297aa3a844fa8fc46d6c32241dbd"
pkgsrc_file=$pkgname-${pkgver}.tar.gz
pkgsrc_sha256sum="2ef7f504433e32fef970c12dd9d3b62e47162426c776d0485b503ed000ebb7c3"

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

	cd $srcdir/Blackmagic_Desktop_Video_Linux_$pkgver/other/${_arch}

	tar xf desktopvideo-*-${_arch}.tar.gz
	cp -a desktopvideo-*-${_arch}/* $pkgdir
	rm -rf $pkgdir/usr/sbin

	tar xf mediaexpress-*-${_arch}.tar.gz
	cp -a mediaexpress-*-${_arch}/* $pkgdir
}

