# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=1.33.2
_flutter_ver=3.41.7
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
         'glib2'
         'glibc'
         'gstreamer'
         'gtk3'
         'hicolor-icon-theme'
         'libepoxy'
         'libgcc'
         'libsecret'
         'libstdc++'
         'libx11'
         'libxmu'
         'pango'
         'webkit2gtk-4.1'
         'zenity'
         'zlib')
makedepends=('clang' 'cmake' 'fvm' 'gst-plugins-base-libs' 'java-environment' 'ninja' 'patchelf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('3aa2b3deeeee0ea9632531880e4847d9e8aaf0dee0fbd85b353989bf4edd3b77'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install "${_flutter_ver}"
    fvm global "${_flutter_ver}"

    sed -i 's/dart/fvm dart/' ./patches/post/remove_wasm_libs.sh

    # Disable analytics
    fvm flutter config --no-analytics

    ./patches/pre/remove_dev_dependencies.sh
    ./patches/pre/remove_proprietary_dependencies.sh

    # Pull dependencies within prepare, allowing for offline builds later on
    fvm flutter pub get

    ./patches/post/patch_rust_versions.sh
    ./patches/post/remove_wasm_libs.sh
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

    patchelf --remove-rpath "${pkgdir}/opt/${pkgname}/lib/"lib*_plugin.so
}
