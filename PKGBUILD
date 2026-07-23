# Maintainer: Gurov <thuggerthugger1@duck.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Filipe Laíns (ffy00) <lains@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: xiota
# Contributor: Sam <dev at samarthj dot com>
# Contributor: Árni Dagur <arnidg at protonmail dot ch>

pkgname=uutils-coreutils-nosystemd-git
_pkgname=coreutils
pkgver=0.9.0.r499.g49a56e2
pkgrel=1
pkgdesc='Cross-platform Rust rewrite of the GNU coreutils (without systemd integration)'
arch=('x86_64')
url="https://github.com/uutils/coreutils"
license=('MIT')

depends=(
  acl
  glibc
  libgcc
  oniguruma
  openssl
)
makedepends=(
  git
  pkgconf
  rust
)

provides=(coreutils)
conflicts=({uutils-,}coreutils)

source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  
  export OPENSSL_NO_VENDOR=1
  export RUSTONIG_DYNAMIC_LIBONIG=1
  
  export CARGOFLAGS="--features feat_acl,openssl,feat_external_libstdbuf"
  
  make PROFILE=release MULTICALL=y
}

package() {
  cd "${_pkgname}"

  export DESTDIR="$pkgdir" \
         PREFIX=/usr \
         PROFILE=release \
         MULTICALL=y \
         MANPAGES=n \
         COMPLETIONS=n

  make install LIBSTDBUF_DIR=/usr/lib/${pkgname} SKIP_UTILS="arch kill more uptime hostname"
  make install PROG_PREFIX=uu- UTILS="arch kill more uptime hostname"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
