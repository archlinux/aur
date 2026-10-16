# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# Melody, the desktop app on Melody's engine: the library, playback, tagging,
# conversion and ReplayGain. Trackknife until ADR-0287 renamed it; its
# settings and data move once -- see melody.install.
pkgname=melody-git
pkgver=r1020.gacd0ac0e
pkgrel=1
pkgdesc='Melody: your music library -- play, tag, convert and share it (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
depends=(melodyd-git qt6-base qt6-svg
         curl ffmpeg libebur128 libopenmpt libpipewire libupnp libutf8proc openssl sqlite taglib)
makedepends=(cmake git ninja nlohmann-json)
optdepends=('chromaprint: AcoustID fingerprinting in the MusicBrainz Identify dialog'
            'melody-cli-git: the engine from the shell')
provides=(melody trackknife)
conflicts=(trackknife trackknife-git trackbench-git)
replaces=(trackknife-git trackbench-git)
install=melody.install
source=("melody-next::git+https://github.com/carnager/melody-next.git")
sha256sums=('SKIP')

pkgver() {
  cd melody-next
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody-next
  # Only the window: the engine comes from melodyd-git. Warnings-as-errors
  # stays off so packaging never fails on warnings a future compiler invents.
  # UPnP on, as in melodyd-git: the window's setting for it is greyed out in
  # a build without.
  cmake --preset release -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF -DMELODY_BUILD_BENCHMARKS=OFF -DMELODY_WARNINGS_AS_ERRORS=OFF \
    -DMELODY_ENABLE_UPNP=ON
  cmake --build build/release --target trackknife trackknife_titleformat_cli
}

package() {
  cd melody-next
  DESTDIR="$pkgdir" cmake --install build/release --component app
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"
}
