# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=r1.g038a08b
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
source=("${pkgname%-git}::git+${url}.git"
"${url}/releases/download/latest-commit/docs.tar.zst")
b2sums=('SKIP' 'SKIP')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

# Packaging guideline cause double build.
export RUSTONIG_DYNAMIC_LIBONIG=1
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no" # Use old rust's panic's default
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  unset optdepends
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release-fast MULTICALL=y LN="ln -f" MANPAGES=n COMPLETIONS=n LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname sum shred shuf factor"
  #make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
  cp -r ../share "$pkgdir"/usr && cd "$pkgdir"/usr/share
  rm -r bash-completion elvish
  for _b in arch kill more uptime hostname;do
    mv man/man1/{${_b},uu-${_b}}.1
    mv fish/vendor_completions.d/{${_b},uu-${_b}}.fish
    mv zsh/site-functions/_{${_b},uu-${_b}}
  done
}
