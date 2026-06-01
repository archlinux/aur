# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=uptime-kuma
pkgver=2.4.0
pkgrel=1
pkgdesc='A fancy self-hosted monitoring tool'

arch=('any')
url="https://github.com/louislam/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
backup=('etc/uptime-kuma/config.env')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-dist-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/dist.tar.gz"
  "uptime-kuma.service"
  "sysusers.conf"
  "tmpfiles.conf"
  "config.env"
)
noextract=("${pkgname}-${pkgver}.tar.gz")

b2sums=('3acaafbdf319706718b9dc26207768a6c4c105bd95f6c5a72b000bf90e274cbf27990143d90c7d4509ac9e9ff592b7f6f3061cf283e604a3f855b1906a3a3f19'
        'cf7ae62ce26e77a0ef5498024e9bc6921034373586b82d16936eef5e0d8cceca367b8f7dbd959b09d12ba9bfb41b146eab0d3cd5ecc9f9088eaac33813084b81'
        'e47645e66b3df7fa7bd9882a38c438d09385994a8e8e8b4a8530add90da14cd4e0ea0fde6367f394ee460f861078d242b87db4cb2851adffdb727f63d9651684'
        'b335b1456591386937213f608b92fa4bf6e4431452f09583f030f0bb1edecdf5c6ce01b284e1bd3324738d565f38142339679cbbea18d19a0781806831214864'
        '05b89792c16d415e380dd0b3a2cec04e12406646531f0ce9d8c7aeff29cdd56b452ee4411aa07f404d2511bb315cc619567eee328b39c8b78f93ed88ddd9c7d6'
        '808783618bb9f38e42adfa29e98610963bde12e67fc9ff17447650881433e6bd648b35f281ba96e59806676642253fb9e55c3a5bb4d18a19cfd18a3630faeb9b')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/

  install -vDm644 config.env "$pkgdir"/etc/uptime-kuma/config.env

  # systemd integration
  install -vDm644 uptime-kuma.service \
     "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -vDm644 sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -vDm644 tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
