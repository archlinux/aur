# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

_pkgname=uutils-coreutils
pkgname=${_pkgname}-git
pkgver=0.1.0.r541.g97041c9
pkgrel=1
pkgdesc="Rust rewrite of coreutils"
url='https://github.com/uutils/coreutils'
license=('MIT')
arch=('x86_64')

depends=(gcc-libs glibc oniguruma)
makedepends=(git rust) # clang for SELinux build
options=('!lto')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$_pkgname"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

export RUSTONIG_DYNAMIC_LIBONIG=1
# release-fast has panic=abort
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) -C panic=abort ${RUSTFLAGS}"

# How to avoid building twice on packaging guideline?

package() {
  cd $_pkgname
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y \
    PROG_PREFIX=uu- LIBSTDBUF_DIR=/usr/lib SKIP_UTILS="runcon chcon" # Avoid SELinux bug for build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
