# Maintainer: ml <>
pkgname=ionosctl
pkgver=5.0.1
pkgrel=1
pkgdesc='IONOS Cloud CLI'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/ionos-cloud/ionosctl'
license=('custom:UNKNOWN')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e00eeac1c2bc41d8bf426b6e9f1ee6a9ef43d4c4bf74c82fa36f6a8b8bd725ad')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  IFS=. read -r major minor patch <<<"$pkgver"
  go build -o "$pkgname" -ldflags "-linkmode=external \
    -X github.com/ionos-cloud/ionosctl/commands.Major=$major
    -X github.com/ionos-cloud/ionosctl/commands.Minor=$minor
    -X github.com/ionos-cloud/ionosctl/commands.Patch=$patch"

  # @TODO powershell completions. path?
  for shell in bash zsh fish; do
    ./"$pkgname" completion "$shell" >completion."$shell"
  done
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs -T "$pkgdir/usr/share/doc/$pkgname"
}
