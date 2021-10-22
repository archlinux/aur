# Maintainer: Aleksander Boiko <brdcom@ya.ru>
pkgname=bgbilling
_basename=bgbilling
_pkgname=BGBillingServer
_major=8.0
_minor=1362
pkgver=$_major.$_minor
pkgrel=1
pkgdesc="The billing system BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('jdk8' 'pbzip2' 'libmariadbclient')
optdepends=('activemq' 'mariadb')
makedepends=('unzip' 'dos2unix' 'patch')
backup=("opt/${_basename}/${_pkgname}-${_major}/data/lic.properties")
source=("ftp://ftp.bgbilling.ru/pub/${pkgname}/${_major}/${_pkgname}_${_major}_${_minor}.zip"
        'environment'
        'sysusers'
        'update.sh.patch')
#noextract=("update_${_major}.zip")
install=install

#prepare() {
#  sed -i 's|#JAVA_HOME=|JAVA_HOME=/usr/lib/jvm/default|' \
#  "./${_pkgname}/setenv.sh"
  
  # patch update.sh
#  patch -p0 <"${srcdir}/update.sh.patch"
#}

package() {
  install -d -m0755 ${pkgdir}/opt/${_basename}
  
  mv ./${_pkgname} ${pkgdir}/opt/${_basename}/${_pkgname-}-${_major}
  
  ln -s /opt/${_basename}/${_pkgname}-${_major} $pkgdir/opt/${_basename}/${_pkgname}
  
  install -D -m0644 environment "${pkgdir}/etc/conf.d/$pkgname"
  install -D -m0644 sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m0644 ./dump.sql ${pkgdir}/usr/share/${pkgname}/dump.sql

# putting the appropriate access rights to the startup scripts
  cd ${pkgdir}/opt/${_basename}/${_pkgname}-${_major}
  chmod +x *.sh
  chmod +x script/*.sh

# converting files to Unix format
  dos2unix *.sh

# remove win files
  rm -rf *.ini
  rm -rf *.bat
  rm -rf *.exe

  cd ./script/
  mv ./dataloader.service ./bgdataloader.service
  for d in *.service ; do
    #install -D -m 0644 $d.service "$pkgdir/usr/lib/systemd/system/$d.service"
    install -D -m 0644 $d "$pkgdir/usr/lib/systemd/system/$d"
  done
  rm -f bg*
}

sha256sums=('c32d5fc0e6b62d7c58761c91cd82dca47d4eb989ce8eb0ec2bc45bf03666a378'
            'cf182084a406f9b471168dbef5f4ff8f674dbac7f0c12955ff0dc5c69c3f136c'
            'fd80f649d8677b0a7d37c4916ac62e3667a54cefdecd6d330db5a3bcf4c89c87'
            '8c77823f32b6111f6cb3ae6477fc39bcd74b7569c55ab948516cc2fc8d95f778')
