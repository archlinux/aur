# Maintainer:
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}

export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="uutils-coreutils"
pkgname="$_pkgname-git"
pkgver=0.0.27.r279.gdb40287
pkgrel=1
pkgdesc="GNU Coreutils rewritten in Rust"
url='https://github.com/uutils/coreutils'
license=('MIT')
arch=('x86_64')

depends=(
  'gcc-libs'
  'glibc'
  'oniguruma'
)
makedepends=(
  'cargo'
  'git'
  'python-sphinx'
  'rust'
)

options=('!lto')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/uutils/coreutils.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  sed 's|"bin"|"builduser"|g' -i tests/by-util/test_{chgrp,chown}.rs
}

build() {
  export RUSTONIG_DYNAMIC_LIBONIG=1

  cd "$_pkgsrc"
  make PROFILE=release
}

check() {
  local _test_skip=(
    --no-fail-fast --
    --skip test_chgrp::test_1
    --skip test_chgrp::test_big_h
    --skip test_chgrp::test_big_p
    --skip test_chgrp::test_fail_silently
    --skip test_chgrp::test_preserve_root
    --skip test_chgrp::test_preserve_root_symlink
    --skip test_chgrp::test_preserve_root_symlink_cwd_root
    --skip test_chgrp::test_reference
    --skip test_chown::test_big_p
    --skip test_ls::test_ls_styles
    --skip test_who::test_boot
  )

  cd "$_pkgsrc"
  make test \
    PROFILE=release \
    CARGOFLAGS=--release \
    TEST_NO_FAIL_FAST="${_test_skip[*]}"
}

package() {
  cd "$_pkgsrc"
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    MANDIR=/share/man/man1 \
    PROG_PREFIX=uu- \
    PROFILE=release
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
