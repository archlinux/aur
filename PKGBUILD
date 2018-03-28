# Maintainer: Adam S Levy <adam@aslevy.com>

pkgname='factom-walletd'
pkgver='0.4.2.21'
pkgrel='1'
pkgdesc='Server for the factom wallet web service api'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/FactomProject/factomd'
license=('custom:MIT')
makedepends=('go' 'git' 'glide')
source=("git+https://github.com/FactomProject/$pkgname#tag=v$pkgver")
md5sums=('SKIP')
build()
{
  cd "$srcdir"
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  local gosrcdir="$GOPATH/src/github.com/FactomProject"
  mkdir -p "$gosrcdir"
  ln -sf "$srcdir"/$pkgname "$gosrcdir"

  cd "$gosrcdir/$pkgname"

  echo "Downloading dependencies"
  glide install -v

  echo "Building $pkgname version=$pkgver commit=$revision"
  go install -ldflags "-X github.com/FactomProject/factom-walletd/vendor/github.com/FactomProject/factom/wallet.WalletVersion=$pkgver"
}


package()
{
  cd "$GOBIN"
  install -d "$pkgdir/usr/bin/"
  install -Dsm755 $pkgname "$pkgdir/usr/bin/"

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/factom-walletd/LICENSE"
}
