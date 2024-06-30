# Maintainer: hybridkernel <admin@hzqki.me>
pkgname=smoothie-rs-linux-filepaths-git
pkgver=Nightly_2024.01.08_14.47.r46.g5ccc2a2
pkgrel=1
pkgdesc="Linux-Tested version of smoothie-rs with different filepaths for configs and temp files."
arch=('x86_64')
url="https://github.com/Hzqkii/smoothie-rs"
license=('GPL3')
depends=('vapoursynth-plugin-mvtools' 
         'vapoursynth-plugin-havsfunc' 
         'vapoursynth' 
         'ffmpeg' 
         'vapoursynth-plugin-svpflow1' 
         'ffms2' 
         'vapoursynth-plugin-svpflow2-bin' 
         'vapoursynth-plugin-mvsfunc' 
         'vapoursynth-plugin-frameblender'
         'vapoursynth-plugin-adjust'
         'vapoursynth-plugin-vsakarin-git'
         'python')
optdepends=('vapoursynth-plugin-rife-ncnn-vulkan: RIFE-NCNN Vulkan support')
makedepends=('rustup' 'gtk3' 'git')
source=("$pkgname::git+https://github.com/Hzqkii/smoothie-rs.git#branch=file-paths")
sha256sums=('SKIP')
provides=("smoothie-rs-linux")
conflicts=("smoothie-rs-linux" "smoothie-rs-linux-debug")
pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$pkgname"
  
  # Ensure rustup and the stable toolchain are installed
  rustup default stable

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/smoothie-rs" "$pkgdir/opt/smoothie-rs/bin/smoothie-rs"
  install -Dm644 "target/scripts/adjust.py" "$pkgdir/opt/smoothie-rs/scripts/adjust.py"
  install -Dm644 "target/scripts/blending.py" "$pkgdir/opt/smoothie-rs/scripts/blending.py"
  install -Dm644 "target/scripts/consts.py" "$pkgdir/opt/smoothie-rs/scripts/consts.py"
  install -Dm644 "target/scripts/filldrops.py" "$pkgdir/opt/smoothie-rs/scripts/filldrops.py"
  install -Dm644 "target/scripts/havsfunc.py" "$pkgdir/opt/smoothie-rs/scripts/havsfunc.py"
  install -Dm644 "target/scripts/weighting.py" "$pkgdir/opt/smoothie-rs/scripts/weighting.py"
  install -Dm644 "target/defaults.ini" "$pkgdir/opt/smoothie-rs/defaults.ini"
  install -Dm644 "target/jamba.vpy" "$pkgdir/opt/smoothie-rs/jamba.vpy"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/smoothie-rs" <<'EOF'
#!/bin/sh

# Path to the executable
smoothie_rs="/opt/smoothie-rs/bin/smoothie-rs"

# Check if smoothie-rs exists and is executable
if [ ! -x "$smoothie_rs" ]; then
    echo "Error: /opt/smoothie-rs/bin/smoothie-rs is not found or not executable."
    exit 1
fi

# Execute smoothie-rs with all arguments passed to this script
exec "$smoothie_rs" "$@"
EOF
}

