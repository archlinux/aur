# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-external-osd-git
_srcname=cosmic-external-osd
pkgver=0.1.0.r1.gbcf9e75
pkgrel=2
pkgdesc='D-Bus-activated desktop-wide on-screen display service for COSMIC extensions'
arch=('x86_64')
url='https://github.com/AdityaHebballe/cosmic-external-osd'
license=('GPL-3.0-only')
depends=('cosmic-session' 'dbus' 'gcc-libs' 'glibc' 'libxkbcommon')
makedepends=('cargo' 'git')
options=(!lto)
provides=('cosmic-external-osd')
conflicts=('cosmic-external-osd')
source=("${_srcname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf '0.1.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"
  CARGO_PROFILE_RELEASE_LTO=thin cargo build --release --locked
}

package() {
  cd "${srcdir}/${_srcname}"
  install -Dm755 target/release/cosmic-external-osd -t "${pkgdir}/usr/bin"
  install -Dm644 res/io.github.cosmic_utils.ExternalOsd.service \
    "${pkgdir}/usr/share/dbus-1/services/io.github.cosmic_utils.ExternalOsd.service"
}
