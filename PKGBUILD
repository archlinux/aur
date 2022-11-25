# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Original Package: gbr <gbr@protonmail.com>
# from: git

_pkgbase=nvidia-settings
_branch=470
pkgname=lib32-libxnvctrl-470xx
pkgver=470.161.03
pkgrel=1
pkgdesc='NVIDIA NV-CONTROL X extension (470 legacy branch, 32-bit)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-libxext')
provides=('lib32-libxnvctrl' 'libXNVCtrl.so=0-32')
conflicts=('lib32-libxnvctrl')
makedepends=('git')
source=("git+https://github.com/NVIDIA/nvidia-settings.git#branch=470"
        'libxnvctrl_so.patch')
sha512sums=('SKIP'
            '91ff94736063b911c83b8876fe3e3778db82e0ffe0102036d81a3a6e872ca44a585914646fcbbbe399cd63aa17685fc7f73263ec4f4084f48768ca4d704037fa')


pkgver() {
  git -C nvidia-settings describe --tags | sed 's/-/+/g'
}

prepare() {
  cd nvidia-settings
  patch -p0 < "$srcdir/libxnvctrl_so.patch"
}

build() {
  export PREFIX=/usr
  export OUTPUTDIR=out
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'
  make -C nvidia-settings/src/libXNVCtrl
}

package() {
  install -d "$pkgdir/usr/lib32"
  cd nvidia-settings/src/libXNVCtrl/out
  cp -Pr libXNVCtrl.* -t "$pkgdir/usr/lib32"
}
