# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>

_pkgbase=icedtea-web
pkgname=icedtea-web-jre32
conflicts=('icedtea-web')
pkgver=1.6.1
pkgrel=1
pkgdesc='Free web browser plugin to run applets written in Java and an implementation of Java Web Start (uses 32-bit JRE)'
arch=('i686' 'x86_64')
url='http://icedtea.classpath.org/wiki/IcedTea-Web'
license=('GPL2')
depends=('bin32-jre' 'java-runtime-openjdk' 'desktop-file-utils')
makedepends=('java-environment-openjdk' 'zip' 'libxtst' 'npapi-sdk' 'rhino' 'junit' 'bin32-jdk'
             'firefox' 'epiphany')
optdepends=('rhino: for using proxy auto config files'
            'icedtea-web-doc: Documentation'
           )
provides=('java-web-start')
replaces=('icedtea-web-java7')
install=install_${pkgname}.sh

# Due to broken path names in the tarball that fails with LANG=C in our chroot
noextract=(${_pkgbase}-${pkgver}.tar.gz)
source=(
  http://icedtea.classpath.org/download/source/${_pkgbase}-${pkgver}.tar.gz
  fix-package-info.patch
)
sha256sums=('a9b46ab6c9dc303c89651143596bc5abea29242b9bdcabdd2dab7c606592c920'
            '3da531a0b2ba99152fe9410591ade01b6ea63a926cc36f3fa0ab39955708940c')

prepare() {
  cd "${srcdir}"
  LANG=en_US.UTF-8 bsdtar -x -f "${srcdir}"/${_pkgbase}-${pkgver}.tar.gz

  patch "${srcdir}/${_pkgbase}-${pkgver}/netx/net/sourceforge/jnlp/security/package-info.java" fix-package-info.patch
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


package() {
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
