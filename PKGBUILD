# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>

_pkgbase=icedtea-web
pkgbase=icedtea-web-jre32
pkgname=('icedtea-web-jre32' 'icedtea-web-doc-jre32')
pkgver=1.6.2
pkgrel=2
arch=('i686' 'x86_64')
url='http://icedtea.classpath.org/wiki/IcedTea-Web'
license=('GPL2')
makedepends=('java-environment-openjdk' 'zip' 'libxtst' 'npapi-sdk' 'rhino' 'junit' 'bin32-jdk'
             'firefox' 'epiphany')
optdepends=('rhino: for using proxy auto config files')
# Due to broken path names in the tarball that fails with LANG=C in our chroot
noextract=("${_pkgbase}-${pkgver}.tar.gz")
source=(http://icedtea.classpath.org/download/source/${_pkgbase}-${pkgver}.tar.gz)
sha256sums=('ce67034096d6b960e2b6cfb5c41a7bd6b30eb2ec7f13bf3ecdb477ff6ce69300')

prepare() {
  cd "${srcdir}"
  LANG=en_US.UTF-8 bsdtar -x -f "${srcdir}"/${_pkgbase}-${pkgver}.tar.gz
}

build() {
  cd "${srcdir}"/${_pkgbase}-${pkgver}
  ./configure \
      --prefix=/usr/share/${_pkgbase} \
      --datarootdir=/usr/share \
      --with-jdk-home=/usr/lib32/jvm/default \
      --with-jre-home=/usr/lib32/jvm/default-runtime \
      --with-java=/usr/bin/java32 \
      --with-browser-tests \
      --with-firefox=/usr/bin/firefox \
      --with-epiphany=/usr/bin/epiphany
   make
}

#check() {
#  cd "${srcdir}"/${_pkgbase}-${pkgver}
#  # as more tests have been added some are expectged to fail
#  # see http://mail.openjdk.java.net/pipermail/distro-pkg-dev/2012-March/017566.html
#  make -k check
#}


package_icedtea-web-jre32() {

  pkgdesc='Free web browser plugin to run applets written in Java and an implementation of Java Web Start'
  depends=('java-runtime-openjdk' 'desktop-file-utils')
  provides=('java-web-start')
  replaces=('icedtea-web-java7')
  conflicts=('icedtea-web')

  cd "${srcdir}"/${_pkgbase}-${pkgver}
  # possible make target (see bottom of Makefile.am: install-exec-local install-data-local
  make DESTDIR="${pkgdir}" install-exec-local install-data-local

  # Install desktop files.
  install -m 755 -d "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m 644 javaws.png "${pkgdir}"/usr/share/pixmaps
  install -m 644 {javaws,itweb-settings}.desktop "${pkgdir}"/usr/share/applications
  # remove splitted doc files
  rm -rf "${pkgdir}"/usr/share/doc

  # link binaries into /usr/bin + jre/bin
  install -m 755 -d "${pkgdir}"/usr/bin
  pushd "${pkgdir}"/usr/share/${_pkgbase}/bin
  for file in *; do
    ln -sf /usr/share/${_pkgbase}/bin/${file} "${pkgdir}"/usr/bin
  done
  popd

  # link the mozilla-plugin - test it here http://www.java.com/en/download/help/testvm.xml
  install -m 755 -d "${pkgdir}"/usr/lib/mozilla/plugins/
  ln -sf /usr/share/${_pkgbase}/lib/IcedTeaPlugin.so "${pkgdir}"/usr/lib/mozilla/plugins/
}

package_icedtea-web-doc-jre32() {

  pkgdesc='icedtea-web browser plugin + Java WebStart - documentation files'
  replaces=('icedtea-web-java7-doc')
  conflicts=('icedtea-web-doc')

  cd "${srcdir}"/${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install-data-local
  # remove javaws about and man page
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/share/icedtea-web # conflicting and unneeded file it seems
}
