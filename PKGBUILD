# Maintainer: strifel <aur@strifel.de>
pkgname=caddy-desec
pkgver=2.10.2
pkgrel=1
pkgdesc="Caddy web server"
arch=('any')
url="https://github.com/caddyserver/caddy"
license=('Apache-2.0')
makedepends=('go' 'xcaddy')
provides=("caddy")
conflicts=("caddy")
source=(
  "Caddyfile"
  "caddy.service"
  "caddy.sysusers"
  "caddy.tmpfiles"
  "Caddyfile-example"
)
sha256sums=('9bca9b879484cd1e6c7191c83e077ba9c851c2c10c998333219179bfb0fb93f7'
            'dbaedf6929f5292d9ec32d2bcb4990cb3747b58940b385d26564e1abb5dd89ab'
            'a9294eeba17a8fd57cf11cef21e2eb3719a016646eeac0764a0d9f9f380a40ef'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            'ba41d76176666d44de85d05e18e4c6ebc3f1d5ef3c64449d01cbcea01e765647')

build() {
  xcaddy build v${pkgver} --with github.com/caddy-dns/desec
}

package() {
  # Install the executables
  install -d "$pkgdir"/usr/bin/
  install -m 755 caddy "$pkgdir"/usr/bin/

  # Basic configuration with example
  install -Dm 644 "${srcdir}/Caddyfile" "${pkgdir}/etc/caddy/Caddyfile"
  install -d "${pkgdir}/etc/caddy/conf.d"
  install -Dm 644 "${srcdir}/Caddyfile-example" -t "${pkgdir}/etc/caddy/conf.d"

  # Systemd service setup
  install -Dm 644 "${srcdir}/caddy.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"
  install -Dm 644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
}
