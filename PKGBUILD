# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.7.0.r46.gde5e4f5
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc oniguruma)
makedepends=(git rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
provides=(coreutils)
conflicts=({uutils-,}coreutils)
source=("${pkgname%-git}::git+${url}.git"
"${url}/releases/download/latest-commit/docs.tar.zst")
b2sums=('SKIP'
        'dc70e67e75acdd90763a296a770baea13f25c027d47f3f7d30b34a3c1958fbedc1e7c98159576e9883a2a9f6c28e1c5aab6e9afa1d85d62321acbb423603dc82')
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
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release MULTICALL=y LN="ln -f" MANPAGES=n COMPLETIONS=n #LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname" #"sum shred shuf factor"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
  cp -r ../share "$pkgdir"/usr && cd "$pkgdir"/usr/share
  rm -r bash-completion elvish
  for _b in arch kill more uptime hostname;do
    rm man/man1/${_b}.1
    rm fish/vendor_completions.d/${_b}.fish
    rm zsh/site-functions/_${_b}
  done
}
