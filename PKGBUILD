# Maintainer: Adam S Levy <adam@aslevy.com>

pkgname='factom-walletd'
pkgver='0.4.2.21'
pkgrel='5'
pkgdesc='Server for the factom wallet web service api'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/FactomProject/$pkgname"
license=('custom:MIT')
makedepends=('go' 'git')
options=('emptydirs')
install="$pkgname.install"
backup=("var/lib/$pkgname/m2/factomd.conf")
source=("git+$url#tag=v$pkgver" "$pkgname.service" "sysusers-$pkgname.conf" "$pkgname.conf")
sha256sums=('SKIP'
            'a1436cbcf300f94eba4a4ac106856ff3e7bbfcae1cc9d441b1c26ce41fbe9c0d'
            '2f7c439f58d94cdd2221961cac6b8cec1dcffdc2bb5bcea8d88ca0b41cc2b278'
            'c2258e78a4d8bbc68c7d9b071f6bab1fe64b1c9dcc4bb0f94c7f8ba9aa37ccc3')
build()
{
  cd "$srcdir"
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  local gosrcdir="$GOPATH/src/github.com/FactomProject"
  mkdir -p "$gosrcdir"
  ln -sf "$srcdir"/$pkgname "$gosrcdir"

  # The upstream release of glide fixes a bug that affects using the
  # --strip-vendor option
  go get -u github.com/Masterminds/glide
  go install github.com/Masterminds/glide

  cd "$gosrcdir/$pkgname"

  echo "Downloading dependencies"
  glide install --strip-vendor

  echo "Building $pkgname version=$pkgver commit=$revision"
  go install -ldflags "-X github.com/FactomProject/$pkgname/vendor/github.com/FactomProject/factom/wallet.WalletVersion=$pkgver"
}


package()
{
  cd "$srcdir"
  install -Dm644 $pkgname.service       "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers-$pkgname.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # Yes, this IS supposed to be named factomd.conf
  install -Dm640 $pkgname.conf "$pkgdir/var/lib/$pkgname/m2/factomd.conf"

  cd "$srcdir/bin"
  install -Dsm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/etc"
  ln -s          ./                                "$pkgdir/var/lib/$pkgname/.factom"
  # Create a link to the configuration in /etc/ for convenience
  ln -s          /var/lib/$pkgname/m2/factomd.conf "$pkgdir/etc/$pkgname.conf"
}
