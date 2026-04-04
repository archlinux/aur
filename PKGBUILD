# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tiny-apk-installer
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple TUI for installing APKs and bundles on Android via ADB."
arch=('x86_64' 'aarch64')
url="https://github.com/audioeng89/tiny_apk_installer"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('android-tools: Use system adb')
source=("tiny_apk_installer-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('818e5afcb5a655d68a9d45261f23d6dc584b8371f1bb60d6e81b6fd387107d17')

prepare(){
  cd "tiny_apk_installer-$pkgver"
  mkdir -p build/
}

build() {
  cd "tiny_apk_installer-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-s -w -linkmode=external -extldflags \"${LDFLAGS}\" \
      -X main.Version=v$pkgver" \
    -o build ./...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "tiny_apk_installer-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
