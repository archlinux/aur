# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=sonicradio
pkgver=0.8.14
pkgrel=1
pkgdesc="A TUI radio player making use of Radio Browser API and Bubbletea."
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dancnb/sonicradio"
license=('MIT')
depends=('glibc')
makedepends=('go' 'make')
# Minimal 1 audio player is needed for audio playback.
optdepends=('mpv: Use mpv for audio playback.'
            'ffmpeg: Use ffplay for audio playback.'
            'vlc: Use vlc for audio playback.'
            'mplayer: Use mplayer for audio playback.'
            'mpd: Use mpd for audio playback.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dancnb/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0ff3e6ca641a968c78295d3e5f0e576bdd6b6435d2230e6889fc29db7e4a8d2dad3a9af43ed9b00d3890ac92ac8301c0473a18f1ceea6efa6b45889e2164f563')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver/cmd/$pkgname"
  # Uncomment line below if you want to change default(30) visible radio stations to 100.
  #sed -i 's|const DefLimit = 30|const DefLimit = 100|' $srcdir/$pkgname-$pkgver/browser/search.go

  go build -o $pkgname
}

package() {
  install -Dm755 "$pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
