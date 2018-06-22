# Maintainer: kpcyrd <git@rxv.cc>

_gitname=snail
pkgname=snail-git
pkgver=0.1.0.r0.g6b15f3b
pkgrel=1
pkgdesc="Secure multithreaded packet sniffer"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp')
makedepends=('cargo' 'git')
provides=('snail')
conflicts=('snail')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail.conf')
source=("git+https://github.com/kpcyrd/$_gitname.git"
        "snail.conf")
sha512sums=('SKIP'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  cargo build --release --locked
}

check() {
  cd "$_gitname"
  cargo test --release --locked
}

package() {
  cd "$_gitname"
  install -Dm755 target/release/snaild \
                 target/release/snailctl \
                 -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/snail.conf" -t "$pkgdir/etc"
  install -Dm644 scripts/* -t "$pkgdir/usr/lib/snaild/scripts"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/snail.7 \
                 -t "$pkgdir/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "$pkgdir/usr/share/man/man8"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"
}

# vim:set ts=2 sw=2 et:
