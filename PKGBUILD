# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=uptime-kuma
pkgver=2.4.0
pkgrel=1
pkgdesc='A fancy self-hosted monitoring tool'
arch=('x86_64' 'aarch64')
url="https://github.com/louislam/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
backup=('etc/uptime-kuma/config.env')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "uptime-kuma.service"
  "sysusers.conf"
  "tmpfiles.conf"
  "config.env"
)

b2sums=('3acaafbdf319706718b9dc26207768a6c4c105bd95f6c5a72b000bf90e274cbf27990143d90c7d4509ac9e9ff592b7f6f3061cf283e604a3f855b1906a3a3f19'
        'e47645e66b3df7fa7bd9882a38c438d09385994a8e8e8b4a8530add90da14cd4e0ea0fde6367f394ee460f861078d242b87db4cb2851adffdb727f63d9651684'
        'b335b1456591386937213f608b92fa4bf6e4431452f09583f030f0bb1edecdf5c6ce01b284e1bd3324738d565f38142339679cbbea18d19a0781806831214864'
        '05b89792c16d415e380dd0b3a2cec04e12406646531f0ce9d8c7aeff29cdd56b452ee4411aa07f404d2511bb315cc619567eee328b39c8b78f93ed88ddd9c7d6'
        '808783618bb9f38e42adfa29e98610963bde12e67fc9ff17447650881433e6bd648b35f281ba96e59806676642253fb9e55c3a5bb4d18a19cfd18a3630faeb9b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm ci --cache "${srcdir}/npm-cache" --no-audit --no-fund --no-update-notifier
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm run build
  npm prune --omit=dev --no-audit --no-fund

  # Clean up empty directories left behind by npm prune.
  find node_modules -type d -empty -delete
}

package() {
  install -dm755 "$pkgdir"/usr/lib/node_modules/$pkgname

  cd "${srcdir}/${pkgname}-${pkgver}"
  cp --recursive . "$pkgdir"/usr/lib/node_modules/$pkgname

  install -vDm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -vDm644 "$srcdir"/config.env "$pkgdir"/etc/uptime-kuma/config.env

  # systemd integration
  install -vDm644 "$srcdir"/uptime-kuma.service \
     "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -vDm644 "$srcdir"/sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -vDm644 "$srcdir"/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
