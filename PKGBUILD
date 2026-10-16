# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# melody-cli on its own: it needs the protocol and discovery, not the media
# libraries, so it builds in seconds without the engine.
pkgname=melody-cli-git
pkgver=r1020.gacd0ac0e
pkgrel=1
pkgdesc='Melody engines from the shell: playback, the queue, the library by words'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
depends=(gcc-libs glibc libutf8proc)
makedepends=(cmake git ninja nlohmann-json)
optdepends=('python: melody-musiclist, the album page'
            'openssh: melody-musiclist uploading it')
# melody-musiclist comes with it now, built on melody-cli rather than MPD.
provides=(melody-cli melody-musiclist)
conflicts=(melody-cli melody-musiclist melody-musiclist-git)
source=("melody-next::git+https://github.com/carnager/melody-next.git")
sha256sums=('SKIP')

pkgver() {
  cd melody-next
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody-next
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DMELODY_CLI_ONLY=ON -DMELODY_BUILD_UI=OFF -DBUILD_TESTING=OFF \
    -DMELODY_BUILD_BENCHMARKS=OFF -DMELODY_WARNINGS_AS_ERRORS=OFF
  cmake --build build --target melody_cli
}

package() {
  cd melody-next
  DESTDIR="$pkgdir" cmake --install build --component cli
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
