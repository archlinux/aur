# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=1.29.3
_flutter_ver=3.38.2
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
makedepends=('clang' 'cmake' 'fvm' 'gst-plugins-base-libs' 'java-environment' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "saber.sh")
sha256sums=('104dbe888fa5faea47cbcd09423dde681d56a1d8f88c362d4dc1f890e56d13cc'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install "${_flutter_ver}"
    fvm global "${_flutter_ver}"

    sed -i 's/dart/fvm dart/' ./patches/remove_dev_dependencies.sh

    # Disable analytics
    fvm flutter config --no-analytics

    # Pull dependencies within prepare, allowing for offline builds later on
    fvm flutter pub get

    ./patches/remove_proprietary_dependencies.sh
    ./patches/remove_dev_dependencies.sh
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
    install -Dm644 assets/icon/icon_linux.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.adilhanney.saber.svg"
    install -Dm644 flatpak/com.adilhanney.saber.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 flatpak/com.adilhanney.saber.metainfo.xml -t "${pkgdir}/usr/share/metainfo"

    # Copy wrapper script to /usr/bin
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
