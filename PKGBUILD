# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgbase=uutils-coreutils-git
pkgname=($pkgbase coreutils-uutils)
pkgver=0.4.0.r236.g6c6def9
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(gcc-libs glibc oniguruma)
makedepends=(git rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
options=(zipman)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
  (cd ${pkgname%-git} && cargo update -p libc) # inject patched libc to nix
  echo -e "[patch.crates-io]\nlibc.path = \"../libc-${_libc}\"" >> ${pkgname%-git}/Cargo.toml
  for _b in 0 50 75 110 134 150 200 300 600 1200 1800 2400 4800 9600 19200 38400 57600 115200 230400 460800 500000 576000 921600 1000000 1152000 1500000 2000000 2500000 3000000 3500000 4000000;do
    sed -i "s/pub const B${_b}: crate::speed_t =.*;/pub const B${_b}: crate::speed_t = ${_b};/" libc-${_libc}/src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs
  done
}
# Packaging guideline cause double build.
export RUSTONIG_DYNAMIC_LIBONIG=1
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
package_uutils-coreutils-git(){
  cd ${pkgbase%-git}
  unset optdepends
  make install DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release-fast MULTICALL=y LN="ln -f" \
    PROG_PREFIX=uu- LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} #LOCALES=n SKIP_UTILS="arch shred shuf factor kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgbase%-git}
}

package_coreutils-uutils(){
  pkgdesc='Use uutils as system coreutils'
  provides=(coreutils)
  conflicts=(coreutils)
  cd ${pkgbase%-git}
  unset optdepends
  # Remove this hack after patch was removed
  depends=(uutils-coreutils)
  install -d "$pkgdir"/usr/{bin,share/{licenses/${pkgname},man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  ln -sf uu-\[ bin/\[ # zsh completion err
  for _f in $("$srcdir"/uutils-coreutils/target/release-fast/coreutils --list | grep -v -E '^(kill|more|uptime|hostname|hashsum|\[)$') ; do
    ln -sf uu-$_f bin/$_f
    ln -sf uu-${_f}.1.gz share/man/man1/${_f}.1.gz
    echo -e "#compdef ${_f}=uu-${_f}\n_uu-${_f}" > share/zsh/site-functions/_$_f
    echo "complete -c ${_f} -w uu-${_f}" > share/fish/vendor_completions.d/${_f}.fish
  done
  ln -sf /usr/share/licenses/uutils-coreutils/LICENSE -t share/licenses/$pkgname
}
