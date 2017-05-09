# Maintainer: Perry Hung <perry@leaflabs.com>

pkgname=decklink
_dvver=10.9a7 # DesktopVideo
_mever=3.5.3a1 # MediaExpress
pkgver=${_dvver}
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="http://www.blackmagic-design.com/products/"
license=('custom')
makedepends=('curl')
depends=('linux-headers' 'libxml2' 'libpng12' 'glu' 'qt4')
options=('!strip' 'staticlibs')
install='decklink.install'

[ "$CARCH" = "i686" ] && _arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'

pkgsrc_url="https://www.blackmagicdesign.com/api/register/us/download/46d65f46d6434b16bd69482b0ca7dba3"
#pkgsrc_file=$pkgname-${_dvver}.tar.gz
pkgsrc_file="/tmp/Blackmagic_Desktop_Video_Linux_10.9.tar"
pkgsrc_sha256sum="6a883936e877ee3985dea55027662cf58782a5e19081f1dce668761879159581"

prepare() {
  if [ -f $pkgsrc_file ]; then
    echo "File $pkgsrc_file found, skipping download"
  else
    echo "Download the Desktop video 10.9 update from https://www.blackmagicdesign.com/support/family/capture-and-playback to $pkgsrc_file and reinstall this package"
    # broken since recent download protection on bmd website
    #echo "curl -H 'Content-Length: 35' --data '{country\":\"us\",\"platform\":\"Linux\"}' $pkgsrc_url"
    #temp_url=`curl -H 'Content-Length: 35' --data '{country":"us","platform":"Linux"}' $pkgsrc_url`
    #curl -o $pkgsrc_file $temp_url
    exit 1
  fi
  shasum=`sha256sum $pkgsrc_file | cut -d " " -f1`
  [ "${shasum}" != "${pkgsrc_sha256sum}" ] && ( echo "Integrity check failed."; exit 1 )
  tar xf ${pkgsrc_file}
}

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	cd "$srcdir/Blackmagic_Desktop_Video_Linux_${pkgver}/other/${_arch}"

	tar xf "desktopvideo-${_dvver}-${_arch}.tar.gz"
	cp -a "desktopvideo-${_dvver}-${_arch}/"* "$pkgdir"
	mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
	rm -rf "$pkgdir/usr/sbin"

	tar xf "mediaexpress-${_mever}-${_arch}.tar.gz"
	cp -a "mediaexpress-${_mever}-${_arch}/"* "$pkgdir"
}


