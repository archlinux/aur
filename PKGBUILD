# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>
# Contributor: Christophe LAVIE <christophe.lavie@laposte.net> 07/12/2019


pkgname=devolo-dlan-cockpit
pkgver=5.1.1
pkgrel=1
name=software-devolo-cockpit-linux-v${pkgver//./-}.run
install=${pkgname}.install
pkgdesc="Display and configure settings of your devolo device"
arch=('i686' 'x86_64')
url="https://www.devolo.com/support/downloads/download/devolo-cockpit.html"
license=('nonfree')
depends=( 'adobe-air-sdk>=2.6' 'libgnome-keyring')

if [ "${CARCH}" = "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi 

source=("https://www.devolo.fr/fileadmin/Web-Content/DE/products/hnw/devolo-cockpit/software/$name" 'devolonetsvc.service')

build() {
  cd $srcdir
  skip=$(grep -a -m1 -n "HERE_BE_DRAG[O]NS" $name | cut -d: -f1)
  tail $name -n +$((skip+1)) | tar -x -C .
  ar x "devolo-dlan-cockpit_${pkgver}-0_${_arch}.deb"
  find . -name "adobeair*${_arch}.deb" -print | xargs ar x
  tar xJf data.tar.xz
  sed -i 's/\.appdata\//~\/\.appdata\//g' "${srcdir}/opt/devolo/dlancockpit/bin/dlancockpit-run.sh"
  echo "StartupWMClass=dlancockpit" >> "${srcdir}/usr/share/applications/devolo-dlan-cockpit.desktop"
}

package() {
    cp -r "${srcdir}/opt" "${srcdir}/usr" "${pkgdir}/"
    ln -s "/opt/adobe-air-sdk/runtimes/air/linux/Adobe AIR/" "${pkgdir}/opt/Adobe AIR"
	mkdir -p "${pkgdir}/var/lib/devolonetsvc"
	printf "<?xml version="1.0" encoding="utf-8"?>\n<data_collection><allowed>2</allowed></data_collection>" > "${srcdir}/config.xml"
  	install -Dm644 "${srcdir}/config.xml" "${pkgdir}/var/lib/devolonetsvc/config.xml"  	
  	install -Dm644 "${srcdir}/devolonetsvc.service" "${pkgdir}/usr/lib/systemd/system/devolonetsvc.service"
 }
 

sha256sums=('edd7862136f7bb40d9d45fb6f2b4513e8f973a1aae0ab0031ac54f7e498f8136'
         '6f187ca5c7a599b5394ea09cd68885168dbd19b5bd72df5ce083e721e2f0a12c')
