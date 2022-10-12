# Maintainer: Nick Cao <nickcao@nichi.co>

pkgbase=jool
pkgname=(jool-tools jool-dkms)
pkgver=4.1.8
pkgrel=1
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=('x86_64')
url="https://www.jool.mx"
license=('GPL2')
makedepends=('libnl')
optdepends=('iptables')
backup=('etc/jool/jool_siit.conf'
        'etc/jool/jool.conf'
       )
source=("https://github.com/NICMx/Jool/releases/download/v${pkgver}/jool-${pkgver}.tar.gz"
        "jool.service"
        "jool_siit.service"
        "jool_siit.conf.example"
        )
sha256sums=('66d83e50a25abfcbfb3e371b2478aee60828fba7706f225898c272df9f47af43'
            '2d50ad60e284876f09051a4d44d4cc51da4b354cb4ff7acf85de864427d360b5'
            '0de3cc336ec9587bb3d62c81062977687a439403cc30d14d9798502d8626ce5f'
            '6a458bf27741f2bc82739a0feead31197f0d95e7fa39719dc090c4fafe056540')

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
  depends=('libnl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}/jool.service" "${pkgdir}/usr/lib/systemd/system/jool.service"
  install -D -m0644 "${srcdir}/jool_siit.service" "${pkgdir}/usr/lib/systemd/system/jool_siit.service"
  install -D -m0644 "${srcdir}/jool_siit.conf.example" "${pkgdir}/etc/jool/jool_siit.conf"
}

package_jool-dkms() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Kernel modules"
  depends=('dkms')
  optdepends=('linux-headers: Build the module for Arch kernel'
              'linux-lts-headers: Build the module for LTS Arch kernel')
  install -dm 755 "${pkgdir}/usr/src"
  cp -a --no-preserve='ownership' "${pkgbase}-${pkgver}-dkms" "${pkgdir}/usr/src/jool-${pkgver}"
}
