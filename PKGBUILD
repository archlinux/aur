# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.5.0.r35.g3de9411
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(gcc-libs glibc oniguruma)
makedepends=(git rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
options=(zipman)
provides=(coreutils)
conflicts=({uutils-,}coreutils)
_libc=0.2.178
source=("${pkgname%-git}::git+${url}.git"
"libc${_libc}.tar.gz::https://github.com/rust-lang/libc/archive/refs/tags/${_libc}.tar.gz"
)
sha256sums=('SKIP'
            '4917975056bad9c6098fd389229804d6dadae2bcb1eb2040ceef448ba95a2ec8')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  # glibc changed baud consts...
  echo -e "[patch.crates-io]\nlibc.path = \"../libc-${_libc}\"" >> ${pkgname%-git}/Cargo.toml
  for _b in 0 50 75 110 134 150 200 300 600 1200 1800 2400 4800 9600 19200 38400 57600 115200 230400 460800 500000 576000 921600 1000000 1152000 1500000 2000000 2500000 3000000 3500000 4000000;do
    sed -i "s/pub const B${_b}: crate::speed_t =.*;/pub const B${_b}: crate::speed_t = ${_b};/" libc-${_libc}/src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs
  done
  cd ${pkgname%-git} && cargo update -p libc
}
# Packaging guideline cause double build.
export RUSTONIG_DYNAMIC_LIBONIG=1
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no" # Use old rust's panic's default
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  unset optdepends
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release-fast MULTICALL=y LN="ln -f" #LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname" #"shred shuf factor"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
}
