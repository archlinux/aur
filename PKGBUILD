# Maintainer: tarball <bootctl@gmail.com>
# Contributor: brody <archfan@brodix.de>

pkgname=netbird
pkgver=0.21.6
pkgrel=1
pkgdesc='WireGuard-based mesh network'
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD)

depends=(glibc)
makedepends=('go>=1.20')
optdepends=('resolvconf: Private DNS')
replaces=(wiretrustee)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  'environment'
  'netbird@.service'
)
sha256sums=('70e37653756e80a3dd265b13150cdfed3e263c0313e9970af9c5b4516fb0cc93'
            '128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
            '3bd6d2692dc6d08cfabce1ba2514c02f4463294ebbdb63828baca5d9e4c9daa9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  cd "$srcdir/$pkgname-$pkgver"

  go build \
    -ldflags "-s -w -linkmode=external -X github.com/netbirdio/$pkgname/version.version=$pkgver -extldflags \"$LDFLAGS\"" \
    -o build/"$pkgname" \
    client/main.go

  for shell in bash fish zsh; do
    ./build/"$pkgname" completion $shell >build/completion.$shell
  done
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"

  # check that version was set and it works
  [[ "$(./$pkgname version)" == $pkgver ]]
}

package() {
  # environment file
  install -Dm644 environment "$pkgdir/etc/default/$pkgname"

  # systemd unit
  install -Dm644 $pkgname@.service \
    "$pkgdir/usr/lib/systemd/system/$pkgname@.service"

  # config directory
  install -Ddm755 -o root -g root "$pkgdir/etc/$pkgname"

  cd "$srcdir/$pkgname-$pkgver"

  # binary
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # shell completions
  install -Dm644 build/completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -Dm644 build/completion.fish \
    "$pkgdir/usr/share/fish/completions/$pkgname.fish"

  install -Dm644 build/completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
