pkgname=hakchi-git
_pkgname=hakchi
pkgver=r130.fd525ac
pkgrel=2
pkgdesc="Tool that allows you to add more games to your NES/SNES Classic Mini v1"
arch=("x86_64")
url="https://github.com/madmonkey1907/hakchi"
license=("GPL3")
depends=("libusb" "qt5-base" "upx" "cpio" "lzop" "wget")
makedepends=("git" "arm-linux-gnueabihf-gcc" "imagemagick")
provides=("hakchi")
conflicts=("hakchi")
source=("$_pkgname::git+https://github.com/madmonkey1907/hakchi.git"
        "git+https://github.com/osm0sis/mkbootimg.git"
        "git+https://github.com/linux-sunxi/sunxi-tools.git"
        "git+https://github.com/auriamg/macdylibbundler.git"
        "git+https://github.com/osm0sis/mkbootfs.git"
        "git+https://github.com/DanTheMan827/decodepng.git"
        "git+https://github.com/madmonkey1907/sun-nontendocm-kernel.git"
        "git+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
        "hakchi.desktop")
sha512sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "f9c817be40200613d587503c1001ec35b1ba40655476cac9e4de10d44ba326f088f3e87f9cb7603c4c5d4ef676cc6cb22ca51575ecb07c3355f0c362777229e4")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.3rdparty/mkbootimg.url $srcdir/mkbootimg
  git config submodule.3rdparty/sunxi-tools.url $srcdir/sunxi-tools
  git config submodule.3rdparty/macdylibbundler.url $srcdir/macdylibbundler
  git config submodule.3rdparty/mkbootfs.url $srcdir/mkbootfs
  git config submodule.3rdparty/decodepng.url $srcdir/decodepng
  git config submodule.3rdparty/sun-nontendocm-kernel.url $srcdir/sun-nontendocm-kernel
  git config submodule.3rdparty/e2fsprogs.url $srcdir/e2fsprogs
  git submodule update
}

build() {
  cd "$_pkgname"
  make CROSS_COMPILE=arm-linux-gnueabihf-
}

package() {
  cd "$_pkgname"
  install -D -m 0755 build/hakchi-gui ${pkgdir}/usr/bin/hakchi-gui
  install -d "$pkgdir"/usr/share/pixmaps
  convert mod/hakchi/rootfs/etc/hakchi.png -gravity center -crop 640x640+5+5 "$pkgdir"/usr/share/pixmaps/hakchi.png
  install -D -m 0644 $srcdir/hakchi.desktop $pkgdir/usr/share/applications/hakchi.desktop
}

