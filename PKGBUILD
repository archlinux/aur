# Maintainer: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=2.0.2
pkgrel=1
pkgdesc='A fancy self-hosted monitoring tool'

arch=('any')
url="https://github.com/louislam/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-dist-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/dist.tar.gz"
  "uptime-kuma.service"
  "sysusers.conf"
  "tmpfiles.conf"
)
noextract=("${pkgname}-${pkgver}.tar.gz")

b2sums=('129b312cae14a17423de50f3dd9dba463bf13306ae6b27121145196f302483abf02ee651b09f343a20d7f2c12495d5b1e5ab5e2f00621f9e3ef6d136fac64e12'
        'c5b68e3f272889c357bc6c9320e89dcee80c9f49ab93afa32f6875384addba59b31cb6b0794b55053e3ab3e451362605047b5641c6f8a449e5161692b1d26178'
        'e94993b96c0934e22979f714fe73e12328a8820ec6604cfd8cda19cf3396d31d5d1b23480dd72cf20e861a62ddf1401623ec7cc582310c6a2f2257d7b810bcc6'
        'b335b1456591386937213f608b92fa4bf6e4431452f09583f030f0bb1edecdf5c6ce01b284e1bd3324738d565f38142339679cbbea18d19a0781806831214864'
        '05b89792c16d415e380dd0b3a2cec04e12406646531f0ce9d8c7aeff29cdd56b452ee4411aa07f404d2511bb315cc619567eee328b39c8b78f93ed88ddd9c7d6')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/

  ln -s /var/lib/$pkgname "$pkgdir"/usr/lib/node_modules/$pkgname/data

  # systemd integration
  install -vDm644 uptime-kuma.service \
     "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -vDm644 sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -vDm644 tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
