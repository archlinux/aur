# maintainer: saxophone <me@saxophone.is-a.dev>
pkgname=catnip-visualizer-git
pkgver=r252.d1aba19
pkgrel=1
pkgdesc="A terminal audio visualizer"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/noriah/catnip"
license=('MIT')
depends=('alsa-lib')
optdepends=('portaudio: for PortAudio support'
            'fftw: for FFTW3 support')
makedepends=('git' 'go')
provides=('catnip')
conflicts=('catnip')
source=("git+https://github.com/noriah/catnip.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/catnip"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/catnip"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
  # check if optional dependencies are installed and build variants
  if pacman -Q portaudio &>/dev/null && pacman -Q fftw &>/dev/null; then
    go build -tags portaudio,fftw ./cmd/catnip
  elif pacman -Q portaudio &>/dev/null; then
    go build -tags portaudio ./cmd/catnip
  elif pacman -Q fftw &>/dev/null; then
    go build -tags fftw ./cmd/catnip
  else    
    go build -o catnip ./cmd/catnip
  fi
}

package() {
  cd "$srcdir/catnip"
  
  # base binary
  install -Dm755 catnip "$pkgdir/usr/bin/catnip"
    
  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # documentation
  [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
