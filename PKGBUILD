# Maintainer: Douglas Chimento <dchimento at gmail>
pkgname=lightning-terminal
_pkgname=litd
pkgver=0.6.2
pkgrel=2
pkgdesc="Lightning Terminal Network Daemon ⚡"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-terminal"
optdepends=('lnd-bin')
license=('MIT')
provides=('litd' 'litcli')
backup=("etc/${_pkgname}/${_pkgname}.conf" "etc/default/${_pkgname}")
source=(
    "https://github.com/lightninglabs/${pkgname}/releases/download/v${pkgver}-alpha/lightning-terminal-linux-amd64-v${pkgver}-alpha.tar.gz"
    "${_pkgname}.user"
    "${_pkgname}.conf"
    "${_pkgname}-chown.hook"
    "${_pkgname}.service"
    "${_pkgname}.env"
)
sha512sums=(
    'f91dcd419f4d9732fb88e7b70cb1ab02437f1e1d875e2aa03d4368b2646707258ccc6cd4a9c023e1fd9c7361f29dcd5e3a9f6986f7937097136df230b03e84a2'
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
)

package() {
  install -Dm 755 "$srcdir/$pkgname-linux-amd64-v${pkgver}-alpha/litd" -t "$pkgdir/usr/bin";
  install -Dm 755 "$srcdir/$pkgname-linux-amd64-v${pkgver}-alpha/litcli" -t "$pkgdir/usr/bin";

  install -m 755 -d "${pkgdir}/usr/lib/sysusers.d"
  install -m 750 -d "${pkgdir}/var/lib/${_pkgname}"
  install -m 750 -d "${pkgdir}/etc/${_pkgname}"
  install -m 755 -d "${pkgdir}/etc/default"
  
  install -m 644 "${srcdir}/${_pkgname}.user" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -m 640 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
  install -m 640 "${srcdir}/${_pkgname}.env" "${pkgdir}/etc/default/${_pkgname}"
  install -Dm 644 "${srcdir}/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"

  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
}

