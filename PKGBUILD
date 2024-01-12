# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgbase=jool
pkgname=(jool-tools jool-dkms)
pkgver=4.1.11
pkgrel=1
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=("x86_64")
url="https://www.jool.mx"
license=("GPL2")
makedepends=("libnl" "dkms")
optdepends=("iptables")
backup=("etc/jool/jool_siit.conf"
        "etc/jool/jool.conf"
       )
source=("https://github.com/NICMx/Jool/releases/download/v${pkgver}/jool-${pkgver}.tar.gz"
        "jool.service"
        "jool_siit.service"
        "jool_siit.conf.example"
        )
b2sums=("4f2700c90f6edbab4286c1b3231609edb101bd8080c26c20189401fce7965eb1aacb69bf12ed9f18bcbb6bb74ad9f6de83ae8c23475d3a4583cd67d0f3261b38"
		"f8773d5091ac8c1b9e42f341f775d95ba5b3d5229fae5f621fc1ccf11627865473660b084a53ed4016b046c417e008f66e881e08e226eb77f3f62ff7dd1a911b"
		"e8a0a3118f85172b8eed8e714d5e1c52a6abf83db584d008e3d7842afb679e38b9b935f2308aaa6655b284d0642a43369b7e6411b0f2fba9cd371bcda16a084e"
		"c3290a1c2908e3789f9791d44f1f79a85ebbbcb4f2edea9b4e10f1fbee45138f203f49fb5b8066305f2dbebdc8d2d1a8b554ea23b1687ed57cf1879f2d0cd681")

prepare() {
  cp -a "${pkgbase}-${pkgver}" "${pkgbase}-${pkgver}-dkms"
}

build() {
  cd "${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package_jool-tools() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Userspace tools and libraries"
  depends=("libnl")
  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}/jool.service" "${pkgdir}/usr/lib/systemd/system/jool.service"
  install -D -m0644 "${srcdir}/jool_siit.service" "${pkgdir}/usr/lib/systemd/system/jool_siit.service"
  install -D -m0644 "${srcdir}/jool_siit.conf.example" "${pkgdir}/etc/jool/jool_siit.conf"
}

package_jool-dkms() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Kernel modules"
  depends=("dkms")
  optdepends=("linux-headers: Build the module for Arch kernel"
              "linux-lts-headers: Build the module for LTS Arch kernel")
  install -dm 755 "${pkgdir}/usr/src"
  cp -a --no-preserve="ownership" "${pkgbase}-${pkgver}-dkms" "${pkgdir}/usr/src/jool-${pkgver}"
}
