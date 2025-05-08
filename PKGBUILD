# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgbase=parabolic
pkgname=(parabolic-gtk parabolic-qt)
pkgver=2025.5.1
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('aria2'
         'bash'
         'boost-libs'
         'curl'
         'ffmpeg'
         'gcc-libs'
         'glib2'
         'glibc'
         'hicolor-icon-theme'
         'libsecret'
         'openssl'
         'yt-dlp')
makedepends=('blueprint-compiler'
             'boost'
             'cmake'
             'gtk4'
             'libadwaita'
             'libnick'
             'libxml++-5.0'
             'qlementine'
             'qlementine-icons'
             'qt6-base'
             'qt6-svg'
             'yelp-tools')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cf74977ba31a1d19e1a9d6df658e286660875e1f1e9c3e260d5bc16539c88843')

build() {
    cmake -B build-gtk -S "${pkgbase^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUI_PLATFORM=gnome \
        -Wno-dev
    cmake --build build-gtk

    cmake -B build-qt -S "${pkgbase^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUI_PLATFORM=qt \
        -Wno-dev
    cmake --build build-qt
}

package_parabolic-gtk() {
    depends+=('gtk4' 'libadwaita' 'libxml++-5.0')

    DESTDIR="${pkgdir}" cmake --install build-gtk
    install -Dm644 "${pkgbase^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_parabolic-qt() {
    depends+=('qt6-base' 'qt6-svg')

    DESTDIR="${pkgdir}" cmake --install build-qt
    install -Dm644 "${pkgbase^}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
