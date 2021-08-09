# Maintainer: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"
pkgname=genimage-git
pkgver=v14.r82.43fccb5
pkgrel=4
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=($CARCH)
url=https://github.com/pengutronix/${pkgname%-*}
license=(GPL2)

depends=(confuse)
makedepends=(git)
optdepends=(
  # android-simg2img # AUR
  # simg-tools # AUR
  'android-tools: simg2img'
  cpio
  'cramfs-tools: mkcramfs'
  dtc
  genext2fs
  'mtools: fat'
  'qemu-headless: qemu-img' # "qemu-headless" can be provided by "qemu"
  rauc
  'uboot-tools: mkimage'
)
checkdepends=($( printf "%s\n" "${optdepends[@]}" | cut -d':' -f1 ))
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})

source=(${pkgname%-*}::git+https://github.com/pengutronix/${pkgname%-*}.git)
sha1sums=(SKIP)

pkgver() {
  cd ${pkgname%-*}
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd ${pkgname%-*}
  # autoupdate # Corrupts ./configure
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-silent-rules \
    --disable-dependency-tracking
  make
}

check() {
  cd ${pkgname%-*}
  make -k check
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir/" install
  install -vdm755 "$pkgdir/usr/share/doc/${pkgname%-*}"
  cp -Lv README.rst "$_"
}
