# Maintainer: Alexander Schäferdiek <alexander@schaeferdiek.eu>
# Maintainer: Florian Klink <flokli@flokli.de>

pkgname=spotifyd
pkgver=0.1
pkgrel=1
arch=('x86_64' 'armv7h')
depends=('pulseaudio' 'flac' 'libogg' 'libpulse' 'libsndfile' 'libvorbis')
makedepends=('git' 'cargo')
conflicts=('spotifyd-bin')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source=("spotifyd::git+https://github.com/Spotifyd/spotifyd" "spotifyd.service")
sha256sums=('SKIP'
            '67bce68cfad74bfccad4b471045d3c5d5fb0f693545f3ef12511d171ea41a5e4')
pkgver() {
  cd $srcdir/spotifyd;
  echo $(git describe --tags --match 'v*' | sed 's/^v//')
}

build() {
  cd $srcdir/spotifyd;
  cargo build --release --features "pulseaudio_backend"
}

package() {
  install -D -m 755 $srcdir/spotifyd/target/release/spotifyd "${pkgdir}/usr/bin/spotifyd"
  install -D -m 644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
