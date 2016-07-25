pkgname=maya
pkgver=2016_SP5
pkgrel=1
pkgdesc="Maya software helps you tackle challenging character creation and digital animation productions. Get powerful, integrated 3D tools on a robust, extensible CG pipeline core."
arch=('x86_64')
url="http://www.autodesk.com/products/maya/overview"
license=('custom: unlimited')
depends=('libpng12 tcsh libxp openssl libjpeg libtiff')
makedepends=('rpmextract alien_package_converter debhelper cpio')
conflicts=()
source=(http://download.autodesk.com/us/support/files/maya_2016_service_pack_5/Autodesk_Maya_2016_SP5_EN_Linux_64bit.tgz)
md5sums=('5b88676c1c3239ea26b9de656340e974')

package() {

  cd "$pkgdir"

  msg2 "Unpacking Red Hat .rpm files. This could take a while..."

  for i in "$srcdir"/*.rpm; do
      msg2 $i
      rpmextract.sh $i
  done

}

post_install() {

  msg2 "If you have not already done so, you can get your serial number from: http://students.autodesk.com"
  read -p "Please enter your serial number: " SERIALNUMBER
  read -p "Please enter your product id: " PRODUCTID
  echo ""

  mkdir /usr/tmp
  chmod 777 /usr/tmp

  cp /opt/Autodesk/Adlm/R11/lib64/libadlmPIT.so.11 /usr/lib/libadlmPIT.so.11
  cp /opt/Autodesk/Adlm/R11/lib64/libadlmutil.so.11 /usr/lib/libadlmutil.so.11

  echo -e 'MAYA_LICENSE=unlimited\nMAYA_LICENSE_METHOD=standalone' > /usr/autodesk/maya2016/bin/License.env

  /usr/autodesk/maya2016/bin/adlmreg -i S $PRODUCTID $PRODUCTID 2016.0.0.F $SERIALNUMBER /var/opt/Autodesk/Adlm/Maya2016/MayaConfig.pit

  /opt/Autodesk/Adlm/FLEXnet/bin/install_fnp.sh /opt/Autodesk/Adlm/FLEXnet/bin/FNPLicensingService

  ln -s /usr/lib/libssl.so /usr/autodesk/maya2016/lib/libssl.so.10
  ln -s /usr/lib/libcrypto.so /usr/autodesk/maya2016/lib/libcrypto.so.10

  ln -s /usr/lib/libjpeg.so /usr/autodesk/maya2016/lib/libjpeg.so.62
  ln -s /usr/lib/libtiff.so /usr/autodesk/maya2016/lib/libtiff.so.3

  mkdir /usr/autodesk/maya2016/plugin-backups
  mv /usr/autodesk/maya2016/plug-ins/bifrost /usr/autodesk/maya2016/plugin-backups/
}