# $Id: PKGBUILD 258759 2017-09-18 16:50:57Z anatolik $
# Maintainer: Anatol Pomozov
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=android-tools-git
pkgver=r44324.ea57928f00
pkgrel=1
pkgdesc='Android platform tools'
arch=(i686 x86_64)
url='http://tools.android.com/'
license=(Apache MIT)
depends=(pcre2 libusb libc++)
optdepends=('python: for mkbootimg script')
makedepends=(git clang ruby cmake ninja)
conflicts=(android-tools)
replaces=(android-tools)
provides=(android-tools)
# keep it in sync with android https://android.googlesource.com/platform/external/boringssl/+/master/BORINGSSL_REVISION
_boringssl_commit=41c10e2b5f37edce8b9f292f7f3bacb7e30e25c4
source=(git+https://android.googlesource.com/platform/system/core
        git+https://android.googlesource.com/platform/system/extras
        git+https://android.googlesource.com/platform/frameworks/base
        git+https://android.googlesource.com/platform/frameworks/native
        git+https://android.googlesource.com/platform/external/selinux
        git+https://android.googlesource.com/platform/external/f2fs-tools
        git+https://android.googlesource.com/platform/external/e2fsprogs
        git+https://android.googlesource.com/platform/external/avb
        git+https://android.googlesource.com/platform/external/mdnsresponder
        git+https://boringssl.googlesource.com/boringssl#commit=$_boringssl_commit
        generate_build.rb
        fix_build_core.patch
        fix_build_selinux.patch
	fix_build_e2fsprogs.patch
        bash_completion.fastboot)
        # Bash completion file was taken from https://github.com/mbrubeck/android-completion
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'eb845ae03159cd3853e1ebc9a0d40caab6d8111f'
          'abfe045280ec6342e2d3f9d9030138d0c53e4d26'
          'ec473160d7445f97bccabd1c32ac0ae2f77900c1'
          '41608052bff69632d1cc5a6e2efb92cf4ad857e6'
          '7004dbd0c193668827174880de6f8434de8ceaee')


pkgver() {
  cd $srcdir/core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/core
  patch -p1 < ../fix_build_core.patch

  cd $srcdir/selinux
  patch -p1 < ../fix_build_selinux.patch

  cd $srcdir/e2fsprogs
  patch -p1 < ../fix_build_e2fsprogs.patch

  cd $srcdir/avb
  sed -i 's|/usr/bin/env python$|/usr/bin/env python2|g' avbtool

  mkdir -p $srcdir/boringssl/build
}

build() {
  PKGVER=$pkgver CFLAGS="$CFLAGS -flto" CXXFLAGS="$CXXFLAGS -stdlib=libc++ -flto" LDFLAGS="$LDFLAGS -stdlib=libc++ -flto" ./generate_build.rb > build.ninja

  # TODO: make BoringSSL build a subninja of the main build file
  cd $srcdir/boringssl/build && cmake -GNinja ..; ninja

  cd $srcdir && ninja
}

package(){
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 -t "$pkgdir"/usr/bin fastboot adb mke2fs.android e2fsdroid ext2simg avb/avbtool
  install -m755 core/mkbootimg/mkbootimg.py "$pkgdir"/usr/bin/mkbootimg 
  install -Dm644 bash_completion.fastboot "$pkgdir"/usr/share/bash-completion/completions/fastboot
}
