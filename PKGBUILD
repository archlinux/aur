# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Diego <cdprincipe@gmail.com>
# Contributor: Joel Burget <joelburget@gmail.com>

pkgname=slimlock
_basename=slim
pkgver=1.3.6
pkgrel=3
pkgdesc="Unholy screen locker (without SLiM)"
arch=('i686' 'x86_64')
url="https://github.com/iwamatsu/slim"
license=('GPL2')
depends=('libxft' 'pam' 'libxrandr' 'libpng' 'libjpeg')
makedepends=('cmake' 'libxmu')
conflicts=('slimlock-git' 'slim>=1.3.6')
backup=('etc/slimlock.conf')
install='slimlock.install'
source=(${_basename}-${pkgver}.tar.gz::"${url}/archive/v1.3.6.tar.gz"
        'slimlock.install'
        'slim.conf'
        'https://downloads.sourceforge.net/project/slim.berlios/slim-archlinux-simple.tar.gz'
        'slim-1.3.6-fix-libslim-libraries.patch'
        'slimlock.pam')
sha1sums=('9407ea2ee7b2ed649f17a8ddbf1f7b26a7c7b9fb'
          '16c89da06114d71df10ef63aa50745a73ec1852c'
          'e44f369bea03b3f9bbccc18240af51f1bd06e0da'
          '4bc79f730d398f748f8bbd0fbb365bec7ec524e9'
          'bc77f03262d0bf423210aaf418d2452324b732ec'
          'd08da5a8e82dbba86d62faf48ffa4193dfc0abce')

prepare() {
  mkdir -p ${_basename}-${pkgver}/build
  cd ${_basename}-${pkgver}
  patch -Np1 -i "${srcdir}/slim-1.3.6-fix-libslim-libraries.patch"
}

build() {
  cd ${_basename}-${pkgver}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no \
    -DBUILD_SHARED_LIBS=no \
    ..
  make
}

package() {
  cd ${_basename}-${pkgver}/build
  install -Dm755 slimlock "${pkgdir}/usr/bin/slimlock"
  install -Dm644 ../slimlock.conf "${pkgdir}/etc/slimlock.conf"
  install -Dm644 ../slimlock.1 "${pkgdir}/usr/share/man/man1/slimlock.1"

  install -D -m644 "${srcdir}/slim.conf" "${pkgdir}/usr/share/slimlock/example-slim.conf"

  cd "${srcdir}/slim-archlinux-simple"

  install -D -m644 slim.theme \
    "${pkgdir}/usr/share/slim/themes/slim-archlinux-default/slim.theme"
  install -D -m644 background.png \
    "${pkgdir}/usr/share/slim/themes/slim-archlinux-default/background.png"
  install -D -m644 panel.png \
    "${pkgdir}/usr/share/slim/themes/slim-archlinux-default/panel.png"
  install -D -m644 preview.png \
    "${pkgdir}/usr/share/slim/themes/slim-archlinux-default/preview.png"
  
  # install pam.d config - see https://bugs.archlinux.org/task/48650
  install -Dm644 "${srcdir}/slimlock.pam" "${pkgdir}/etc/pam.d/slimlock"
}

# vim:set ts=2 sw=2 et:
