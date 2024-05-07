# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.23.0
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
sha256sums=('9d5f6ec3d6a50420f86bdfb66e9a86c00707e768f102525647e8ffa1f3924058'
            '2429585c739f6da2d2068fd44d5868bb9a0ef6657d8117ca32fd8e0b78942a10')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm install stable
    fvm global stable

    # Disable analytics and enable linux desktop
    fvm flutter --no-version-check config --no-analytics
    fvm flutter --no-version-check config --enable-linux-desktop

    # Pull dependencies within prepare, allowing for offline builds later on
    fvm flutter --no-version-check pub get
}

build() {
    cd "${pkgname}-${pkgver}"
    fvm flutter --no-version-check build linux --release --prefixed-errors
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install application, licence and desktop file (with assets)
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a --no-preserve=ownership build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" flatpak/com.adilhanney.saber.desktop
    install -Dm644 assets/icon/icon.png "${pkgdir}/usr/share/pixmaps/com.adilhanney.saber.png"

    # Copy wrapper script to /usr/bin
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
