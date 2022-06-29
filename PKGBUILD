# Maintainer: Christophe LAVIE <christophe.lavie@laposte.net>
# Contributor: Christophe LAVIE <christophe.lavie@laposte.net> 29/06/2022

pkgname=devolo-dlan-cockpit
pkgver=5.2.0.185
pkgrel=2.1
_name=devolo-cockpit-v${pkgver//./-}-linux.run
install=${pkgname}.install
pkgdesc="Display and configure settings of your devolo device"
arch=('i686' 'x86_64')
url="https://www.devolo.com/support/downloads/download/devolo-cockpit.html"
license=('nonfree')
depends=( 'lib32-gtk2' 'lib32-curl' 'lib32-libxt' 'lib32-libxslt' 'lib32-nss' )

if [ "${CARCH}" = "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386" 
fi 

source=("https://www.devolo.fr/fileadmin/Web-Content/DE/products/hnw/devolo-cockpit/software/$_name" 'devolonetsvc.service')

build() {
  cd $srcdir
  skip=$(grep -a -m1 -n "HERE_BE_DRAG[O]NS" $_name | cut -d: -f1)
  tail $_name -n +$((skip+1)) | tar -x -C .
  ar x "devolo-dlan-cockpit_${pkgver}-0_${_arch}.deb"
  find . -name "adobeair*${_arch}.deb" -print | xargs ar x
  tar xJf data.tar.xz
  tar xJf data.tar.lzma
  sed -i 's/\.appdata\//~\/\.appdata\//g' "${srcdir}/opt/devolo/dlancockpit/bin/dlancockpit-run.sh"
  echo "StartupWMClass=dlancockpit" >> "${srcdir}/usr/share/applications/devolo-dlan-cockpit.desktop"
}

package() {
  cp -r  "${srcdir}/etc/opt" "${srcdir}/opt" "${srcdir}/usr" "${srcdir}/var" "${pkgdir}/"
  mkdir -p "${pkgdir}/var/lib/devolonetsvc"
  printf "<?xml version="1.0" encoding="utf-8"?>\n<data_collection><allowed>2</allowed></data_collection>" > "${srcdir}/config.xml"
  install -Dm644 "${srcdir}/config.xml" "${pkgdir}/var/lib/devolonetsvc/config.xml"  	
  install -Dm644 "${srcdir}/devolonetsvc.service" "${pkgdir}/usr/lib/systemd/system/devolonetsvc.service"
}

sha256sums=('976099b5aa4785edc9ceabb6246abe724b78d2e717d1906eb91bf137f585a1e6'
            '6f187ca5c7a599b5394ea09cd68885168dbd19b5bd72df5ce083e721e2f0a12c')

