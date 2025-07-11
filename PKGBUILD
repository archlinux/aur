# Maintainer: AromaXR <aromaxr@arch-linux.pro>
pkgbase=hyprupld
pkgname=hyprupld-git
pkgver=r0.g0000000
pkgrel=1
url="https://hyprupld.space"
pkgdesc="A versatile screenshot and file upload utility for Linux and MacOS with multi-platform support"
arch=('x86_64')
url="https://github.com/PhoenixAceVFX/hyprupld"
license=('GPL2')
depends=('bash' 'fuse2' 'glib2' 'cairo' 'pango')
makedepends=('git' 'wget' 'imagemagick' 'cmake')
provides=('hyprupld')
conflicts=('hyprupld')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hyprupld"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hyprupld"
  chmod +x compile.sh
  # Unset SOURCE_DATE_EPOCH to prevent conflict with mksquashfs
  unset SOURCE_DATE_EPOCH
  ./compile.sh
}

package() {
  cd "$srcdir/hyprupld"
  
  # Create the necessary directories in the package
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/local/share/hyprupld/sounds"
  
  # Install the compiled AppImages to the package directory
  for binary in Compiled/*; do
    if [ -f "$binary" ]; then
      local base_name=$(basename "$binary")
      # Skip hidden files
      [[ "$base_name" == .* ]] && continue
      
      # Normalize binary name
      dest_name="${base_name/-x86_64/}"
      dest_name="${dest_name/.AppImage/}"
      
      # Install binary with appropriate permissions
      install -Dm755 "$binary" "$pkgdir/usr/bin/$dest_name"
    fi
  done
  
  # Install sound files
  if [ -d "sounds" ]; then
    install -Dm644 sounds/*.mp3 "$pkgdir/usr/local/share/hyprupld/sounds/"
  fi
}
