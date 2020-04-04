# Maintainer: Swift Geek

pkgname=mosys-c
_pkgname=${pkgname%-*}
pkgver=70.11021
pkgrel=1
pkgdesc="ChromiumOS mosys - last version to not require rust"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://chromium.googlesource.com/chromiumos/platform/mosys"
license=('custom')
depends=('flashmap-git' 'libutil-linux')
makedepends=('git' 'ninja')
source=("git+https://chromium.googlesource.com/chromiumos/platform/mosys#branch=release-R70-11021.B ")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${_pkgname}/"
  sed -i '/Werror/d' meson.build
  sed -i 's#/usr/sbin#/usr/bin#' meson.build
}

build() {
  cd "$srcdir/${_pkgname}/"
  # Supported archs: x86. x86_64, amd64, mips, arm, arm64
  [ "$CARCH" = "x86_64" ] && MOSYS_ARCH="$CARCH"
  [ "$CARCH" = "armv7h" ] && MOSYS_ARCH="arm"
  [ "$CARCH" = "aarch64" ] && MOSYS_ARCH="arm64"
  meson build --prefix=/usr -Darch="$MOSYS_ARCH"
  ninja -C build
}

package() {
  cd "$srcdir/${_pkgname}/"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkgname}/LICENSE"
}
