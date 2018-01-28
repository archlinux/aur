# Maintainer: kpcyrd <git@rxv.cc>

_gitname=tr1pd
pkgname=tr1pd-git
pkgver=0.2.0.r25.g6707d9d
pkgrel=1
pkgdesc="tamper resistant audit log"
url="https://github.com/kpcyrd/tr1pd"
depends=('gcc-libs' 'libsodium' 'libseccomp' 'libcap')
makedepends=('cargo' 'git')
provides=('tr1pd')
conflicts=('tr1pd')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('AGPL3')
install='tr1pd.install'
source=("git+https://github.com/kpcyrd/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  cargo build --release
}

package() {
  cd "$_gitname"
  install -Dm755 target/release/tr1pd target/release/tr1pctl -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"

  install -Dm644 "contrib/tr1pd.service" "$pkgdir/usr/lib/systemd/system/tr1pd.service"
  install -Dm644 "contrib/tr1pd-sysuser.conf" "$pkgdir/usr/lib/sysusers.d/tr1pd.conf"
  install -Dm644 "contrib/tr1pd-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tr1pd.conf"

  install -d "$pkgdir/etc/bash_completion.d"
  "$pkgdir/usr/bin/tr1pd" bash-completion > "$pkgdir/etc/bash_completion.d/tr1pd"
  "$pkgdir/usr/bin/tr1pctl" bash-completion > "$pkgdir/etc/bash_completion.d/tr1pctl"
}

# vim:set ts=2 sw=2 et:
