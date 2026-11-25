# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=dux-player-git
_pkgname=dux-player
pkgver=r186.ec0a6d5
pkgrel=1
pkgdesc="Music player for local libraries and Navidrome, Subsonic and Jellyfin servers, in the style of Dux Shell (latest master)"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/dux-player"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'quickshell')
makedepends=('go' 'git')
optdepends=('dux-qt-base: preferred UI runtime, Quickshell is the fallback'
            'mpv: AAC, ALAC and other formats, crossfade, equalizer, several outputs'
            'ffmpeg: loudness and silence measurement, lyrics timing'
            'wireplumber: several outputs, equalizer, system volume'
            'org.freedesktop.secrets: storing server passwords and sign-in tokens'
            'cast-helper: casting')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        "dux-qml-common::git+https://github.com/duxlabs-dev/dux-qml-common.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  # ponytail: before the first tag this falls back to r<count>.<hash>, which sorts below any tagged version
  local desc
  if desc=$(git describe --long --tags 2>/dev/null); then
    sed 's/^v//;s/-\(alpha\|beta\|rc\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$desc"
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.dux-qml-common.url "$srcdir/dux-qml-common"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build
}

package() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-mod=readonly -modcacherw"
  make install DESTDIR="$pkgdir" PREFIX=/usr LICENSE_DIR=/usr/share/licenses/$pkgname
}
