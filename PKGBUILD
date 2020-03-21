# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>
# Contributor: maleadt <tim dot besard at gmail dot com>

pkgname="turbovnc"
pkgdesc="An optimized version of TightVNC"
pkgver=2.2.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.turbovnc.org/"
license=('GPL')
makedepends=('cmake' 'rsync')
depends=('libxaw' 'libxt' 'libxi' 'libxcursor' 'libjpeg-turbo' 'java-environment>=8' 'openssl-1.0')
sha256sums=('821da48c3422e71c5b2cae338058e720078ec74c55c466e5cf90d8e5cc91b2bf'
            'ccadf1fc708fad601e6113464d6c533a629f6dc9116f6071347cd0b465c1f48b')
conflicts=('turbovnc-bin' 'tigervnc' 'tigervnc-svn' 'tightvnc')
replaces=('turbovnc-bin')
source=(${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download
        vncserver.service)

build() {
  mkdir -p "${srcdir}"/${pkgname}-${pkgver}/build
  export JAVA_HOME=/usr/lib/jvm/default/
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/openssl-1.0/pkgconfig
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  ln -sf ../CMakeLists.txt
  cmake -G "Unix Makefiles" \
        -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so     \
        -DTJPEG_JNILIBRARY=/usr/lib/libturbojpeg.so  \
        -DCMAKE_INSTALL_PREFIX=/usr                  \
        -DTVNC_DOCDIR=/usr/share/doc/${pkgname}      \
        -DTJPEG_JAR=/usr/share/java/turbojpeg.jar    \
        ../
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/usr/share/man/man1/Xserver.1
  rm -r "${pkgdir}"/etc/init.d
  install -D -m644 "${srcdir}"/vncserver.service "${pkgdir}"/usr/lib/systemd/system/vncserver.service
}
