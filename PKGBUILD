# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Roasbeef
# URL: https://github.com/lightningnetwork/lnd
# Upstream: https://github.com/lightningnetwork/lnd

pkgname=('lnd-git')
pkgver=0.5.1.beta.rc3
pkgrel=1
pkgdesc='The Lightning Network Daemon, for secure off-chain bitcoin transactions.'
arch=('x86_64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('git' 'dep' 'go' 'fakeroot')
provides=('lnd' 'lnd-cli')
conflicts=()
source=("$pkgname::git+https://github.com/lightningnetwork/lnd.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir"
  rm -fr "$srcdir/src"
  git clone "$srcdir/$pkgname" "$GOPATH/src/github.com/lightningnetwork/lnd"
}

package() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/lightningnetwork/lnd"
  dep ensure
  go install . ./cmd/...

  for _bin in lnd lncli; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin";
  done

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
