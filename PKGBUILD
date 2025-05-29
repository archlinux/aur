# Maintainer:  Edmund Lodewijks <edmund@proteamail.com>

pkgname=danebot-git
_pkgname=danebot
_commit=2da45ba
pkgver=0.0.1
pkgrel=1
pkgdesc="Certbot wrapper for DANE TLSA-safe certificate Let's Encrypt certificate rollover."
arch=('any')
url='https://github.com/tlsaware/danebot'
license=('MIT')
depends=(
	'certbot'
	'perl-net-dns-sec'
)
makedepends=('git')
source=("danebot::git+${url}#commit=${_commit}")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname"

  # In this case, `make check' checks for dependencies.
  make check

  # Create man page
  sed 's/C</B</g' danebot.1.pod | /usr/bin/core_perl/pod2man --section='1' --center='User Commands' --name=DANEBOT --release=danebot --quotes=none > danebot.1
}

package() {
  cd "$_pkgname"
 
  # install shell script
  install -Dm755 -t "$pkgdir/usr/bin" danebot

  # install default configuration
  install -Dm644 -t "$pkgdir/etc/default" danebot.default

  # SystemD files
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" danebot.{service,timer}

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # man page and documentation
  install -Dm644 -t "$pkgdir/usr/share/man/man1" danebot.1
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
