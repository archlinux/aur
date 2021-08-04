# Maintainer: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"
pkgname=genimage-git
pkgver=v14.r82.43fccb5
pkgrel=1
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=($CARCH)
url=https://github.com/pengutronix/${pkgname%-*}
license=(GPL2)

makedepends=(git)
depends=(confuse)
optdepends=(
          'mtools: vfat'
    'cramfs-tools: mkcramfs'
        genext2fs
   'qemu-headless: qemu-img'
            'qemu: qemu-img'
              dtc
     'uboot-tools: mkimage'
             rauc
'android-simg2img: simg2img'
      'simg-tools: simg2img'
)

# makedepends=(${optdepends[@]})

# https://sphinx-rtd-theme.readthedocs.io/en/stable/
# makedepends=(python-sphinx python-sphinx_rtd_theme)
source=(
  ${pkgname%-*}::git+https://github.com/pengutronix/${pkgname%-*}.git
         index.html::https://github.com/pengutronix/${pkgname%-*}/blob/master/README.rst
)
sha1sums=(SKIP SKIP)

pkgver() {
  cd ${pkgname%-*}
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd ${pkgname%-*}

  # echo
  # pwd
  # echo
  # return 1

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
  make -k check || /bin/true
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir/" install
  install -vdm755 "$pkgdir/usr/share/doc/${pkgname%-*}"; cp -Lv "$srcdir/index.html" "$_"
}
