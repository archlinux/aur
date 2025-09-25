# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.26.8
pkgrel=1
pkgdesc="The cross-platform notes app built for handwriting"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0-only')
depends=('at-spi2-core'
         'bash'
         'cairo'
         'curl'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'glibc'
         'gstreamer'
         'gtk3'
         'hicolor-icon-theme'
         'libepoxy'
         'libsecret'
         'libx11'
         'libxmu'
         'pango'
         'webkit2gtk-4.1'
         'zenity'
         'zlib')
makedepends=('clang' 'cmake' 'fvm' 'gst-plugins-base-libs' 'java-runtime' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "saber.sh")
sha256sums=('23a48d57093352757225285235316cbf741043d6a3f8cec63d73de12b7e91001'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install 3.35.3
    fvm global 3.35.3

    # Disable analytics
    fvm flutter config --no-analytics

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
    install -Dm644 flatpak/com.adilhanney.saber.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.adilhanney.saber.svg"

    # Copy wrapper script to /usr/bin
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
