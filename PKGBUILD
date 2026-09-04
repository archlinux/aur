# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.11.0.r35.g6feff61
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc openssl systemd-libs)
makedepends=(git pkgconf rust)
provides=(coreutils)
conflicts=({uutils-,}coreutils)
source=("${pkgname%-git}::git+${url}.git"
"drop-onig.patch::https://github.com/wtcpython/coreutils/commit/a5b4f743ab166d4e28b337b14faa8fdb0ba1a3d5.patch"
"${url}/releases/download/latest-commit/docs.tar.zst")
b2sums=('SKIP'
        '9bf86101e1b16c20fd61f2aafba390f64882bbf0b8318c72cf21242d36d1797e2011ae69541b5e610010a98f014f5857ee8c3da2d59ea703e8b36b87007fcfd8'
        'cfc8531e58bd18ff274ef7a30ef98c700b8738f8e32cfe94934a0a6aecd1b0ca26b72691721f695e7a8d5a5ee3665bc0b0ba8d2dd8d82054f5d131430aca4c84')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

# Packaging guideline cause double build
export OPENSSL_NO_VENDOR=1
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no --cfg=linux_latest" # rustix cfg compat with Arch 's lts kernel
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  git apply -v --include="src/uu/expr/*" --include="Cargo.*" ../drop-onig.patch
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
