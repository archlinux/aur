# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.8.0.r41.g56210f1
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
"tee.patch::https://patch-diff.githubusercontent.com/raw/uutils/coreutils/pull/11686.patch"
"yes-boost.patch::https://patch-diff.githubusercontent.com/raw/uutils/coreutils/pull/11458.patch"
"${url}/releases/download/latest-commit/docs.tar.zst")
b2sums=('SKIP'
        'dbec4e3bffcee0989fe954dc5ffe0fdf537a9c9eb637a2c5c48baa108b731526887a1c93489fef2470d874a0da7fd8ecc83e2b2b88327d39ca577204de4829f6'
        'f1e2d0dd807e42815d48ffc6c25cabcdd3fac3d32568c4f90656ae623842d1f0e77f3fc393bc589e1ce9e7fa6f78749694cb72d5be38769ce694cc7f08eb1ff7'
        '95b64a22c40ec2cd357334c6ddedef7ba05f8b30b43535fefdad4c5dad7aaf27f37ba928c3930b55fca2993312f27574d90546dfb7f8a8efcd7688fe955a74b4')
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
  git apply -v -p1 ../tee.patch
  git apply -v -p1 ../yes-boost.patch
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
