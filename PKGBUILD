# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname="lndhub"
pkgver=1.4.1
pkgrel=1
pkgdesc="BlueWallet Lightning Node Manager"
arch=(any)
url="https://github.com/BlueWallet/LndHub"
license=("MIT")
depends=("nodejs>=10" "npm")
makedepends=("npm")
optdepends=('lnd-bin')
source=("https://github.com/BlueWallet/LndHub/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.env" "${pkgname}.user" "${pkgname}.service" "${pkgname}.hook")
sha256sums=(913ab417607cffdadcf33eed41171036bf63e6aac2f26c54ad19e35b2cfce0dc SKIP SKIP SKIP SKIP)
options=('!strip')
backup=("etc/default/${pkgname}")
install=${pkgname}.install

build() {
  cd "${srcdir}/LndHub-${pkgver}"
  npm install --cache "${srcdir}/npm-cache"
}

package() {
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  
  mkdir -p  "${pkgdir}/var/lib"
  cp -a "${srcdir}/LndHub-${pkgver}"  "${pkgdir}/var/lib/${pkgname}"
  
  install -Dm 640 "$srcdir/${pkgname}.env" "$pkgdir/etc/default/${pkgname}"
  install -Dm 644 "$srcdir/${pkgname}.user" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm 644 "$srcdir/${pkgname}.service" -t "$pkgdir/usr/lib/systemd/system"
}
