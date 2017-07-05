# Maintainer: Aleksander Boiko <brdcom@ya.ru>
pkgname=bgbilling
_pkgname=BGBillingServer
_major=7.1
_minor=885
pkgver=$_major.$_minor
pkgrel=1
pkgdesc="The billing system BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('activemq' 'java-runtime=7' 'pbzip2' 'libmariadbclient')
optdepends=('mariadb')
makedepends=('unzip' 'dos2unix' 'patch')
backup=("opt/${pkgname}/data/lic.properties")
source=("ftp://bgbilling.ru/pub/${pkgname}/${_major}/data/${_pkgname}_${_major}_${_minor}.zip"
        'bgbilling.conf'
        'bgbilling.service'
        'bgdataloader.service'
        'bgscheduler.service'
        'setenv.sh.patch'
        'update.sh.patch')
install=bgbilling.install

package() {
  install -d -m0755 ${pkgdir}/opt
  mv ./${_pkgname} ${pkgdir}/opt/${pkgname}

  for d in bgbilling; do
    install -D -m 644 $pkgname.conf "$pkgdir/etc/conf.d/$d"
    backup+=("etc/conf.d/$d")
  done

  for d in bgbilling bgscheduler bgdataloader; do
    install -D -m 644 $d.service "$pkgdir/usr/lib/systemd/system/$d.service"
  done
  
  install -D -m0644 ./dump.sql ${pkgdir}/usr/share/${pkgname}/dump.sql
  #install -D -m0644 ./lic.properties ${pkgdir}/usr/share/licenses/${pkgname}/test_license/lic.properties

# putting the appropriate access rights to the startup scripts
  cd ${pkgdir}/opt/${pkgname}
  chmod 0744 *.sh

# patch
#  patch -p0 <"${srcdir}/setenv.sh.patch"
#  patch -p0 <"${srcdir}/update.sh.patch"

# converting files to Unix format
  dos2unix *.sh

# remove win files
  rm -rf *.ini
  rm -rf *.bat
  rm -rf *.exe

# remove junk files
  rm -rf ./script
}

md5sums=('b1ba4f459f27c558a83793663d22f9fc'
         '1004f74c6e4b9551a23132ae1e936c3e'
         'c49adcd6d778558eff1545f5c79db760'
         'dcfc1eb1310ef5a1319ed6a5777f4111'
         'c3f6c6b3e7e02595d7009d59ad47b3ea'
         '0f7f773fb2e39637f1db752e439561e9'
         'd772aa7395ff3d07fcaf46b106b06a3b')
