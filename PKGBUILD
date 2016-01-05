# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=moarvm-git
pkgver=20160104
pkgrel=1
pkgdesc="6model-based VM for NQP and Rakudo Perl 6"
arch=('i686' 'x86_64')
depends=('dyncall' 'libatomic_ops' 'libuv' 'llvm')
makedepends=('clang' 'git' 'make' 'pkg-config')
groups=('perl6')
url="https://github.com/MoarVM/MoarVM"
license=('PerlArtistic')
source=(${pkgname%-git}::git+https://github.com/MoarVM/MoarVM
        dynasm::git+https://github.com/MoarVM/dynasm)
sha256sums=('SKIP' 'SKIP')
provides=('moarvm')
conflicts=('moarvm')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Copying Git submodules...'
  for _submodule in dynasm; do
    rm -rf 3rdparty/$_submodule
    cp -dpr --no-preserve=owner "$srcdir/$_submodule" 3rdparty
  done
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  perl Configure.pl \
    --prefix=/usr \
    --toolchain=gnu \
    --compiler=clang \
    --has-dyncall \
    --has-libatomic_ops \
    --has-libuv \
    --optimize
    # Note that the bundled libtommath has patches that have been sent
    # upstream, but aren't in any released version; 0.42 will compile
    # but causes slight bugs. (credit: flussence)
    #--has-libtommath
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/include/libuv"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
