# Mantainer: Martin Wehrmeyer

pkgname=dosbox-x-debugger-additions-git
pkgver=2026.08.02
pkgrel=2
pkgdesc="This is my fork of dosbox-x-git with custom additions to the debugger. Probably uninteresting to anyone else."
arch=(i686 x86_64)
url="http://dosbox.sourceforge.net"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs libslirp)
makedepends=(git glu libpcap libslirp)
optdepends=('openglide-git: Third-party 3dfx Glide API support'
 'libpcap: Allows DosBox-X to connect to a network and to the internet'
 'libslirp: Allows DosBox-X to connect to the internet rootless solution')
optdepends=()
install='dosbox-x.install'
source=(dosbox-x::git+https://github.com/mwehrmeyer/dosbox-x.git)
options=('!buildflags')

provides=('dosbox-x-git')
conflicts=('dosbox-x-git' 'dosbox-x')

pkgver() {
  cd "$SRCDEST/dosbox-x"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/dosbox-x"
  sed -i -e 's/-j3/-j$(nproc)/g' build-debug
  sed -i 's|"$LIBS -lavcodec -lavformat -lavutil -lswscale "`pkg-config libavcodec --libs`|`pkg-config libavcodec libavformat libavutil libswscale libswresample --libs`"$LIBS"|' configure.ac
  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./build-debug
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')

