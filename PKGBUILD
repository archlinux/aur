# Maintainer: chwair <74615216+chwair@users.noreply.github.com>
pkgname=magnolia
pkgver=2.2.3
pkgrel=1
pkgdesc="Torrent streaming client for PCs"
arch=('x86_64')
url="https://github.com/chwair/magnolia"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libwebp'
  'brotli'
  'bzip2'
  'zstd'
  'xz'
  'lz4'
  'libxrandr'
  'libva'
  # audio/video backends the bundled ffmpeg + mpv link unconditionally (DT_NEEDED)
  'alsa-lib'
  'libpulse'
  'libpipewire'
  'jack'
  'libvdpau'
  'ocl-icd'
  'libbsd'
  'libxss'
)
makedepends=('patchelf')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Magnolia_${pkgver}_amd64.deb"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE-MIT"
)
sha256sums=('6091df8352dd01514cac3227402b5052be5a356304d3e4a31515a164f07054a6'
            'SKIP')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"

  # The .deb dumps all ~124 bundled libraries flat into /usr/lib, where they
  # collide with system packages (aom, libass, sdl2-compat, dav1d, ...).
  # Relocate them into a private dir so nothing conflicts. Each bundled lib
  # already carries RUNPATH=$ORIGIN, so co-locating them keeps intra-bundle
  # resolution intact; only the main binary's rpath (which points at ../lib)
  # needs repointing at the private dir.
  install -d "$pkgdir/usr/lib/$pkgname"
  find "$pkgdir/usr/lib" -maxdepth 1 -type f -name '*.so*' \
    -exec mv -t "$pkgdir/usr/lib/$pkgname" {} +
  patchelf --set-rpath "\$ORIGIN/../lib/$pkgname" \
    "$pkgdir/usr/bin/$pkgname-tauri-app"

  # Convenience: expose the app under its product name too.
  ln -s "$pkgname-tauri-app" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod -R go-w "$pkgdir"
}
