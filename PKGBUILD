# Maintainer: kpcyrd <git@rxv.cc>

_gitname=snail
pkgname=snail-git
pkgver=0.4.0.r33.gd4d4a3f
pkgrel=1
pkgdesc="Parasitic network manager"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp' 'dbus' 'dhcpcd')
makedepends=('cargo' 'git')
provides=('snail')
conflicts=('snail')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail/snail.conf')
source=("git+https://github.com/kpcyrd/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  cargo build --release --locked
}

check() {
  cd "${_gitname}"
  cargo test --release --locked
}

package() {
  cd "${_gitname}"
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
  "${pkgdir}/usr/bin/snailctl" completions bash > "${pkgdir}/usr/share/bash-completion/completions/snailctl"
  "${pkgdir}/usr/bin/snailctl" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_snailctl"
  "${pkgdir}/usr/bin/snailctl" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/snailctl.fish"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 docs/snail.7 \
                 -t "${pkgdir}/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "${pkgdir}/usr/share/man/man8"
}

# vim:set ts=2 sw=2 et:
