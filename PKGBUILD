# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=msty-claw-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Msty Claw is an autonomous AI agent application designed for complex task orchestration (Beta)"
arch=('x86_64')
url="https://msty.ai/claw"
license=('proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libdbus' 'libglvnd' 'hicolor-icon-theme')
optdepends=('cuda: NVIDIA GPU acceleration'
            'rocm-core: AMD GPU acceleration'
            'docker: Intel GPU acceleration (via ipex-llm container workaround)'
            'libpulse: PulseAudio/Pipewire support')
provides=('msty-claw')
conflicts=('msty-claw')
filename="MstyClaw_amd64_${pkgver}.deb"
source=("$filename::https://next-assets.msty.studio/mstyclaw/latest/linux/MstyClaw_amd64.deb?ver=$pkgver")
sha256sums=('d05967d6ce920b865b1b58cb6612e68b1f0426e4b00e3f07c29b89c50d83156d')

prepare() {
  mkdir -p "$srcdir/pkg-contents"
  bsdtar -xOf "$srcdir/$filename" data.tar.gz | bsdtar -C "$srcdir/pkg-contents" -xv
}

check() {
  find "$srcdir/pkg-contents" -type f -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print | while read -r elf; do
    if ldd "$elf" | grep -q "not found"; then
      echo "Broken dependencies in $elf:"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done
}

package() {
  # Copy extracted files to pkgdir
  cp -a "$srcdir/pkg-contents/." "$pkgdir/"

  # Create symlink for terminal access
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/bin/MstyClaw "$pkgdir/usr/bin/msty-claw"
}
