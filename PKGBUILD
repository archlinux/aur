# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=netbird-dashboard
pkgver=2.94.0
pkgrel=1
pkgdesc="This project is the UI for NetBird's Management service."
arch=('any')
url="https://github.com/netbirdio/dashboard"
depends=('bash' 'gettext')
optdepends=('nginx: reverse-proxy'
            'rsync: faster dashboard regeneration')
makedepends=('nodejs' 'npm')
license=('AGPL-3.0')
backup=('etc/netbird-dashboard.env')
source=("$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/dashboard/archive/refs/tags/v${pkgver}.tar.gz"
        'netbird-dashboard-generate'
        'netbird-dashboard.env'
        'netbird-dashboard.hook')
sha512sums=('0bc41c82461194bb8c982bb24b56ba13ed8d4619069e72e9180e851cbf81d2e58cb447e8279cc5005e7e2753343133d3178825df45b9d7079037daf02fdb51fa'
            'dbf7e29b71edc90cbc450e9aa27507efd6d551add4eb276c96c40bab2c77094762ae4edd6339d229e7e202821ff8f35c9f5ae6a82bd7144127adc50fc52d1256'
            'd6e16ac4413e054ff39048b3d587e50d7f0b33615d69608ce4a9920d72ec59321b29ebaf59cef80c94670b4dc7771c02c94cde1a7cc6bc1f9b828167daa55e58'
            'e910231f43e6b4d72c71492edbca027671a7bce5d80b954b4d88120ecec123468f03abbda6a334817509792ab2ad723480966589cd22438c4535e55839003fce')

build() {
  cd "dashboard-$pkgver"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -r ${srcdir}/dashboard-$pkgver/out/* ${pkgdir}/usr/share/webapps/${pkgname}/
  install -Dm0644 ${srcdir}/dashboard-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm0755 ${srcdir}/netbird-dashboard-generate $pkgdir/usr/bin/netbird-dashboard-generate
  install -Dm0644 ${srcdir}/netbird-dashboard.env $pkgdir/etc/netbird-dashboard.env
  install -Dm0644 ${srcdir}/netbird-dashboard.hook $pkgdir/usr/share/libalpm/hooks/netbird-dashboard.hook
}
