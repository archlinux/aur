# Maintainer: ml <>
pkgname=ionosctl
pkgver=6.1.6
pkgrel=1
pkgdesc='IONOS Cloud CLI'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/ionos-cloud/ionosctl'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3529d64de2e5d6e84ea716cc61c7b0f09da79ee91507e9eb896340b7ecd30f2f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o "$pkgname" -ldflags "-linkmode=external \
    -X=github.com/ionos-cloud/ionosctl/commands.Version=$pkgver
    -X=github.com/ionos-cloud/ionosctl/commands.Label=release" main.go

  for i in bash zsh fish; do
    ./"$pkgname" completion "$i" >completion."$i"
  done
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
  install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
  install -Dm644 completion.fish "$pkgdir"/usr/share/fish/completions/"$pkgname".fish
  install -dm755 "$pkgdir"/usr/share/doc/"$pkgname"
  cp -a docs -T "$pkgdir"/usr/share/doc/"$pkgname"
}
