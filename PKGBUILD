# Submitter: s1mpleog
# Maintainer: notyusufkhalifa
#
# Build Details:
# Chromium 153.0.7993.0 (Official Build) unstable (Linux 64-bit)
# Features: No Sync | WebRTC Enabled | Widevine Enabled
# Revision: df39df7749996e7599eeda0a56c2dae56dc6c3ab-refs/heads/main@{#1673900} 
# Compiler: clang (+lld_linker +thinlto +pgo +avx2 +fma +polly +compiler_optimizations +linker_optimizations)

pkgname=chromium-clang-avx2-bin
_upstream_name=chromium-browser-unstable
pkgver=153.0.7993.0
_revision=r1673900
_commit=
pkgrel=1
pkgdesc="Chromium unstable compiled w/ Clang, PGO, ThinLTO, AVX2 (No Sync, WebRTC, Widevine)"
arch=('x86_64')
url="https://github.com/RobRich999/Chromium_Clang"
license=('BSD')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'expat' 'glib2' 'gtk3' 'libdrm'
  'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
makedepends=('rpm-tools')
provides=("chromium" "$_upstream_name")
conflicts=("chromium" "$_upstream_name")
source=("https://github.com/RobRich999/Chromium_Clang/releases/download/v${pkgver}-${_revision}${_commit}-linux64-rpm-avx2/${_upstream_name}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('e65171601fa1734b5c016333caef0be2c8e646064ca8a5381c59f4195dc3908e')

prepare() {
  cd "$srcdir"
  rpm2cpio "${_upstream_name}-${pkgver}-1.${CARCH}.rpm" | cpio -idmv
}

package() {
  cd "$srcdir"
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
