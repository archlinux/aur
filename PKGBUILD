# Maintainer: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"
pkgname=genimage
pkgver=14
pkgrel=2
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=($CARCH)
url=https://github.com/pengutronix/$pkgname
license=(GPL2)

depends=(confuse)

# For "make check"
optdepends=(

  # function dep {
  #   sudo pacman -Syu --needed "$1" \
  #     || yay --gpg "$(realpath ~/beaglebone/gpg_proxy.sh)" -Syu --needed "$1"
  #   sudo pacman -D --asdeps "$1"
  # }

  # SKIP cramfs (missing mkcramfs)
      'cramfs-tools: mkcramfs'

  # SKIP ext2 (missing genext2fs of genext2fs,e2fsck)
  # SKIP ext2percent (missing genext2fs of genext2fs,e2fsck)
  # SKIP ext3 (missing genext2fs of genext2fs,e2fsck)
  # SKIP ext4 (missing genext2fs of genext2fs,e2fsck)
          genext2fs

  # SKIP qemu (missing qemu-img of dd,diff,qemu-img)
     'qemu-headless: qemu-img' # qemu provides qemu-headless
              'qemu: qemu-img' # qemu provides qemu-headless

  # SKIP fit (missing dtc,mkimage of mkimage,dtc)
                dtc
       'uboot-tools: mkimage'

  # SKIP rauc (missing rauc)
               rauc

  # SKIP android-sparse (missing simg2img)
  'android-simg2img: simg2img'
        'simg-tools: simg2img'

)

# makedepends=(${optdepends[@]})

# https://sphinx-rtd-theme.readthedocs.io/en/stable/
# makedepends=(python-sphinx python-sphinx_rtd_theme)
source=($pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz
        index.html::https://github.com/pengutronix/genimage/blob/v14/README.rst)
sha1sums=(043fed792abe0280b830c61765fd44870f1fdf61 SKIP)

build() {

  cd $pkgname-$pkgver
  # cp configure.ac{,\~}
  # autoupdate # Corrupts ./configure
  # diff -u configure.ac{\~,}
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules --disable-dependency-tracking
  make

  # https://www.sphinx-doc.org/en/master/man/sphinx-quickstart.html
  # sphinx-quickstart --sep -p genimage -a "Michael Olbrich" -v 14 -r 14 -l en -d master_doc=README --ext-autodoc --ext-viewcode --ext-githubpages --no-batchfile .
  # https://www.sphinx-doc.org/en/master/man/sphinx-build.html
  # sphinx-build -b dirhtml -d .doctrees -n -v . ./build

}

# https://github.com/pengutronix/genimage/issues/157
# https://github.com/pengutronix/genimage/pull/155
check() {
  cd $pkgname-$pkgver
  make -k check || /bin/true
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -vdm755 "$pkgdir/usr/share/doc/$pkgname"; cp -Lv "$srcdir/index.html" "$_"
}
