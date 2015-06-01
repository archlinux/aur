# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=java-gcj-compat
pkgver=1.0.80
pkgrel=4
pkgdesc="Wrapper package to wrap free tools into a java 1.5.0.0 compatible java environment"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.eclipse.org/"
depends=('gcc-gcj>=5.1.0' 'gjdoc>=0.7.9')
makedepends=('perl' 'python2')
provides=('java-environment=5' 'java-runtime=5')
conflicts=('java-environment' 'java-runtime')
source=(ftp://sources.redhat.com/pub/rhug/${pkgname}-${pkgver}.tar.gz
	java-gcj-compat.profile
	'https://gist.githubusercontent.com/bbidulock/93d0b5e65a957c9d0905/raw/8ad70648954c65bf8b26c5912ae61eb599b6677d/ca-bundle.crt')
options=('!makeflags')
md5sums=('34369925c7a22e21c3d3b91e8b774396'
         'eee3645b754a5dc77644e8973c077c0e'
         '02410297423b187bd4c6e6e295314e4c')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i -e 's,python,python2,' aot-compile
  sed -i -e 's,python,python2,' aot-compile-rpm
  sed -i -e 's,python ,python2 ,' Makefile.*
  sed -i -e 's,/python2.5/,/python2.7/,' Makefile.*
  sed -i -e 's/sinjdoc/gjdoc/g' Makefile.*
  sed -i -e 's/fastjar/gjar/g' Makefile.*
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/bin/aot-compile
  rm -f ${pkgdir}/usr/bin/aot-compile-rpm
  rm -f ${pkgdir}/usr/bin/rebuild-gcj-db

  mkdir -p ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib
  mkdir -p ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/lib
  mkdir -p ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/include
  ln -s /usr/share/java/libgcj-4.?.jar ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/rt.jar
  ln -s /usr/share/java/libgcj-tools-4.?.jar ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/lib/tools.jar
  ln -s /usr/lib/gcj-4.?/libjawt.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/lib/
  ln -s /usr/lib/libgcj*.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/lib/
  ln -s /usr/lib/libgij.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/lib/
  for i in jni.h jni_md.h jawt.h jawt_md.h gcj; do
    ln -s `gcj -print-file-name=include/${i}` ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/include/
  done

  if [ "${CARCH}" = "x86_64" ]; then
    _arch=amd64
  else
    _arch=i386
  fi
  mkdir -p ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/${_arch}/{client,server}
  ln -s /usr/lib/gcj-4.?/libjvm.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/${_arch}/client/
  ln -s /usr/lib/gcj-4.?/libjvm.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/${_arch}/server/
  ln -s /usr/lib/gcj-4.?/libjawt.so ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/${_arch}/

  mkdir -p ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/security
  sed -i -e "s|/etc/pki/tls/cert.pem|${srcdir}/ca-bundle.crt|" generate-cacerts.pl
  perl generate-cacerts.pl
  install -m644 cacerts ${pkgdir}/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre/lib/security/cacerts


  mkdir -p ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/java-gcj-compat.profile ${pkgdir}/etc/profile.d/java-gcj-compat.sh
}
