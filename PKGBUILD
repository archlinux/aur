# Maintaner: Atsushi Ichiki <hitotuky at gmail dot com> 

pkgname=sonarqube
pkgver=5.2
pkgrel=0
pkgdesc="A code quality management platform."
url="http://www.sonarqube.org/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('java-environment-common')
optdepends=('apache: a full featured webserver'
            'mariadb: Fast SQL database server, drop-in replacement for MySQL'
            'maven: a java project management and project comprehension tool')

backup=('etc/sonarqube/sonar.properties' 
        'etc/sonarqube/wrapper.conf')

install=${pkgname}.install
conflicts=('sonarqube-lts')
provides=('sonarqube')
replaces=('sonarqube')
options=(!strip)

source=(https://sonarsource.bintray.com/Distribution/${pkgname}/${pkgname}-${pkgver}.zip
        'wrapper.conf.patch'
        'sonar.sh.patch'
        'sonarqube.service'
        'sonarqube.install')	

md5sums=('3d0e923a11f3ce5caa272e5ce86a711a'
	 'f9200f1722578c3e3af312c74295db9c'
	 '0561e8954de393e963b5b9f991a080cb'
         '04484a8a3cc5cac4d8fbeddbdea1fbd0'
         '2298d28f6be2114fbe1911cf6e5f78fc')

package() {
  cd ${srcdir}

  # Create directory and copy everything
  install -d ${pkgdir}/usr/share/${pkgname}

  # modify the current config files for working with arch
  msg "Patch files"
  patch ${srcdir}/${pkgname}-${pkgver}/conf/wrapper.conf < ${srcdir}/wrapper.conf.patch
  if [ $CARCH = 'x86_64' ]; then
    patch ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-64/sonar.sh < ${srcdir}/sonar.sh.patch
    #sed -i "s/ARCH/linux-x86-64/g" ${srcdir}/sonarqube.service
  elif [ $CARCH = 'i686' ]; then
    patch ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-32/sonar.sh < ${srcdir}/sonar.sh.patch
    #sed - "s/ARCH/linux-x86-32/g" ${srcdir}/sonarqube.service
  fi

  # moving only $CARCH specific files to pkg, delete the rest
  msg "Determine right architecture"
    mkdir -p ${pkgdir}/usr/share/${pkgname}/bin/
  if [ $CARCH = 'x86_64' ]; then
    cp -r ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-64/* ${pkgdir}/usr/share/${pkgname}/bin || return 1
    rm -r ${srcdir}/${pkgname}-${pkgver}/bin || return 1
  elif [ $CARCH = 'i686' ]; then
    cp -r ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-32/* ${pkgdir}/usr/share/${pkgname}/bin || return 1
    rm -r ${srcdir}/${pkgname}-${pkgver}/bin || return 1
  fi

  # install the additional config files to the desired destination
  msg "Installing configuration files"
  mkdir -p ${pkgdir}/etc/${pkgname}
  install ${srcdir}/${pkgname}-${pkgver}/conf/sonar.properties ${pkgdir}/etc/${pkgname}/sonar.properties
  install ${srcdir}/${pkgname}-${pkgver}/conf/wrapper.conf ${pkgdir}/etc/${pkgname}/wrapper.conf
  rm -r ${srcdir}/${pkgname}-${pkgver}/conf

  # copy documentation
  msg "Copy documentation"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  install ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/doc/${pkgname}
  rm ${srcdir}/${pkgname}-${pkgver}/COPYING

  # delete not needed directories
  rm -r ${srcdir}/${pkgname}-${pkgver}/logs
  ln -s /var/log/${pkgname} ${pkgdir}/usr/share/${pkgname}/logs
  #mkdir -p /var/log/

  # copy the source to the final directory
  msg "Copy Source to final directory"
  cp -a ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/${pkgname} || return 1

  mkdir -p ${pkgdir}/var/log/${pkgname}/
  touch ${pkgdir}/var/log/${pkgname}/wrapper.log
  touch ${pkgdir}/var/log/${pkgname}/sonar.log
  touch ${pkgdir}/var/log/${pkgname}/profiling.log

  install -m755 -d ${pkgdir}/run/${pkgname}

  install -Dm644 "${srcdir}/sonarqube.service" "${pkgdir}/usr/lib/systemd/system/sonarqube.service"
}

