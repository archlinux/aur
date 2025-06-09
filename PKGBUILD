# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

_pkgname=uutils-coreutils
pkgname=${_pkgname}-git
pkgver=0.1.0.r251.g3b225aa
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
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

export RUSTONIG_DYNAMIC_LIBONIG=1
export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) ${RUSTFLAGS} --remap-path-prefix=${srcdir}="

#build() { cause build twice
#  cd $_pkgname
#  cargo build --release # --locked
#}

package() {
  cd $_pkgname
  make install DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/share/man/man1 PROFILE=release MULTICALL=y \
    PROG_PREFIX=uu- SKIP_UTILS="runcon chcon" # Avoid SELinux bug for build
  # for $PATH
  _uu="$pkgdir"/usr/bin/uu-coreutils
  install -d "$pkgdir"/usr/lib/uu-coreutils
  for f in $("$_uu" --list)
    do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/lib/uu-coreutils/"$f"
  done
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
