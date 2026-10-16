# Maintainer: Rasmus Steinke <rasi@xssn.at>
#
# Melody's engine, which owns the library and playback, and the speakers that
# find it on the network. The desktop app is melody-git (ADR-0287), the
# command line melody-cli-git, each a package of its own so a server builds
# without the window.
pkgbase=melodyd-git
pkgname=(melodyd-git melody-agent-git)
pkgver=r1020.gacd0ac0e
pkgrel=1
pkgdesc='Melody music engine and speakers (built from HEAD)'
arch=(x86_64 aarch64)
url='https://github.com/carnager/melody-next'
license=(GPL-3.0-only)
makedepends=(cmake git ninja nlohmann-json
             curl ffmpeg libebur128 libopenmpt libpipewire libupnp libutf8proc openssl sqlite
             taglib)
source=("melody-next::git+https://github.com/carnager/melody-next.git")
sha256sums=('SKIP')

pkgver() {
  cd melody-next
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd melody-next
  # No window here: that is melody-git. Warnings-as-errors stays off
  # so packaging never fails on warnings a future compiler invents. UPnP
  # speakers as outputs (ADR-0235) asked for, not found by chance: without
  # libupnp the build fails rather than leaving them out.
  cmake --preset release -DCMAKE_INSTALL_PREFIX=/usr \
    -DMELODY_BUILD_UI=OFF -DBUILD_TESTING=OFF -DMELODY_BUILD_BENCHMARKS=OFF \
    -DMELODY_WARNINGS_AS_ERRORS=OFF -DMELODY_ENABLE_UPNP=ON
  cmake --build build/release --target trackknife_engine_daemon melody_agent
}

_install() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/melody-next/build/release" --component "$1"
  install -Dm644 "$srcdir/melody-next/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_melodyd-git() {
  pkgdesc='Melody music engine: library, playback and outputs, shared on the network'
  depends=(curl ffmpeg libopenmpt libpipewire libupnp libutf8proc openssl sqlite taglib)
  provides=(melodyd)
  conflicts=(melodyd)
  install=melody.install
  _install engine
  install -Dm644 "$srcdir/melody-next/docs/melody.md" "$pkgdir/usr/share/doc/$pkgname/melody.md"
}

package_melody-agent-git() {
  pkgdesc='Speakers for Melody engines: finds the engines on the network and plays for them'
  depends=(curl ffmpeg libopenmpt libpipewire libupnp libutf8proc openssl sqlite taglib)
  provides=(melody-agent)
  conflicts=(melody-agent)
  install=melody-agent.install
  _install agent
}
