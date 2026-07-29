# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-ext-applet-external-monitor-brightness-custom-git
_srcname=cosmic-ext-applet-external-monitor-brightness
pkgver=0.1.0.r1.gf32568d
pkgrel=1
pkgdesc='COSMIC panel applet for controlling external-monitor brightness via DDC/CI'
arch=('x86_64')
url='https://github.com/AdityaHebballe/cosmic-ext-applet-external-monitor-brightness'
license=('GPL-3.0-only')
depends=('cosmic-external-osd-git' 'dbus' 'gcc-libs' 'glibc' 'libxkbcommon')
makedepends=('cargo' 'git')
options=(!lto)
provides=('cosmic-ext-applet-external-monitor-brightness')
conflicts=('cosmic-ext-applet-external-monitor-brightness')
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
  install -Dm755 target/release/cosmic-ext-applet-external-monitor-brightness \
    -t "${pkgdir}/usr/bin"
  install -Dm644 res/desktop_entry.desktop \
    "${pkgdir}/usr/share/applications/io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness.desktop"
  install -Dm644 res/metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness.metainfo.xml"
  install -Dm644 res/icons/display-symbolic.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness-symbolic.svg"
}
