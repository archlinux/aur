# Maintainer: Nick Cao <nickcao@nichi.co>

pkgbase=jool
pkgname=(jool-tools jool-dkms)
pkgver=4.0.7
pkgrel=5
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=('x86_64')
url="https://www.jool.mx"
license=('GPL2')
source=("https://github.com/NICMx/Jool/releases/download/v${pkgver}/jool-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ydahhrk/packaging/master/Jool/debian/jool-tools.jool.service"
        "https://raw.githubusercontent.com/ydahhrk/packaging/master/Jool/debian/jool-tools.jool_siit.service")
sha512sums=('adc269c75b7195fbb6de04ecc50824b464644bcaf1ba00634912cbdc21308b872273f4dc5b866f2af9dfd58fedf624e77e0ddaf68403447e6749f7fd0e50146f'
            'd3f6b88d4551c501455f1c1f8c33b7fbc667ae3d69c1793d230dcfc7b7b96fda46ac18449cacde54121e69f08de9a8eb97a5927b540381274b966cdeb3a84690'
            '4078ea3a99831c7aa8d7b8d05529f27aaa7289a8cfae90d122fe69d782a30ea4d31f8f71a9edcdcec774b12cd329123607522640fcfc4eac4b588bbec70b5d92')

prepare() {
  cp -a jool-${pkgver} jool-dkms-${pkgver}
}

build() {
  cd jool-${pkgver}
  ./configure --prefix=/usr
  make
}

package_jool-tools() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Userspace tools and libraries"
  depends=('libnl')
  cd jool-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m0644 "${srcdir}"/jool-tools.jool.service "${pkgdir}"/usr/lib/systemd/system/jool.service
  install -D -m0644 "${srcdir}"/jool-tools.jool_siit.service "${pkgdir}"/usr/lib/systemd/system/jool_siit.service
}

package_jool-dkms() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Kernel modules"
  depends=('dkms')
  optdepends=('linux-headers: Build the module for Arch kernel'
              'linux-lts-headers: Build the module for LTS Arch kernel')
  install -dm 755 "${pkgdir}"/usr/src
  cp -dr --no-preserve='ownership' jool-dkms-${pkgver} "${pkgdir}/usr/src/jool-${pkgver}"
}

