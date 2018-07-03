# Maintainer: Arda Aytekin <aytekin@protonmail.com>

pkgname=vpn-unlimited
pkgver=4.22
pkgrel=1
pkgdesc='VPN Unlimited client application'
arch=('x86_64' 'i686')
url='https://www.vpnunlimitedapp.com'
license=('custom:"Copyright (c) 2017 KeepSolid Inc."')

source_x86_64=("vpn-unlimited" "vpn-unlimited-daemon.service"
  "http://apt.keepsolid.com/debian/pool/main/v/vpn-unlimited/vpn-unlimited_${pkgver}_amd64.deb")
md5sums_x86_64=('8623605b1bef9eda0f451a9b4447629f'
                'eec970693be55274ff2e85e596407f20'
                '5facf5171cabac5efde9d0f7bddd36de')

depends=("glibc>=2.9" "qt5-base>=5.2.1" "qt5-script>=5.2.1" "qt5-webkit>=5.1.1"
         "gcc-libs>=4.4.15" "zlib>=1.2.0" "openvpn" "openresolv" "lzo>=2.0"
         "libcurl-openssl-1.0" "iproute" "net-tools" "c-ares>=1.10.0")

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

  # Copy the wrapper file
  mv "${pkgdir}/usr/bin/vpn-unlimited" "${pkgdir}/usr/share/vpn-unlimited/"
  install -Dm755 "${srcdir}/vpn-unlimited" "${pkgdir}/usr/bin/vpn-unlimited"

  # Copy the license file
  install -Dm644 "${pkgdir}/usr/share/doc/vpn-unlimited/copyright" \
    "${pkgdir}/usr/share/licenses/vpn-unlimited/copyright"

  chmod --recursive go-w "${pkgdir}/usr"
}
