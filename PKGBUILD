# Maintainer: Numeri <numeri@numeri.dev>
pkgbase=hyprupld
pkgname=hyprupld-git
pkgver=r0.g0000000
pkgrel=1
url="https://hyprupld.space"
pkgdesc="A versatile screenshot and file upload utility for Linux with multi-platform support"
arch=('x86_64')
url="https://github.com/Numeri-Dev/hyprupld"
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

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/local/share/hyprupld/sounds"

  for appimage in Compiled/*.AppImage; do
    [ -f "$appimage" ] || continue
    base_name=$(basename "$appimage" .AppImage)

    # Extract the AppImage
    mkdir -p "$srcdir/appimage-extract-$base_name"
    chmod +x "$appimage"
    "$appimage" --appimage-extract > /dev/null

    # Find the main binary (assume AppRun or hyprupld)
    if [ -f "squashfs-root/AppRun" ]; then
      install -Dm755 "squashfs-root/AppRun" "$pkgdir/usr/bin/hyprupld"
    elif [ -f "squashfs-root/$base_name" ]; then
      install -Dm755 "squashfs-root/$base_name" "$pkgdir/usr/bin/hyprupld"
    elif [ -f "squashfs-root/hyprupld" ]; then
      install -Dm755 "squashfs-root/hyprupld" "$pkgdir/usr/bin/hyprupld"
    else
      echo "Could not find main binary in AppImage $appimage"
      exit 1
    fi

    # Clean up
    rm -rf squashfs-root
  done

  # Install sound files
  if [ -d "sounds" ]; then
    install -Dm644 sounds/*.mp3 "$pkgdir/usr/local/share/hyprupld/sounds/"
  fi
}
