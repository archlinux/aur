# Maintainer: ~grassblock <i [at] gb0 [dot] dev>

pkgname=xsz-git
_pkgname=xsz
pkgver=v0.4.2.r0.g47a53d0
pkgrel=1
pkgdesc="a compsize rewrite with multithread support (git version)"
url="https://github.com/SaltyKitkat/xsz"
arch=(x86_64)
license=(GPL-2.0)
provides=(xsz)
replaces=(xsz)
conflicts=(xsz)
depends=(libgcc # libgcc_s.so
         glibc # libc.so libm.so
         )
makedepends=(cargo git)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_pkgname}"
  CFLAGS+=' -ffat-lto-objects'
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"
  cargo test --frozen
}


package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
