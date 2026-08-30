# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
_name=com.adilhanney.saber
pkgver=1.36.1
_flutter=3.47.2
pkgrel=1
pkgdesc="The cross-platform notes app built for handwriting"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0-only')
depends=('at-spi2-core'
         'cairo'
         'fontconfig'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libepoxy'
         'libgcc'
         'libsecret'
         'libsoup3'
         'libstdc++'
         'libx11'
         'libxmu'
         'pango'
         'webkit2gtk-4.1'
         'zenity')
makedepends=('chrpath' 'clang' 'cmake' 'fvm' 'ninja' 'rustup')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c8d9ee687fab28dc8675743e69fe74941f6413acebd19e0ef56bf84f779995eb')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm use "${_flutter}"
    fvm flutter config --no-analytics

    ./patches/pre/remove_permission_handler.sh
    ./patches/pre/remove_proprietary_dependencies.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    fvm flutter build linux --release

    chrpath --replace "/usr/lib/${pkgname}/lib" build/linux/x64/release/bundle/lib/*plugin.so
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 assets/icon/icon_linux.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_name}.svg"
    install -Dm644 "flatpak/${_name}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "flatpak/${_name}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
