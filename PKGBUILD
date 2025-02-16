# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_plug=vsakarin
pkgname=vapoursynth-plugin-$_plug-av1an-git
pkgver=0.96f.3.4b9a37a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} but Av1an-compatible (GIT version)"
arch=(x86_64)
url=https://github.com/Simulp/vsakarin-av1an
license=(GPL)
depends=(
  vapoursynth
  gcc-libs # libgcc_s.so libstdc++.so
  glibc # ld-linux-x86-64.so libc.so libm.so
  llvm15-libs # libLLVM-15.so
  )
makedepends=(
  git
  meson
  llvm15
)
provides=(
  vapoursynth-plugin-$_plug
  vapoursynth-plugin-$_plug-git)
conflicts=(vapoursynth-plugin-$_plug)
source=($_plug::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_plug
  git describe --tags --long | tr - . | tr -d vg
}

prepare() {
  cat > native_config <<EOF
[binaries]
llvm-config='/usr/lib/llvm15/bin/llvm-config'
EOF
}

build() {
  arch-meson --reconfigure $_plug build \
    --buildtype=release \
    --native-file=native_config \
    -Dstatic-llvm=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $_plug/README.md \
    -t "$pkgdir/usr/share/doc/vapoursynth/plugins/$_plug"
}
