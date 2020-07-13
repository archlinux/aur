# Maintainer: Arda Aytekin <aytekin@protonmail.com>

pkgname=vpn-unlimited
pkgver=7.0
pkgrel=4
pkgdesc="VPN Unlimited client application"
arch=("x86_64")
url="https://www.vpnunlimitedapp.com"
license=('custom:"Copyright (c) 2018 KeepSolid Inc."')

source_x86_64=(
  "vpn-unlimited-daemon.service"
  "http://apt.keepsolid.com/debian/dists/buster/main/binary-amd64/vpn-unlimited_7.0+deb10-amd64.deb"
)

sha256sums_x86_64=(
  "dd5ba49842bcbf4c5f722bac2ab3d4c919c676bc29c1ca269678e8a53c0e6a41"
  "b1394bba3de9c4da23f83d29d989e9e72cd8b040cfd3386bcb313e63036085e9"
)

depends=(
  "glibc>=2.9" "qt5-base>=5.2.1" "qt5-script>=5.2.1" "qt5-webkit>=5.2.1"
  "gcc-libs>=4.4.15" "zlib>=1.2.0" "openvpn" "openresolv" "lzo>=2.0"
  "iproute2" "net-tools" "c-ares>=1.10.0" "lsb-release" "strongswan>=5.8.1"
  "qt5-webengine>=5.2.1"
)

package() {
  cd "${srcdir}"

  # Extract the package
  tar --extract --file data.tar.xz --directory "${pkgdir}"

  # Remove the init.d related things
  rm --recursive --force "${pkgdir}/etc"

  # Add the systemd equivalent
  install -Dm644 "${srcdir}/vpn-unlimited-daemon.service" \
    "${pkgdir}/usr/lib/systemd/system/vpn-unlimited-daemon.service"

  # Move sbin to bin
  find "${pkgdir}/usr/sbin" -type f -exec mv '{}' "${pkgdir}/usr/bin/" \;
  rmdir "${pkgdir}/usr/sbin"

  # Copy the license file
  install -Dm644 "${pkgdir}/usr/share/doc/vpn-unlimited/copyright" \
    "${pkgdir}/usr/share/licenses/vpn-unlimited/copyright"
  rm --recursive --force "${pkgdir}/usr/share/doc"

  chmod --recursive go-w "${pkgdir}/usr"
}
