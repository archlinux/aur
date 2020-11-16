# Maintainer: Aleksandr Boiko <contact at via dot aur>
pkgname=bgerp
pkgver=3.0.1367
pkgrel=1
pkgdesc="Open ERP system"
arch=('i686' 'x86_64') 
url='https://bgerp.ru'
license=('GPL')
depends=('pwgen' 'jdk11-openjdk')
optdepends=('libmariadbclient' 'mariadb' 'nginx')
provides=("bgerp")
conflicts=("bgerp-git")
source=("$url/download/3.0/${pkgname}.zip"
        'environment'
        'sysusers')
install=install

pkgver() {
  FILENAME=`curl -s https://bgerp.ru/download/3.0/ | grep bgerp | awk -F\" '{print $2}' | tail -n1`
  major=`echo $FILENAME | awk -F\_ '{print $2}'`
  minor=`echo $FILENAME | awk -F\. '{print $2}' | awk -F\_ '{print $2}'`
  printf "$major.$minor"
}

prepare() {
  cd $srcdir/$pkgname
  sed -i 's|#JAVA_HOME=|. /etc/conf.d/bgerp|' setenv.sh 
}

package() {
  install -d -m0755 ${pkgdir}/opt/
  mv $pkgname ${pkgdir}/opt/${pkgname}

  install -D -m0644 ./environment "${pkgdir}/etc/conf.d/$pkgname"
  install -D -m0644 ./sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m 0644 ${pkgdir}/opt/${pkgname}/scripts/${pkgname}.service "$pkgdir/usr/lib/systemd/system/${pkgname}.service"

# delete unnecessary files
  rm -fr ${pkgdir}/opt/${pkgname}/scripts
# fix permission
  chmod 774 ${pkgdir}/opt/${pkgname}/*.sh
}

md5sums=('SKIP'
         '670af068ebeb6d9e0e4278560b123254'
         '5654ced10dad0ba7dbd9da466bb4426c')
