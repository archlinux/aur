# Maintainer: Nuew <archlinux at nuew dot net>
pkgname=lrs-git
pkgver=r334.8262295
pkgrel=4
pkgdesc="An experimental standard library for rust"
arch=('x86_64')
url="https://github.com/lrs-lang"
license=('Apache' 'MIT' 'MPL')
makedepends=('git' 'clang')
options=(!strip)
install='install.sh'
source=(
  'lib::git+https://github.com/lrs-lang/lib.git'
  'driver::git+https://github.com/lrs-lang/driver.git#commit=6d10777'
  http://static.rust-lang.org/dist/2015-12-20/rust-nightly-x86_64-unknown-linux-gnu.tar.gz
)
sha512sums=('SKIP'
            'SKIP'
            '2f23f303045f539d998f15cd21c88833dfb5aa2739a6f95e9cfc300ffb363e1adab265f88c5d9ea30cbccc8f9a44e2578b7df464a0df07f856c6b8b2bf11adbd')

pkgver() {
	cd "$srcdir/lib"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  ln -fs "${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/rust-std-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu"\
    "${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/rustc/lib/rustlib/x86_64-unknown-linux-gnu"

  mkdir -p $srcdir/lib/obj/aarch64-lkern-kernel
  sed -i "s|rustc|${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/rustc/bin/rustc -O|" \
    $srcdir/driver/Makefile $srcdir/lib/make_plugin.sh $srcdir/lib/targets.sh
  sed -i "s|lrsc|${srcdir}/driver/lrsc -O|" \
    $srcdir/lib/Makefile $srcdir/lib/make_libtest.sh
}

build() {
  export LD_LIBRARY_PATH="${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/rustc/lib"\
    LRS_OBJ_PATH="${srcdir}/lib/obj"

	cd "$srcdir/driver"
	make lrsc

  cd "$srcdir/lib"
  ./make_plugin.sh
  ./make_asm.sh
  ./make_lrs.sh
  ./make_libtest.sh

  unset LD_LIBRARY_PATH LRS_OBJ_PATH
}

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib/lrs $pkgdir/usr/share/licenses/lrs
  cp "$srcdir/driver/lrsc" "$pkgdir/usr/bin/lrsc"
  cp ${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/rustc/lib/*.so "$pkgdir/usr/lib"
  cp ${srcdir}/rust-nightly-x86_64-unknown-linux-gnu/LICENSE-* \
    "$srcdir/rust-nightly-x86_64-unknown-linux-gnu/COPYRIGHT" \
    "$srcdir/lib/LICENSE" $pkgdir/usr/share/licenses/lrs
  cp -r "$srcdir/lib/obj/" "$pkgdir/usr/lib/lrs"
  cp -r "$srcdir/lib/asm/" "$pkgdir/usr/lib/lrs"
}
