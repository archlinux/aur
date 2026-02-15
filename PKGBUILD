# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Joost Bremmer <contact at madeofmagicandwires dot online>
# Contributor: Bogdan <d0xi at inbox dot ru>
pkgname=cheat
pkgver=4.7.0
pkgrel=1
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/cheat/cheat"
license=('MIT AND CC0-1.0')
depends=('glibc')
makedepends=(
  'git'
  'go'
  'pandoc'
)
optdepends=('fzf: Fuzzy Finder integration for bash-completion')
conflicts=("python-$pkgname")
backup=("etc/$pkgname/conf.yml")
_commit=36bdb99dcfadde210503d8c2dcf94b34ee950e1d
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'conf.yml'
        "git+https://github.com/cheat/cheatsheets.git#commit=${_commit}")
sha256sums=('61ce6b948d5e154b66535f6c77ea29b426e7a99c7c17d11169e6b8c4b2a600ac'
            'be2c76aea3937146b49ac6f81ae7f22a9521486d3d6e51414da3dafbcb01ea6e'
            'daed9ee395975c898ea392885960ac5c01d5695bafcdee220b153911b8c10318')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
  go mod vendor
  go mod tidy
  go mod verify
  go build -v -o build "./cmd/$pkgname"

  # Clean module cache for makepkg -C
  go clean -modcache

  # Generate man page
  pandoc -s -t man "doc/$pkgname.1.md" -o "doc/$pkgname.1"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "scripts/$pkgname.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "scripts/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "scripts/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "scripts/$pkgname.zsh" "$pkgdir/usr/share/doc/$pkgname/_$pkgname"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/$pkgname-LICENSE"
  install -Dm644 "doc/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"

  install -d "$pkgdir/usr/share/$pkgname/cheatsheets/community"
  find "$srcdir/cheatsheets" \
    -maxdepth 1 \
    -type f \
    -perm 644 \
    -exec \
      install -m644 "{}" \
      "$pkgdir/usr/share/$pkgname/cheatsheets/community/" \;
  install -Dm644 "$srcdir/conf.yml" -t "$pkgdir/etc/$pkgname/"
  install -Dm644 "$srcdir/cheatsheets/.github/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/cheatsheets-LICENSE"
}
