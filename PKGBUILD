# Maintainer: Hans Ole Hatzel <hhatzel@gmail.com>

pkgname=vorleser-git
pkgdesc='A server to serve audiobook files and synchronize playback positions.'
arch=('i686' 'x86_64')
url='https://github.com/hatzel/vorleser-server'
license=('MIT')
pkgver=0.0.1
pkgrel=1
depends=('systemd' 'ffmpeg' 'sqlite')
provides=('vorleser')
backup=('etc/vorleser.toml')
install='vorleser.install'
makedepends=('rustup' 'git' 'clang')
source=("$pkgname::git+https://github.com/vorleser/vorleser-server" vorleser.service vorleser.sysuser)
sha256sums=(SKIP SKIP SKIP)
OPTIONS+=(debug !strip)

pgkver() {
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $pkgname
  rustup install nightly-2018-09-27
  cargo +nightly-2018-09-27 build --release

  install -D -m755 "$srcdir/$pkgname/target/release/vorleser_server_bin" "$pkgdir/usr/bin/vorleser"
  install -D -m644 "$srcdir/$pkgname/vorleser-default.toml" "$pkgdir/etc/vorleser.toml"
  install -D -m644 $srcdir/vorleser.service "$pkgdir/usr/lib/systemd/system/vorleser.service"
  install -D -m644 $srcdir/vorleser.sysuser "$pkgdir/usr/lib/sysusers.d/vorleser.conf"

  install -D -m644 "$srcdir/$pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
