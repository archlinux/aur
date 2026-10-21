# Maintainer: Neo_Chen <neochen1024+clda@gmail.com>

pkgname=0c-ime
pkgver=0.2.3
pkgrel=1
pkgdesc="Zhuyin (Bopomofo) input method with statistical and neural candidate selection, for Fcitx5 and IBus"
arch=('x86_64')
url="https://github.com/0c-biggo/0c-ime"
license=('AGPL-3.0-only' 'CC-BY-SA-4.0' 'CC-BY-4.0' 'MIT' 'OGDL-Taiwan-1.0' 'Apache-2.0' 'LicenseRef-SCOWL')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libsoup3'
         'libstdc++' 'webkit2gtk-4.1')
makedepends=('go' 'rust' 'pkgconf' 'fcitx5' 'ibus')
optdepends=('fcitx5: Fcitx5 frontend'
            'ibus: IBus frontend'
            'python: neural candidate selection and punctuation'
            'python-numpy: neural candidate selection and punctuation'
            'python-onnxruntime: neural candidate selection and punctuation')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('f8b48547318cd6b9cd1a8452261c3636a2aaa694bd0faae3391f0c79fa71465b')

_make() {
  make PREFIX=/usr LIBEXECDIR=/usr/lib VERSION="$pkgver" "$@"
}

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw"
  go mod download
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path platforms/settings/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" GOPROXY=off
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export RUSTUP_TOOLCHAIN=stable CARGO_NET_OFFLINE=true
  # the Fcitx5 addon is compiled and linked in one step with CXXFLAGS only
  export CXXFLAGS="$CXXFLAGS $LDFLAGS"
  _make build GOBUILDFLAGS="-buildmode=pie -trimpath -mod=readonly"
}

check() {
  cd "$pkgname-$pkgver"
  build/system/0c-server -check-data -data assets/data
}

package() {
  cd "$pkgname-$pkgver"
  _make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE legal/copyright legal/CC-BY-SA-4.0.txt legal/UNICODE-NOTICE.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
