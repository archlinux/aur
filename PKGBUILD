# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgbase=jool
pkgname=(jool-tools jool-dkms)
pkgver=4.1.15
pkgrel=2
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=("x86_64")
url="https://www.jool.mx"
license=("GPL2")
makedepends=("libnl" "dkms" "iptables")
optdepends=("iptables")
conflicts=("jool-dkms-git")
backup=("etc/jool/jool_siit.conf"
  "etc/jool/jool.conf"
)
source=("https://github.com/NICMx/Jool/releases/download/v${pkgver}/jool-${pkgver}.tar.gz"
  "jool.service"
  "jool_siit.service"
  "jool_siit.conf.example"
)
b2sums=("f0ac39b4a2f5fecf3039cd02abd1d83dc25faa799bb19ddc840473e10ca2294fae3c22ef00f106e53e304442714f1589d855bee24a2fef541147e806b8f28b0b"
  "192a30675c463d744b5ab47eef2acf57d134970b2d52910ac491faf5e38ac68f01574efbed24a6abe7aff8ee3fd6aee4a50ce1925f8781d286c93fcdaf6c8261"
  "54a32ac29a7bac568e8167ad92794697c8a2746634f0daacfba8f96ff8c600da949a1d67602ab959d72185bdb452476f9d119d44d60e0391e6b8cec7952110de"
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
