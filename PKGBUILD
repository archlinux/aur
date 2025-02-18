# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipqr
_app_id=ch.imatt.ClipQR
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple app to scan QR codes on screen and from camera"
arch=('x86_64')
url="https://gitlab.com/imatt-foss/clipqr"
license=('MIT')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
)
makedepends=(
  'desktop-file-utils'
  'go'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxrandr'
)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('dcc3520fe5e226e8acd2c7ab623c2801e8621154d70f15c29427f762653ddedc')

prepare(){
  cd "$pkgname-v$pkgver"
  mkdir -p build/

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=ClipQR \
    "${_app_id}.desktop"
}

build() {
  cd "$pkgname-v$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/$pkgname" .

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_app_id}.png"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
