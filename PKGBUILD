# Maintainer: Francis Banyikwa <mhogomchungu at gmail dot com>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=qcheckgmail
_pkgname=qCheckGMail
pkgver=2.1.0
pkgrel=1
pkgdesc="Qt/C++ multiple gmail account checker"
arch=("i686" "x86_64")
url="http://mhogomchungu.github.io/qCheckGMail/"
license=("GPL")
makedepends=("cmake" "extra-cmake-modules")
source=("https://github.com/mhogomchungu/qCheckGMail/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('8ed3d66696a53de338685731f93525f21f5f4a0ed7787310948381d63e5f0b1f')
optdepends=('KF5: support KDE Plasma tray icon tooltip instead of Qt tooltip'
                       'kwallet: support for storing credentials in kwallet'
                       'libsecret: support for storing credentials in libsecret')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mkdir -p build

  if pacman -Qs "KF5" > /dev/null ; then
    buildKF5Support="true"
  else
    buildKF5Support="false"
  fi
  if pacman -Qs "kwallet" > /dev/null ; then
    skipkde="false"
  else
    skipkde="true"
  fi
  if pacman -Qs "libsecret" > /dev/null ; then
    skipsecret="false"
  else
    skipsecret="true"
  fi
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
  -DKF5=$buildKF5Support \
  -DNOKDESUPPORT=$skipkde \
  -DNOSECRETSUPPORT=$skipsecret \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}
