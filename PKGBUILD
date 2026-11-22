# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=digwire
pkgver=0.5.0
pkgrel=1
pkgdesc="Hybrid BitTorrent swarm and multi-source web download manager with a Libadwaita look"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/digwire"
license=('MIT' 'MPL-2.0' 'Unlicense')
depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'gtk3' 'webkit2gtk-4.1')
makedepends=('go' 'pkgconf')
optdepends=('yt-dlp: universal social media and streaming downloads'
            'ffmpeg: embedded subtitle extraction and media transcoding'
            'noto-fonts-emoji: color emoji and country flags')
conflicts=('digwire-git')
# LICENSE: v0.5.0 predates the repository's LICENSE (MIT); drop this source at the next tag
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'LICENSE')
sha256sums=('adc7aa95cf41992ac5df182fd19f70bb5bd14acb9122553255da394bbb695162'
            '632dd6c0e8bb0269dd22e245a9fe187a1f069b20ab55258530ada9c2f35b6102')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.Version=$pkgver" -o digwire ./cmd/digwire
}

check() {
  cd "$pkgname-$pkgver"
  ./digwire -version | grep -q "v$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 digwire "$pkgdir/usr/bin/digwire"
  install -Dm644 assets/digwire.desktop "$pkgdir/usr/share/applications/digwire.desktop"
  # the icon is 1024x1024, larger than the hicolor theme's sizes
  install -Dm644 assets/digwire.png "$pkgdir/usr/share/pixmaps/digwire.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 third_party/torrent/LICENSE "$pkgdir/usr/share/licenses/$pkgname/torrent-LICENSE"
  install -Dm644 third_party/soul/LICENSE "$pkgdir/usr/share/licenses/$pkgname/soul-LICENSE"
}
