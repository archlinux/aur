# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-corners-enhanced-git
_srcname=cosmic-hotcorners
pkgver=0.1.0.r15.gd4699e4
pkgrel=1
pkgdesc='Enhanced configurable hot corners for the COSMIC desktop'
arch=('x86_64')
url='https://github.com/AdityaHebballe/cosmic-hotcorners'
license=('MPL-2.0')
depends=('cosmic-session' 'gcc-libs' 'glibc' 'libxkbcommon')
makedepends=('cargo' 'git')
provides=('cosmic-hot-corners')
conflicts=('cosmic-hot-corners')
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

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 target/release/cosmic-hot-corners -t "${pkgdir}/usr/bin"
  install -Dm644 resources/io.github.cosmic-hot-corners.desktop \
    "${pkgdir}/usr/share/applications/io.github.cosmic-hot-corners.desktop"
  install -Dm644 resources/io.github.cosmic-hot-corners.settings.desktop \
    "${pkgdir}/usr/share/applications/io.github.cosmic-hot-corners.settings.desktop"
  install -Dm644 resources/app.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.cosmic-hot-corners.metainfo.xml"
  install -Dm644 resources/io.github.cosmic-hot-corners.service \
    "${pkgdir}/usr/lib/systemd/user/io.github.cosmic-hot-corners.service"
  install -Dm644 resources/icons/hicolor/scalable/apps/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.cosmic-hot-corners.svg"
}
