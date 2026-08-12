# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.9.0.r350.ge646122
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc oniguruma openssl systemd-libs)
makedepends=(git pkgconf rust)
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
export OPENSSL_NO_VENDOR=1
export RUSTONIG_DYNAMIC_LIBONIG=1
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no --cfg=linux_latest" # rustix cfg compat with Arch 's lts kernel
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  export CARGOFLAGS+=" --features feat_systemd_logind,openssl"
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release MULTICALL=y MANPAGES=n COMPLETIONS=n #LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname" #expand factor unexpand pinky ptx sum shred shuf"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
  cp -r ../share "$pkgdir"/usr && cd "$pkgdir"/usr/share
  for _b in arch kill more uptime hostname;do
    rm man/man1/${_b}.1
    rm fish/vendor_completions.d/${_b}.fish
    rm zsh/site-functions/_${_b}
  done
}
