# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# Trackknife, rebuilt on Melody's engine: the desktop app for the library,
# playback, tagging, conversion and ReplayGain. It no longer speaks MPD --
# see trackknife.install.
pkgname=trackknife-git
pkgver=r421.gadb8d61
pkgrel=1
pkgdesc='Music player and audio workstation on the Melody engine (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
depends=(melodyd-git qt6-base
         curl ffmpeg libebur128 libopenmpt libpipewire libutf8proc openssl sqlite taglib)
makedepends=(cmake git ninja nlohmann-json)
optdepends=('chromaprint: AcoustID fingerprinting in the MusicBrainz Identify dialog'
            'melody-cli-git: the engine from the shell')
provides=(trackknife)
conflicts=(trackknife trackbench-git)
replaces=(trackbench-git)
install=trackknife.install
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
  cmake --preset release -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF -DTRACKKNIFE_BUILD_BENCHMARKS=OFF -DTRACKKNIFE_WARNINGS_AS_ERRORS=OFF
  cmake --build build/release --target trackknife trackknife_titleformat_cli
}

package() {
  cd melody-next
  DESTDIR="$pkgdir" cmake --install build/release --component app
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"
}
