# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.23.1
pkgrel=1
pkgdesc="The cross-platform notes app built for handwriting"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0-or-later')
depends=('at-spi2-core'
         'bash'
         'cairo'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'glibc'
         'gstreamer'
         'gtk3'
         'libepoxy'
         'libsecret'
         'pango')
makedepends=('clang' 'cmake' 'fvm' 'gst-plugins-base-libs' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "saber.sh")
sha256sums=('6e6a8e5d753b826baa72bf2bd792d5036142a1108916a21726bc5bccad7dafa5'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install 3.19.6
    fvm global 3.19.6

    # Disable analytics
    fvm flutter --disable-analytics

    # Pull dependencies within prepare, allowing for offline builds later on
    fvm flutter pub get
}

build() {
    cd "${pkgname}-${pkgver}"
    fvm flutter build linux --release
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install application, licence and desktop file (with assets)
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" flatpak/com.adilhanney.saber.desktop
    install -Dm644 assets/icon/icon.png "${pkgdir}/usr/share/pixmaps/com.adilhanney.saber.png"

    # Copy wrapper script to /usr/bin
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
