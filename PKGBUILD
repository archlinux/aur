# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone-git
_pkgname="${pkgname%-git}"
pkgver=r227.66a5d907
pkgrel=1
pkgdesc='A standalone version of Dalvik with Art built in'
url='https://gitlab.com/android_translation_layer/art_standalone'
arch=(x86_64 aarch64 armv7h)
license=('Apache-2.0')
depends=(
  bash
  bionic_translation
  expat
  gcc-libs
  glibc
  icu
  libbsd
  libpng
  libunwind
  lz4
  openssl
  wolfssl-jni
  xz
  zlib
)
makedepends=(
  bsd-compat-headers
  git
  jdk8-openjdk
  libcap
  python
  valgrind
  zip
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git/")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  make ____PREFIX=/usr ____LIBDIR=lib
  # make adbd
}

package() {
  depends+=(java-runtime)

  cd "${_pkgname}"

  DESTDIR="${pkgdir}" make \
    ____PREFIX="${pkgdir}/usr" \
    ____INSTALL_ETC="${pkgdir}/etc" \
    ____LIBDIR=lib \
    install

  # DESTDIR="${pkgdir}" make \
  #   ____PREFIX="${pkgdir}/usr" \
  #   install_adbd
}
