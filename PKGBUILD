# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipqr
_app_id=ch.imatt.ClipQR
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple app to scan QR codes on screen and from camera"
arch=('x86_64')
url="https://gitlab.com/imatt-foss/clipqr"
license=('MIT')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'wayland'
  'wl-clipboard'
)
makedepends=(
  'git'
  'go'
  'imagemagick'
  'libxkbcommon'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
_commit=9a7d4c195e1b91e745e88570d11170fe9a01f1d0
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "git+https://github.com/flathub/ch.imatt.ClipQR.git#commit=${_commit}")
sha256sums=('9b6c41c13a0d50129b8a0d78adec1747216ebb6a6303b4aa547cbdbab94c0269'
            '8a3be71e895346249a3579aa24a001dfcff40348f520fc4748797031e4b5a71a')

prepare() {
  cd "$pkgname-v$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-v$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -tags wayland -o "build/$pkgname" .

  # Clean module cache for makepkg -C
  go clean -modcache

  # Generate icons
  for i in 16 32 48 64 128 256 512; do
    magick icon.png -resize "${i}x${i}" "icon_${i}x${i}.png"
  done
}

check() {
  cd "${_app_id}"
  appstreamcli validate --no-net "${_app_id}.appdata.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/${_app_id}.png"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 "icon_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_id}.png"
   done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "$srcdir/${_app_id}"
  install -Dm644 "${_app_id}.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
}
