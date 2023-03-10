# Maintainer: Anatol Pomozov
# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=coreboot-utils-git
pkgver=4.19.r781.g6b6b8f86df3
pkgrel=1
pkgdesc='Tools and utilities to work with coreboot firmware'
url='https://www.coreboot.org/'
license=(GPL)
arch=(x86_64)
depends=(pciutils)
optdepends=("python: me_cleaner support")
makedepends=(git)
source=(git+https://review.coreboot.org/coreboot.git
        git+https://review.coreboot.org/blobs.git
        git+https://review.coreboot.org/nvidia-cbootimage.git
        git+https://review.coreboot.org/vboot.git#branch=main
        git+https://review.coreboot.org/arm-trusted-firmware.git
        git+https://review.coreboot.org/chrome-ec.git
        git+https://review.coreboot.org/libhwbase.git
        git+https://review.coreboot.org/libgfxinit.git
        git+https://review.coreboot.org/fsp.git
        git+https://review.coreboot.org/opensbi.git
        git+https://review.coreboot.org/intel-microcode.git#branch=main
        git+https://review.coreboot.org/ffs.git
        git+https://review.coreboot.org/amd_blobs
        git+https://review.coreboot.org/cmocka.git#branch=stable-1.1
        git+https://review.coreboot.org/qc_blobs.git
        git+https://review.coreboot.org/9esec-security-tooling.git
        git+https://review.coreboot.org/STM#branch=stmpe
        git+https://review.coreboot.org/goswid#branch=trunk

        # vboot provides vb2_api.h needed by cbfstool
        autoport-tool-paths.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5136f8ae6c690501b483243a33b91dc978971cf23bcf48c27bdca845db53bdb1')

BUILD_AUTOPORT=y

if [ "$BUILD_AUTOPORT" == y ]; then
  makedepends=("${makedepends[@]}" go)
fi

pkgver() {
  cd coreboot
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd coreboot

  git config -f .gitmodules 'submodule.3rdparty/blobs.url' "$srcdir/blobs"
  git config -f .gitmodules 'submodule.util/nvidia-cbootimage.url' "$srcdir/nvidia-cbootimage"
  git config -f .gitmodules 'submodule.vboot.url' "$srcdir/vboot"
  git config -f .gitmodules 'submodule.arm-trusted-firmware.url' "$srcdir/arm-trusted-firmware"
  git config -f .gitmodules 'submodule.3rdparty/chromeec.url' "$srcdir/chrome-ec"
  git config -f .gitmodules 'submodule.libhwbase.url' "$srcdir/libhwbase"
  git config -f .gitmodules 'submodule.libgfxinit.url' "$srcdir/libgfxinit"
  git config -f .gitmodules 'submodule.3rdparty/fsp.url' "$srcdir/fsp"
  git config -f .gitmodules 'submodule.opensbi.url' "$srcdir/opensbi"
  git config -f .gitmodules 'submodule.intel-microcode.url' "$srcdir/intel-microcode"
  git config -f .gitmodules 'submodule.3rdparty/ffs.url' "$srcdir/ffs"
  git config -f .gitmodules 'submodule.3rdparty/amd_blobs.url' "$srcdir/amd_blobs"
  git config -f .gitmodules 'submodule.3rdparty/cmocka.url' "$srcdir/cmocka"
  git config -f .gitmodules 'submodule.3rdparty/qc_blobs.url' "$srcdir/qc_blobs"
  git config -f .gitmodules 'submodule.3rdparty/intel-sec-tools.url' "$srcdir/9esec-security-tooling"
  git config -f .gitmodules 'submodule.3rdparty/stm.url' "$srcdir/STM"
  git config -f .gitmodules 'submodule.util/goswid.url' "$srcdir/goswid"

  git -c protocol.file.allow=always submodule update --init

  patch -p1 -i "$srcdir/autoport-tool-paths.patch"
}

build() {
  cd coreboot/util

  make -C cbfstool
  make -C ifdtool
  make -C nvramtool
  make -C inteltool
  make -C intelmetool
  make -C superiotool
  make -C cbmem
  make -C ectool
  make -C intelvbttool
  make -C intelp2m
  if [ "$BUILD_AUTOPORT" == y ]; then
    cd autoport
    go build
  fi
}

package() {
  cd coreboot/util
  install -m755 -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
  install -m755 -t "$pkgdir/usr/bin" cbfstool/{cbfstool,rmodtool} ifdtool/ifdtool nvramtool/nvramtool inteltool/inteltool superiotool/superiotool cbmem/cbmem ectool/ectool intelmetool/intelmetool intelvbttool/intelvbttool intelp2m/intelp2m
  install -m755 "me_cleaner/me_cleaner.py" "$pkgdir/usr/bin/me_cleaner"
  if [ "$BUILD_AUTOPORT" == y ]; then
    install -m755 -t "$pkgdir/usr/bin" autoport/autoport
  fi
  install -m644 -t "$pkgdir"/usr/share/man/man8 inteltool/inteltool.8

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
