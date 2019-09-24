# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
pkgname=dpdk-git
pkgver=v19.08.r64.bd253daa7
pkgrel=1
pkgdesc="A set of libraries and drivers for fast packet processing"
arch=("x86_64")
url="https://www.dpdk.org"
license=("custom")
depends=("numactl" "libpcap" "python" "libelf")
makedepends=("git" "meson" "linux-headers")
provides=("dpdk")
options=("staticlibs")
source=("${pkgname}::git+https://dpdk.org/git/dpdk"
        "Add-prefix-to-install-rpath-for-dpdk-test.patch")
sha256sums=('SKIP'
            'b6988c8f103c93ee3216d393f0167f2a174a993a9977f9571cd9dc6a45bcec63')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]+-)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 < "${srcdir}/Add-prefix-to-install-rpath-for-dpdk-test.patch"
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
  cd "${pkgdir}"
  mv lib/* usr/lib
  rm -rf lib
}

# vim: set ts=2 sts=2 sw=2:
