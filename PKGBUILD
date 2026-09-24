# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# Melody, rewritten: one C++ engine that owns the library and playback,
# speakers that find it on the network, and a scripting CLI. Not the Go
# daemon this package used to build -- see melody.install.
pkgbase=melody-git
pkgname=(melody-git melodyd-git melody-agent-git melody-cli-git)
pkgver=r421.gadb8d61
pkgrel=1
pkgdesc='Music engine, speakers and command line (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
makedepends=(cmake git ninja nlohmann-json
             curl ffmpeg libebur128 libopenmpt libpipewire libutf8proc openssl sqlite taglib)
source=("melody-next::git+https://github.com/carnager/melody-next.git")
sha256sums=('SKIP')

pkgver() {
  cd melody-next
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody-next
  # No window here: that is trackknife-git. Warnings-as-errors stays off
  # so packaging never fails on warnings a future compiler invents.
  cmake --preset release -DCMAKE_INSTALL_PREFIX=/usr \
    -DTRACKKNIFE_BUILD_UI=OFF -DBUILD_TESTING=OFF -DTRACKKNIFE_BUILD_BENCHMARKS=OFF \
    -DTRACKKNIFE_WARNINGS_AS_ERRORS=OFF
  cmake --build build/release --target trackknife_engine_daemon melody_agent melody_cli
}

_install() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/melody-next/build/release" --component "$1"
  install -Dm644 "$srcdir/melody-next/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_melody-git() {
  pkgdesc='Melody: the engine, the agent and the command line (metapackage)'
  depends=(melodyd-git melody-agent-git melody-cli-git)
}

package_melodyd-git() {
  pkgdesc='Melody music engine: library, playback and outputs, shared on the network'
  depends=(curl ffmpeg libopenmpt libpipewire libutf8proc openssl sqlite taglib)
  provides=(melodyd)
  conflicts=(melodyd)
  install=melody.install
  _install engine
  install -Dm644 "$srcdir/melody-next/docs/melody.md" "$pkgdir/usr/share/doc/$pkgname/melody.md"
}

package_melody-agent-git() {
  pkgdesc='Speakers for Melody engines: finds the engines on the network and plays for them'
  depends=(curl ffmpeg libopenmpt libpipewire libutf8proc openssl sqlite taglib)
  provides=(melody-agent)
  conflicts=(melody-agent)
  install=melody-agent.install
  _install agent
}

package_melody-cli-git() {
  pkgdesc='Melody engines from the shell: playback, the queue, the library by words'
  depends=(libutf8proc)
  provides=(melody-cli)
  conflicts=(melody-cli)
  _install cli
}
