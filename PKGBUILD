# Maintainer: Rasmus Steinke <rasi@xssn.at>
pkgname=trackknife-git
pkgver=r232.g1b2e4e0
pkgrel=1
pkgdesc="MPD client and audio workstation: tagging, conversion, ReplayGain (built from HEAD)"
arch=(x86_64)
url="https://github.com/carnager/trackknife"
license=(GPL-3.0-only)
depends=(ffmpeg libebur128 libmpdclient libopenmpt libutf8proc pipewire qt6-base sqlite taglib)
makedepends=(cmake git ninja)
optdepends=('chromaprint: AcoustID fingerprinting in the MusicBrainz Identify dialog')
provides=(trackknife)
conflicts=(trackknife trackbench-git)
replaces=(trackbench-git)
source=("trackknife::git+https://github.com/carnager/trackknife.git")
sha256sums=('SKIP')

pkgver() {
  cd trackknife
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd trackknife
  # Warnings-as-errors stays off so packaging never fails on warnings a
  # future compiler invents. Tests and benchmarks are opt-in: export
  # TRACKKNIFE_CHECK=1 to build and run the functional suites.
  local testing=OFF
  [[ -n ${TRACKKNIFE_CHECK:-} ]] && testing=ON
  cmake --preset release -DTRACKKNIFE_WARNINGS_AS_ERRORS=OFF \
    -DBUILD_TESTING=$testing -DTRACKKNIFE_BUILD_BENCHMARKS=OFF
  cmake --build build/release
}

check() {
  [[ -n ${TRACKKNIFE_CHECK:-} ]] || return 0
  cd trackknife/build/release
  QT_QPA_PLATFORM=offscreen ctest --output-on-failure
}

package() {
  cd trackknife
  install -Dm755 build/release/src/bench/trackknife "$pkgdir/usr/bin/trackknife"
  install -Dm755 build/release/src/tools/trackknife-titleformat \
    "$pkgdir/usr/bin/trackknife-titleformat"
  install -Dm755 build/release/src/tools/trackknife-mpd-probe \
    "$pkgdir/usr/bin/trackknife-mpd-probe"
  install -Dm644 packaging/arch/trackknife.desktop \
    "$pkgdir/usr/share/applications/trackknife.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/doc/$pkgname/THIRD_PARTY.md"
  install -Dm644 docs/release-checklist.md \
    "$pkgdir/usr/share/doc/$pkgname/release-checklist.md"
}
