# Maintainer: Jayson Reis <santosdosreis at gmail dot com>

pkgname=thinwire-nightly-bin
_pkgname=thinwire
# scripts/aur-nightly.sh in thinwire rewrites pkgver= and pkgrel= every
# day, then runs updpkgsums and makepkg --printsrcinfo. Keep both lines plain.
pkgver=0.1.0.r323.gdaf71f0
pkgrel=1
pkgdesc='Thin multi-protocol desktop messenger (nightly build of main)'
arch=('x86_64')
url='https://github.com/jaysonsantos/thinwire'
# App: MIT. WhatsApp and Signal helpers: AGPL-3.0-only. TDLib (static):
# BSL-1.0. Inter font: OFL-1.1. Bundled LLVM C++ runtime: Apache-2.0 WITH
# LLVM-exception. THIRD_PARTY_NOTICES has the other licenses.
license=('MIT' 'AGPL-3.0-only' 'BSL-1.0' 'OFL-1.1' 'Apache-2.0 WITH LLVM-exception')
# Linked: alsa-lib (libasound), glibc, libgcc (libgcc_s of the helpers).
# Loaded with dlopen by winit and glutin: wayland, libxkbcommon, libglvnd,
# and the X11 libraries.
depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'glibc'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
)
makedepends=('librsvg')
optdepends=('xdg-utils: open links in the web browser')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!debug')
source=(
  "thinwire-linux-x86_64-${pkgver}.tar.gz::https://github.com/jaysonsantos/thinwire/releases/download/nightly/thinwire-linux-x86_64-${pkgver}.tar.gz"
  'thinwire.desktop'
  'thinwire.svg'
)
noextract=("thinwire-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('47e8fa3164fe88228ad146330c768b685674f8e11c8b05c9d6876d5a0a9da0ec'
            'ab5aee42e19c83ef29d941cdf2de29a24c5b198a3b49e750ffe802274605a26d'
            '98f6e18715c5cba816fa30e26b22f18582a2ac2d4e68ab38aa9701f8a5e615e6')

_sizes=(16 24 32 48 64 128 256 512)

prepare() {
  rm -rf dist
  mkdir dist
  bsdtar -xf "thinwire-linux-x86_64-${pkgver}.tar.gz" -C dist
}

build() {
  local size
  for size in "${_sizes[@]}"; do
    rsvg-convert -w "$size" -h "$size" thinwire.svg -o "thinwire-$size.png"
  done
}

package() {
  # The app starts each helper from the folder of its own binary, and
  # current_exe() resolves the /usr/bin symlink. The RUNPATH $ORIGIN of
  # the app finds the bundled LLVM C++ runtime in the same folder. Arch has
  # no libunwind.so.1, so the package keeps the bundled copies private.
  local libdir="$pkgdir/usr/lib/$_pkgname"
  install -Dm0755 -t "$libdir/" \
    dist/thinwire \
    dist/thinwire-whatsapp-helper \
    dist/thinwire-signal-helper
  install -Dm0644 -t "$libdir/" \
    dist/libc++.so.1 \
    dist/libc++abi.so.1 \
    dist/libunwind.so.1
  install -dm0755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/thinwire" "$pkgdir/usr/bin/thinwire"

  install -Dm0644 thinwire.desktop "$pkgdir/usr/share/applications/thinwire.desktop"
  install -Dm0644 thinwire.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/thinwire.svg"
  local size
  for size in "${_sizes[@]}"; do
    install -Dm0644 "thinwire-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/thinwire.png"
  done

  local licdir="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 dist/LICENSE "$licdir/LICENSE"
  cp -r --no-preserve=mode dist/THIRD_PARTY_NOTICES "$licdir/THIRD_PARTY_NOTICES"
}
