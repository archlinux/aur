# Maintainer: Aleksander Boiko <brdcom@ya.ru>
pkgname=bgbilling
_pkgname=BGBillingServer
_major=6.2
_minor=1047
pkgver=$_major.$_minor
pkgrel=3
pkgdesc="The billing system BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('activemq' 'java-runtime=7' 'pbzip2' 'percona-server-clients')
optdepends=('percona-server')
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
  patch -p0 <"${srcdir}/setenv.sh.patch"
  patch -p0 <"${srcdir}/update.sh.patch"

# converting files to Unix format
  dos2unix *.sh

# remove win files
  rm -rf *.ini
  rm -rf *.bat
  rm -rf *.exe

# remove junk files
  rm -rf ./script
}

# vim:set ts=2 sw=2 ft=sh et:
