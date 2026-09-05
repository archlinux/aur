# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Diego <cdprincipe@gmail.com>
# Contributor: Joel Burget <joelburget@gmail.com>

pkgname=slimlock
_basename=slim
pkgver=1.4.1
pkgrel=1
pkgdesc="Unholy screen locker (without SLiM)"
arch=('i686' 'x86_64')
url='https://slim-fork.sourceforge.io/'
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'libgcc'
  'libjpeg.so'
  'libpng'
  'libstdc++'
  'libx11'
  'libxext'
  'libxft'
  'libxrandr'
  'pam'
)
makedepends=('cmake' 'libxmu')
conflicts=('slimlock-git' 'slim>=1.3.6')
backup=('etc/slimlock.conf')
install='slimlock.install'
source=("https://downloads.sourceforge.net/project/slim-fork/${_basename}-${pkgver}.tar.gz"
        "${_basename}-includes.patch::https://salsa.debian.org/debian/slim/-/raw/master/debian/patches/log.h-Restore-required-includes.patch?ref_type=heads"
        'slimlock.install'
        'slim.conf'
        'https://downloads.sourceforge.net/project/slim.berlios/slim-archlinux-simple.tar.gz'
        'slimlock.pam')
sha1sums=('7860ffe239eac7e2614731a2c49dfb2a9c2975f9'
          '378180a921d8e7536b6bad4425ed8653d2179591'
          '16c89da06114d71df10ef63aa50745a73ec1852c'
          'e44f369bea03b3f9bbccc18240af51f1bd06e0da'
          '4bc79f730d398f748f8bbd0fbb365bec7ec524e9'
          'd08da5a8e82dbba86d62faf48ffa4193dfc0abce')

prepare() {
  cd ${_basename}-${pkgver}
  mkdir -p build
	patch -Np1 -i "${srcdir}/${_basename}-includes.patch"
}

build() {
  cd ${_basename}-${pkgver}/build
  #export CXXFLAGS+=" -std=c++17"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no \
    -DBUILD_SHARED_LIBS=no \
    -DBUILD_SLIMLOCK=yes \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
