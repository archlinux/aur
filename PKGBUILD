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
git+https://github.com/rustcrypto/hashes.git
fast-md5.patch::https://github.com/RustCrypto/hashes/commit/981bd7cc56077995c67bf20a215cdfefc7b6a29b.patch
no-openssl-md5.patch
)
b2sums=('SKIP'
        'SKIP'
        'a21b1450a143d18800faa0858e7e376f208082c5cd45db33a848cd5bdda2f8e56b23aa9818ca14bd599020e25c737c11c6caa44fb46cb3e7edf9abf9c2754d03'
        'bc10d079dd8a0d34aa5173296aa20ad649354d121d73dd751899c70a34d6c23843994f68a0a31df3e6fa674f81403aab179670a46573412aadc05c4b208826a0')
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd ${pkgname%-git}
  echo -e "[patch.crates-io]\nmd-5 = { path = \"../hashes/md5\" }" >> Cargo.toml
  git apply -v ../no-openssl-md5.patch
  cargo update -p md-5
  cd ../hashes
  git apply -v ../fast-md5.patch --exclude=.github/*
}

# Packaging guideline cause double build
export OPENSSL_NO_VENDOR=1 OPENSSL_DIR=/usr
export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no --cfg=linux_latest" # rustix cfg compat with Arch 's lts kernel
[ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
package(){
  cd ${pkgname%-git}
  export CARGOFLAGS+=" --features feat_systemd_logind,openssl"
  export DESTDIR="$pkgdir" PREFIX=/usr PROFILE=release MULTICALL=y MANPAGES=y COMPLETIONS=y #LOCALES=n
  make install LIBSTDBUF_DIR=/usr/lib/${pkgname%-git} SKIP_UTILS="arch kill more uptime hostname" #expand factor hostid unexpand pinky ptx sum shred shuf"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
}
