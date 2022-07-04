# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=huekeys
pkgver=0.5.10
pkgrel=1
pkgdesc="Control the keyboard backlight on System76 laptops"
arch=('x86_64')
url="https://github.com/BitPonyLLC/huekeys"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'system76-dkms')
makedepends=('git' 'go')
_commit=e75c681f54ee7cfc0fc1839b6fdf48a7963f8ac4
source=("git+https://github.com/BitPonyLLC/huekeys.git#commit=${_commit}?signed"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('SKIP'
            'dec3af63f1e48d4b77798b80b2941c0a70b26a5f9f832c793d9f28f665744a14'
            'c81d55e46f5c4fb7e02837d4625875ef4b413664972ae8316841319b8458b90e')
validpgpkeys=('CBAEF8F32E3F32BFA9B5161487A9206416E3D33B') # bradrf <brad@bitpony.com>

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/gopath"
  go mod tidy
}

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make

  # Generate shell completions
  ./"$pkgname" completion bash > "$pkgname.bash"
  ./"$pkgname" completion fish > "$pkgname.fish"
  ./"$pkgname" completion zsh > "_${pkgname}"

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_${pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
