# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libhdr10plus-rs
pkgname=${_pkgname}-git
pkgver=2.1.2.r0.gcfa5c36
pkgrel=1
pkgdesc='Library to read and write HDR10+ metadata (C-API) - git version'
arch=('x86_64')
url='https://github.com/quietvoid/hdr10plus_tool/hdr10plus'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cargo-c')
conflicts=('libhdr10plus-rs')
provides=('libhdr10plus-rs' 'libhdr10plus-rs.so')
source=(git+https://github.com/quietvoid/hdr10plus_tool.git)
sha256sums=(SKIP)

pkgver() {
  cd hdr10plus_tool

  git describe --match "libhdr10plus-[0-9]*" --long HEAD --tags | sed 's/^libhdr10plus-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --manifest-path hdr10plus_tool/hdr10plus/Cargo.toml
}

build() {
  cargo cbuild \
    --release \
    --frozen \
    --prefix=/usr \
    --manifest-path hdr10plus_tool/hdr10plus/Cargo.toml
}

package() {
  cd hdr10plus_tool/hdr10plus

  cargo cinstall \
    --release \
    --frozen \
    --prefix /usr \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
