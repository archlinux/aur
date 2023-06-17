# Maintainer: Ronan Pigott <ronan@rjp.ie>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=sd-ssh-agent
_pkgname=openssh
pkgver=9.3p1
pkgrel=3
pkgdesc="Openssh ssh-agent with support for systemd socket-based activation"
arch=('x86_64')
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
depends=(
  'glibc'
  'openssl'
  'systemd'
)
makedepends=('linux-headers')
source=(
  "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
  '0001-ssh-agent-add-systemd-socket-based-activation.patch'
  'sd-ssh-agent.service'
  'sd-ssh-agent.socket'
  '10-sd-ssh-agent-auth-sock.conf'
)
sha256sums=(
  'e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  patch -Np1 -d "$_pkgname-$pkgver" -i ../0001-ssh-agent-add-systemd-socket-based-activation.patch
  autoreconf "$_pkgname-$pkgver"
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib/ssh
    --sysconfdir=/etc/ssh
    --disable-strip
    --with-systemd
  )

  cd "${_pkgname}-${pkgver}"

  ./configure "${configure_options[@]}"
  make ssh-agent
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 ./ssh-agent "${pkgdir}"/usr/bin/sd-ssh-agent
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user/ ../sd-ssh-agent.service 
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user/ ../sd-ssh-agent.socket 
  install -Dm644 -t "${pkgdir}"/usr/lib/environment.d/ ../10-sd-ssh-agent-auth-sock.conf
}

# vim: ts=2 sw=2 et:
