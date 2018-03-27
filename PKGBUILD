# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=moarvm-git
pkgver=20180326
pkgrel=1
pkgdesc="6model-based VM for NQP and Rakudo Perl6"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('dyncall' 'libatomic_ops' 'libffi' 'libtommath' 'libuv' 'llvm')
makedepends=('binutils' 'clang' 'git' 'make' 'perl' 'pkg-config')
groups=('perl6')
url="https://github.com/MoarVM/MoarVM"
license=('PerlArtistic')
options=('!purge')
source=(${pkgname%-git}::git+https://github.com/MoarVM/MoarVM
        git+https://github.com/MoarVM/dynasm)
sha256sums=('SKIP' 'SKIP')
provides=('moarvm')
conflicts=('moarvm')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
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
    --has-libffi \
    --has-libtommath \
    --has-libuv \
    --optimize
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -dpr --no-preserve=ownership docs \
    "$pkgdir/usr/share/doc/${pkgname%-git}/design"

  msg2 'Installing license...'
  install -Dm 644 Artistic2.txt CREDITS LICENSE \
          -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
