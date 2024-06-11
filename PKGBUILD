# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Douglas Chimento <dchimento at gmail>

pkgname=lightning-terminal
_pkgname=litd
pkgver=0.13.0_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Terminal (LiT) is a browser-based interface for managing channel liquidity on the Lightning Network (LND). ⚡"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-terminal"
optdepends=('lnd')
license=('MIT')
provides=('litd' 'litcli')
conflicts=('lightning-terminal-bin')
backup=("etc/${_pkgname}/${_pkgname}.conf" "etc/default/${_pkgname}")
source=(
    "https://github.com/lightninglabs/${pkgname}/releases/download/v${_pkgver}/lightning-terminal-linux-amd64-v${_pkgver}.tar.gz"
    "${_pkgname}.user"
    "${_pkgname}.conf"
    "${_pkgname}-chown.hook"
    "${_pkgname}.service"
    "${_pkgname}.env"
)
sha512sums=('1d2f51db8e452a4b216c4b091c787615d14b1a492ba1d914d6f6a7bdf7aeb63b5e8dc426825ef8821bc0faf53215254d3486740dad086dd11b989ecc87a428b9'
            '7df7f3fa6602837d30976455dc0457743a92b0399d9280c2226132379812f91a07841ef515445dfa894d63f4b9288986382382d3018bae194a308fb8b9253a7d'
            '90b66e7c96b942fdae76f505253c6aa1844b3eefeb69c7f1132f4500c5d269cdad13da68475dae9a3560d11e14759416391783ff627050b2080ef18f64f36b21'
            '08f9148f53b3b5aa398c65d245048c41a9e89d041b3123fe2bb7725556c51312f478f9ddb2b64196329024b6fcda55268c6e7cc9db469c6f4835cbc72847d035'
            '080180e7866e89fdbb761bbdfb857802a48b007d68f4905c6a978a48ad2a677cb15958fe2ebe8d888a2949452c325605771d99d47a661ae8ceac3decfc5413c1'
            'ae42bf29123202adc815dc261e1e82a16aed32faf0a8c75f17ba9c983db219cad1e972d9836d6da7f6599505c8aa5884f8f77c213e1c17ed5e0a8fcd9b6e3524')

package() {
  install -Dm 755 "$srcdir/$pkgname-linux-amd64-v${_pkgver}/litcli" -t "$pkgdir/usr/bin";
  install -Dm 755 "$srcdir/$pkgname-linux-amd64-v${_pkgver}/litd" -t "$pkgdir/usr/bin";

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
