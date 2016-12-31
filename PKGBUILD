# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>
# Contributor: Christophe LAVIE <christophe.lavie@laposte.net> 31/12/2016


pkgname=devolo-dlan-cockpit
pkgver=4.3.2
pkgrel=1
install=${pkgname}.install
pkgdesc="Display and configure settings of your devolo device"
arch=('i686' 'x86_64')
url="http://www.devolo.com/consumer/dlan-cockpit-most-simple-configuration-software-for-your-dlan-network.html?l=en"
license=('nonfree')
depends=( 'adobe-air-sdk>=2.6' 'libgnome-keyring' )

if [ "${CARCH}" = "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi 

source=("http://www.devolo.fr/fileadmin/user_upload/Downloads/Software/devolo-cockpit-v${pkgver//./-}-linux.run"
  'devolonetsvc.service')


build() {
  cd $srcdir
  skip=$(grep -a -m1 -n "HERE_BE_DRAG[O]NS" "devolo-cockpit-v${pkgver//./-}-linux.run" | cut -d: -f1)
  tail "devolo-cockpit-v${pkgver//./-}-linux.run" -n +$((skip+1)) | tar -x -C .
  ar x "devolo-dlan-cockpit_${pkgver}-0_${_arch}.deb"
  find . -name "adobeair*${_arch}.deb" -print | xargs ar x
  tar xvf data.tar.gz
  sed -i 's/\.appdata\//~\/\.appdata\//g' "${srcdir}/opt/devolo/dlancockpit/bin/dlancockpit-run.sh"
}

package() {
    cp -r "${srcdir}/opt" "${srcdir}/usr" "${pkgdir}/"
    ln -s "/opt/adobe-air-sdk/runtimes/air/linux/Adobe AIR/" "${pkgdir}/opt/Adobe AIR"
	mkdir -p "${pkgdir}/var/lib/devolonetsvc"
	printf "<?xml version="1.0" encoding="utf-8"?>\n<data_collection><allowed>2</allowed></data_collection>" > "${srcdir}/config.xml"
  	install -Dm644 "${srcdir}/config.xml" "${pkgdir}/var/lib/devolonetsvc/config.xml"  	
  	install -Dm644 "${srcdir}/devolonetsvc.service" "${pkgdir}/usr/lib/systemd/system/devolonetsvc.service"
 }
 
 
md5sums=('9c809f0aa0bf42c2bba12e509059c2ee'
         '6784ae1b639217439ddcb3f43a99c7bb'
         )
