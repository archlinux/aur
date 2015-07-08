# Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Ciarán Coffey <ciaran@ccoffey.ie>
# Contributor: Matthew Gyurgyik <matthew@pyther.net>
pkgname=icaclient
pkgver=13.2
pkgrel=1
pkgdesc="Citrix Receiver for Linux (ICAClient)"
arch=('x86_64')
url="http://www.citrix.com/English/ps2/products/product.asp?contentID=1689163&ntref=prod_top"
license=('custom:Citrix')
depends=(
  'alsa-lib'
  'libvorbis'
  'curl'
  'gtk2'
  'libpng12'
  'libxml2'
  'libxaw'
  'libxext'
  'libxft'
  'libxinerama'
  'libxmu'
  'libxp'
  'libxpm'
  'libxt'
  'ca-certificates'
  'nspluginwrapper'
)
optdepends=(
  'xerces-c: gtk2 configuration manager'
  'webkitgtk2: gtk2 selfservice/storefront ui'
)

conflicts=('bin32-citrix-client' 'citrix-client')
options=(!strip)

source_url="http:$(curl -L -silent 'http://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-131.html' | awk -F 'rel=\"' '/linuxx64-/ {print $2}'| awk -F'"' '{print $1}'| sed '/^$/d' |uniq)"
source=('configmgr.desktop'  'conncenter.desktop'  'selfservice.desktop' 'wfica.desktop' 'wfica.sh' 'wfica_assoc.sh' $pkgname-$pkgver.tar.gz::$source_url)
makedepends=('wget')
md5sums=('71aca6257f259996ac59729604f32978'
         'a38c3f844a0fefe8017a25bee213b843'
         '0e92c33b3fcc99b04269787da2984809'
         '1f214f6f456f59afd1a3275580f4240e'
         '59f8e50cc0e0c399d47eb7ace1df5a32'
         'dca5a1f51449ef35f1441b900d622276'
         'afa8d0ba96e38f92709c483b54698e12')


install=citrix-client.install

package() {
  cd "${srcdir}"
  ICAROOT=/opt/Citrix/ICAClient

  mkdir -p ${pkgdir}$ICAROOT

  cd "$srcdir/linuxx64/linuxx64.cor"
  install -m755 wfica *.so *.DLL AuthManagerDaemon PrimaryAuthManager ServiceRecord selfservice ${pkgdir}$ICAROOT

  # copy directories
  cp -r ./config/ ${pkgdir}$ICAROOT
  cp -r ./gtk/ ${pkgdir}$ICAROOT
  cp -r ./help/ ${pkgdir}$ICAROOT
  cp -r ./keyboard/ ${pkgdir}$ICAROOT
  cp -r ./keystore/ ${pkgdir}$ICAROOT
  cp -r ./lib/ ${pkgdir}$ICAROOT
  cp -r ./icons/ ${pkgdir}$ICAROOT
  cp -r ./nls/ ${pkgdir}$ICAROOT
  cp -r ./site/ ${pkgdir}$ICAROOT
  cp -r ./usb/ ${pkgdir}$ICAROOT
  cp -r ./util/ ${pkgdir}$ICAROOT

  # Intall License
  install -m644 -D nls/en/eula.txt \
    "${pkgdir}$ICAROOT/eula.txt"

  # create /config/.server to enable user customization using ~/.ICACLient/ overrides. Thanks Tomek
  touch ${pkgdir}$ICAROOT/config/.server  

  # Extract system ca-certificates and install in the Citrix cacerts directory
  cp /etc/ca-certificates/extracted/tls-ca-bundle.pem ${pkgdir}$ICAROOT/keystore/cacerts/
  cd ${pkgdir}$ICAROOT/keystore/cacerts/
  awk 'BEGIN {c=0;} /BEGIN CERT/{c++} { print > "cert." c ".pem"}' < tls-ca-bundle.pem

  # The following 32-bit library causes false namcap errors
  # rm util/libgstflatstm.32.so

  # Install wrapper script
  install -m755 ${srcdir}/wfica.sh ${pkgdir}$ICAROOT/wfica.sh

  # Dirty Hack
  # wfica expects {module,wfclient,apssrv}.ini in $ICAROOT/config
  # sadly these configs differ slightly by locale
  lang=${LANG%%_*}
  if [[ ! -d ${pkgdir}/$ICAROOT/nls/$lang ]]; then
    lang='en'
  fi
  cp ${pkgdir}/$ICAROOT/nls/$lang/{appsrv.ini,module.ini,wfclient.ini} ${pkgdir}/$ICAROOT/config/
 
# Copy Firefox plugin into plugin directory
    mkdir -p "${pkgdir}/usr/lib/mozilla/plugins"
    ln -s "$ICAROOT/npica.so" "${pkgdir}"/usr/lib/mozilla/plugins/npica.so
    cd "${srcdir}"
    # install freedesktop.org files
    install -Dm644 wfica.desktop "${pkgdir}/usr/share/applications/wfica.desktop"
    install -Dm644 conncenter.desktop "${pkgdir}/usr/share/applications/conncentre.desktop"
    install -Dm644 configmgr.desktop "${pkgdir}/usr/share/applications/configmgr.desktop"
    install -Dm644 selfservice.desktop "${pkgdir}/usr/share/applications/wfcmgr.desktop"
    # install scripts
    install -Dm755 wfica.sh "${pkgdir}$ICAROOT"
    install -Dm755 wfica_assoc.sh "${pkgdir}$ICAROOT"

}

