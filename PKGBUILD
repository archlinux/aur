# Maintainer: sqzer <110329244+sqzer-x@users.noreply.github.com>
pkgname=sqzass
pkgver=0.1.0
pkgrel=1
pkgdesc='A static site generator written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/sqzer-x/sqzass'
license=('MIT')
# `ldd`가 말하는 그대로다: libc/libm(glibc)와 libgcc_s(libgcc). gcc-libs는
# 이제 그 둘을 포함한 열둘을 끌어오는 상위 패키지라, 그걸 적으면 이 바이너리가
# 열지도 않는 libasan·libgfortran 따위가 따라온다. 공식 Rust 패키지(ripgrep,
# fd, bat)도 전부 glibc + libgcc를 적는다.
depends=('glibc' 'libgcc')
makedepends=('cargo')
# makepkg의 lto 옵션은 CFLAGS에 -flto를 넣어 onig_sys의 C 오브젝트를 GCC LTO
# 비트코드로 만드는데, rustc의 링커(lld)는 그걸 못 읽어 onig_* 심볼이 전부
# undefined가 된다. C 의존이 있는 Rust 패키지의 표준 처방이다.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a68262010c3e4b8ada884edaa174025d1b605376be26673ea6d44c926cee3dc9')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
