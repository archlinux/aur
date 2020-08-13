# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
pkgname=dpdk-git
pkgver=v20.08.r6.b9b10ddb4
pkgrel=1
pkgdesc="A set of libraries and drivers for fast packet processing"
arch=("x86_64")
url="https://www.dpdk.org"
license=("custom")
depends=("numactl" "libpcap" "python" "libelf" "libbsd" "libbpf" "jansson")
makedepends=("git" "meson" "linux-headers")
provides=("dpdk")
options=("staticlibs")
source=("${pkgname}::git+https://dpdk.org/git/dpdk")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]+-)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson build
  pushd build
  meson configure -Dprefix="/usr"
  ninja
  popd
}

package() {
  cd "${srcdir}/${pkgname}"
  pushd build
  DESTDIR=${pkgdir} ninja install
  popd
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -t ${pkgdir}/usr/share/licenses/${pkgname} license/*
}

# vim: set ts=2 sts=2 sw=2:
