# $Id: PKGBUILD 258759 2017-09-18 16:50:57Z anatolik $
# Maintainer: Anatol Pomozov
# Contributor: 謝致邦 <Yeking@Red54.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=android-tools-git
pkgver=r37780.8edf81d50f
pkgrel=1
pkgdesc='Android platform tools'
arch=(i686 x86_64)
url='http://tools.android.com/'
license=(Apache MIT)
depends=(pcre2 libusb)
optdepends=('python: for mkbootimg script')
makedepends=(git clang gtest ruby cmake ninja go)
conflicts=(android-tools)
replaces=(android-tools)
provides=(android-tools)
_boringssl_commit=ea52ec98a56a40879b37493f3d1da1a1679e1fba # keep it in sync with android https://android.googlesource.com/platform/external/boringssl/+/master/BORINGSSL_REVISION
source=(git+https://android.googlesource.com/platform/system/core
        git+https://android.googlesource.com/platform/system/extras
        git+https://android.googlesource.com/platform/external/selinux
        git+https://android.googlesource.com/platform/external/f2fs-tools
        git+https://boringssl.googlesource.com/boringssl#commit=$_boringssl_commit
        generate_build.rb
        fix_build_core.patch
        fix_build_selinux.patch
        bash_completion.fastboot)
        # Bash completion file was taken from https://github.com/mbrubeck/android-completion
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          '5a048d8ae090327d68467b8f6e994eebe9686530'
          '5bc7472561d3c28049def8212c5e40e560b1583b'
          'ec473160d7445f97bccabd1c32ac0ae2f77900c1'
          '7004dbd0c193668827174880de6f8434de8ceaee')


pkgver() {
  cd $srcdir/core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  PKGVER=$pkgver ./generate_build.rb > build.ninja

  cd $srcdir/core
  patch -p1 < ../fix_build_core.patch

  cd $srcdir/selinux
  patch -p1 < ../fix_build_selinux.patch

  mkdir -p $srcdir/boringssl/build && cd $srcdir/boringssl/build && cmake -GNinja ..; ninja
}

build() {
  ninja
}

package(){
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 -t "$pkgdir"/usr/bin fastboot adb core/mkbootimg/mkbootimg
  install -Dm 644 bash_completion.fastboot "$pkgdir"/usr/share/bash-completion/completions/fastboot
}
