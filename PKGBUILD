# Maintainer: s1mpleog
#
# Build Details:
# Chromium 149.0.7785.0 (Official Build) unstable (Linux 64-bit)
# Features: No Sync | WebRTC Enabled | Widevine Enabled
# Revision: 190a3548629c822fa8226a8a9bccb11ddbf7383d-refs/heads/main@{#1584191}
# Compiler: clang (+lld_linker +thinlto +pgo +avx2 +fma +compiler_optimizations +linker_optimizations)

pkgname=chromium-clang-avx2-bin
_upstream_name=chromium-browser-unstable
pkgver=149.0.7785.0
_commit=r1613160
pkgrel=1
pkgdesc="Chromium unstable compiled w/ Clang, PGO, ThinLTO, AVX2 (No Sync, WebRTC, Widevine)"
arch=('x86_64')
url="https://github.com/RobRich999/Chromium_Clang"
license=('BSD')

depends=('alsa-lib' 'at-spi2-core' 'cairo' 'expat' 'glib2' 'gtk3' 'libdrm'
  'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')

provides=("chromium" "$_upstream_name")
conflicts=("chromium" "$_upstream_name")

source=("https://github.com/RobRich999/Chromium_Clang/releases/download/v${pkgver}-${_commit}-linux64-rpm-avx2/${_upstream_name}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('022c31a63d67144039f0b25503eb9f0cba32500112bf0b787a291d1c4ee4309d')

package() {
  cd "$srcdir"

  # The RPM automatically extracts into standard Linux directories (like /opt and /usr)
  # This loop checks for standard root directories and copies them directly into the packaging directory
  for dir in opt usr etc; do
    if [ -d "$dir" ]; then
      install -d "$pkgdir/$dir"
      cp -a "$dir/"* "$pkgdir/$dir/"
    fi
  done

  _desktop_file="$pkgdir/usr/share/applications/${_upstream_name}.desktop"

  if [[ -f "$_desktop_file" ]]; then
    sed -i 's/^Name=.*/Name=Chromium Clang AVX2/' "$_desktop_file"
    sed -i 's/^Icon=.*/Icon=chromium/' "$_desktop_file"
    mv "$_desktop_file" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  fi

  chmod -R u=rwX,go=rX "$pkgdir/"
}
