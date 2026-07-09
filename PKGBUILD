# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=1.35.0
_flutter_ver=3.44.5
pkgrel=1
pkgdesc="The cross-platform notes app built for handwriting"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0-only')
depends=('at-spi2-core'
         'bash'
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
makedepends=('clang' 'cmake' 'fvm' 'gst-plugins-base-libs' 'java-environment' 'ninja' 'patchelf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('bc581e9ae67ae39d738ff51320715e08297af3fef43ce8b7d44d0d548792f40a'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install "${_flutter_ver}"
    fvm global "${_flutter_ver}"
    fvm flutter config --no-analytics

    ./patches/pre/remove_dev_dependencies.sh
    ./patches/pre/remove_permission_handler.sh
    ./patches/pre/remove_proprietary_dependencies.sh

    fvm flutter pub get

    ./patches/post/patch_rust_versions.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    fvm flutter build linux --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"
    install -Dm644 assets/icon/icon_linux.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.adilhanney.saber.svg"
    install -Dm644 flatpak/com.adilhanney.saber.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 flatpak/com.adilhanney.saber.metainfo.xml -t "${pkgdir}/usr/share/metainfo"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    patchelf --remove-rpath "${pkgdir}/opt/${pkgname}/lib/"lib*_plugin.so
}
