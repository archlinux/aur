# Maintainer: CodeZ <navintiwari08@gmail.com>

pkgname=hunchly
pkgdesc='OSINT Software For Online Investigations'
license=('Commercial')
url='https://www.hunch.ly'
pkgver=2.2.6
pkgrel=1
package=hunchly.deb
depends=('gconf' 'libcanberra')
arch=('i686' 'x86_64')
source=( "${url}/installers/${package}" )
md5sums=('SKIP')

prepare() {
	if [ ! -f /opt/google/chrome/extensions/amfnegileeghgikpggcebehdepknalbf.json ]; then
        	mkdir -p $pkgdir/opt/google/chrome/extensions
        	echo "{\"external_update_url\": \"https://clients2.google.com/service/update2/crx\"}" > $pkgdir/opt/google/chrome/extensions/amfnegileeghgikpggcebehdepknalbf.json
	fi

	if [ ! -d /etc/opt/chrome/native-messaging-hosts/ ]; then
  		mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts/
	fi

	if [ -f /etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json ]; then
  		echo "Clearing existing extension messaging host"
  		sudo rm /etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	fi

    mkdir -p $pkgdir/opt/google/chrome/extensions
  	mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts/

    echo "{\"name\": \"com.hunchlydev.server\"," > $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	echo "\"description\": \"Hunchly Server\"," >> $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	echo "\"path\":\"/usr/lib/hunchly/HunchlyChromeHandler\"," >> $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	echo "\"type\": \"stdio\"," >> $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	echo "\"allowed_origins\": [" >> $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json
	echo "\"chrome-extension://amfnegileeghgikpggcebehdepknalbf/\" ]}" >> $pkgdir/etc/opt/chrome/native-messaging-hosts/com.hunchlydev.server.json        

}   


package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi
  cd "$srcdir"
  ar xf "$package"
  tar xf data.tar.xz -C "$pkgdir"
  rm -rf "$pkgdir"/{,usr/{,share/{,maltego/}}}.DS_Store
  
  if [ -f /opt/hunchly/hunchly.ini ]; then
    echo "Found existing configuration in /opt/hunchly/hunchly.ini"
    sudo cp /opt/hunchly/hunchly.ini $pkgdir/usr/lib/hunchly/hunchly.ini
    sudo mv /opt/hunchly/hunchly.ini $pkgdir/opt/hunchly/hunchly.ini.bak
  elif [ ! -f /usr/lib/hunchly/hunchly.ini ]; then
    echo 'data_directory=${HOME}/Documents/HunchlyData' > $pkgdir/usr/lib/hunchly/hunchly.ini
  fi
}







