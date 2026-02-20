# Maintainer: Tasin Farhan <tasinfarhan1016@gmail.com>

pkgname=prismlauncher-offline-bin
pkgver=10.0.2
pkgrel=3
pkgdesc="Prism Launcher fork with offline account support enabled"
arch=('x86_64' 'aarch64')
url="https://github.com/Diegiwg/PrismLauncher-Cracked"
license=('GPL3')
options=('!strip')

depends=(
  'cmark'
  'qrencode'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'java-runtime'
  'libgl'
  'qt6-5compat'
  'qt6-base'
  'qt6-imageformats'
  'qt6-networkauth'
  'qt6-svg'
  'quazip-qt6'
  'tomlplusplus'
  'zlib'
)

makedepends=('patchelf')

optdepends=(
  "flite: Minecraft voice narration"
  "glfw: use system GLFW libraries"
  "openal: use system OpenAL libraries"
  "orca: Minecraft screen reader"
  "visualvm: Profiling support"
  "xorg-xrandr: for older Minecraft versions"
)

provides=('prismlauncher-offline')
conflicts=('prismlauncher' 'prismlauncher-offline')

source_x86_64=(
  "prism-portable.tar.gz::https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/${pkgver}/PrismLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz"
)

source_aarch64=(
  "prism-portable.tar.gz::https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/${pkgver}/PrismLauncher-Linux-aarch64-Qt6-Portable-${pkgver}.tar.gz"
)

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

prepare() { :; }
build() { :; }

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share"

  tmpdir=$(mktemp -d)
  tar -xaf "$srcdir/prism-portable.tar.gz" -C "$tmpdir"

  cp -r "$tmpdir/shared/bin/prismlauncher" "$pkgdir/usr/bin/"

  if readelf -d "$pkgdir/usr/bin/prismlauncher" | grep -q "libcmark.so.0.30.2"; then
    patchelf --replace-needed libcmark.so.0.30.2 libcmark.so.0.31.2 "$pkgdir/usr/bin/prismlauncher"
  fi

  cp -r \
    "$tmpdir/share/applications" \
    "$tmpdir/share/icons" \
    "$tmpdir/share/man" \
    "$tmpdir/share/metainfo" \
    "$tmpdir/share/mime" \
    "$tmpdir/share/PrismLauncher" \
    "$tmpdir/share/qlogging-categories6" \
    "$pkgdir/usr/share/"

  rm -rf "$tmpdir"
}
