# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-git
pkgver=0.11.0.r55.g7d844a7
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url=https://github.com/uutils/coreutils
license=('MIT')
arch=('x86_64')
depends=(glibc libgcc openssl systemd-libs)
makedepends=(git rust)
provides=(coreutils)
conflicts=({uutils-,}coreutils)
source=("${pkgname%-git}::git+${url}.git"
"drop-onig.patch::https://github.com/wtcpython/coreutils/commit/9a478f8dac8a82a60da1c507e6d677098d27ec5a.patch")
b2sums=('SKIP'
        '9d8a60df423d80aa59dd10b327883fe43f70cc6f95fc05ac11c34bfb7ce26d5c71551e86fe6455ed0337e6e80c1aa4dc1532cf128ba5cd2a10e107f1f56f1e1e')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

# Packaging guideline cause double build
export OPENSSL_NO_VENDOR=1 OPENSSL_DIR=/usr
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no --cfg=linux_latest" # rustix cfg compat with Arch 's lts kernel
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  git apply -v --include="src/uu/expr/*" --include="Cargo.*" ../drop-onig.patch
  export CARGOFLAGS+=" --features feat_systemd_logind,openssl"
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release MULTICALL=y MANPAGES=y COMPLETIONS=y #LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname" #expand factor unexpand pinky ptx sum shred shuf"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
}
