# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=sonicradio
pkgver=0.8.11
pkgrel=1
pkgdesc="A TUI radio player making use of Radio Browser API and Bubbletea."
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dancnb/sonicradio"
license=('MIT')
depends=('glibc')
makedepends=('go')
# Minimal 1 audio player is needed for audio playback.
optdepends=('mpv: Use mpv for audio playback.'
            'ffmpeg: Use ffplay for audio playback.'
            'vlc: Use vlc for audio playback.'
            'mplayer: Use mplayer for audio playback.'
            'mpd: Use mpd for audio playback.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dancnb/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('863dbfe61923e9544fdc1bd1cf60fe37')

build() {
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export CGO_LDFLAGS="${LDFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

   cd "${pkgname}-${pkgver}"
   # Uncomment line below if you want to change default(30) visible radio stations to 100.
   #sed -i 's|const DefLimit = 30|const DefLimit = 100|' browser/search.go

   go build -o ${pkgname}
}

package() {
   cd "${pkgname}-${pkgver}"
   install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
