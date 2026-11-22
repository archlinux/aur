# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nipovpn
pkgver=2.1.0
pkgrel=1
pkgdesc="Powerful and secure HTTP proxy with agent and server modes"
arch=('x86_64' 'aarch64')
url="https://github.com/MortezaBashsiz/nipovpn"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl' 'yaml-cpp')
makedepends=('cmake' 'boost')
backup=('etc/nipovpn/config.yaml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('413b5acf3b8da5226dc274e73c75279eac746e3b671be9df37ecd0362f6f7a58')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "../build/core/nipovpn" -t "${pkgdir}/usr/bin"
  install -Dm644 "nipovpn/etc/nipovpn/config.yaml" -t "${pkgdir}/etc/nipovpn"
  install -Dm644 nipovpn/usr/lib/systemd/system/nipovpn-{agent,server}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
  printf 'd /var/log/nipovpn 0755 root root -\n' > "${pkgdir}/usr/lib/tmpfiles.d/nipovpn.conf"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
