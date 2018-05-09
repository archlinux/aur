# Maintainer: Adam S Levy <adam@aslevy.com>

pkgname='factomd'
pkgver='5.0.0'
pkgrel='6'
pkgdesc='Factom Daemon'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/FactomProject/$pkgname"
license=('custom:MIT')
makedepends=('go' 'git' 'glide')
install="$pkgname.install"
source=("git+$url#tag=v$pkgver" "$pkgname.service" "sysusers-$pkgname.conf")
backup=('var/lib/factomd/m2/factomd.conf')
sha256sums=('SKIP'
            '6eae473819b478d352b3d0a107c9b27d85b399950f115a9697485db396d6a225'
            'fc0216361e6045dc681d4564a2aacf5ef43a0f52360235c860c096a874c241c3')
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

  revision=$(git rev-parse HEAD)
  echo "Building $pkgname version=$pkgver commit=$revision"
  go install -ldflags "-X github.com/FactomProject/factomd/engine.Build=$revision -X github.com/FactomProject/factomd/engine.FactomdVersion=$pkgver"
}

package()
{
  cd "$srcdir"
  install -Dm644 $pkgname.service       "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers-$pkgname.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$srcdir/bin"
  install -Dsm755 $pkgname     "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname"
  install -Dm644 $pkgname.conf "$pkgdir/var/lib/$pkgname/m2/$pkgname.conf"
  ln -s          ./            "$pkgdir/var/lib/$pkgname/.factom"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
