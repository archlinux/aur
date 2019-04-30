# Maintainer: kpcyrd <git@rxv.cc>

pkgname=snail
pkgver=0.4.0
pkgrel=1
pkgdesc="Parasitic network manager"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp' 'dbus' 'dhcpcd')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail/snail.conf')
source=("https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ae1c1db9e87f1e5ff29757955e272bb435b618c6451774097032bd57c5ff19c97fcdaedaf6e3b6e1348b2fb1bcec1bc0d9ed4d3a9d099570d0f2d1f14b3da781')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  # tests are currently failing when built in chroot
  #cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/snaild \
                 target/release/snailctl \
                 -t "${pkgdir}/usr/bin"
  install -Dm644 scripts/* -t "${pkgdir}/usr/lib/snaild/scripts"

  install -d "${pkgdir}/etc/snail/scripts"
  install -Dm644 contrib/snail.conf -t "${pkgdir}/etc/snail"
  install -Dm644 contrib/snail@.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 contrib/snail-tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/snail.conf"
  install -Dm644 contrib/snail-sysuser.conf "${pkgdir}/usr/lib/sysusers.d/snail.conf"

  install -d "${pkgdir}/usr/share/bash-completion/completions"
  "${pkgdir}/usr/bin/snailctl" bash-completion > "${pkgdir}/usr/share/bash-completion/completions/snailctl"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 docs/snail.7 \
                 -t "${pkgdir}/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "${pkgdir}/usr/share/man/man8"
}

# vim:set ts=2 sw=2 et:
