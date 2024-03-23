# Maintainer: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.21.2
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
         'gtk3'
         'libepoxy'
         'libsecret'
         'pango')
makedepends=('clang' 'cmake' 'fvm' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "0001-Modify-.desktop-for-Arch-Linux.patch"
        "saber.sh")
sha256sums=('54fca828a75728faf77ed699a8ca910445e70920fbbaa896c929a6221c164ac3'
            '93e6e067fefad597117d7f6889df204082898b79dcd29853eaa5c879ab35b2df'
            'db48941f0077c7a7e50201d0a5aab93e80d81bcf518bc3eaa900a71e152a627c')

prepare() {
    cd "${pkgname}-${pkgver}"
    fvm global stable

    # Disable analytics and enable linux desktop
    fvm flutter --no-version-check config --no-analytics
    fvm flutter --no-version-check config --enable-linux-desktop

    # Patch source to allow for better .desktop naming
    patch -p1 -i "$srcdir/0001-Modify-.desktop-for-Arch-Linux.patch"

    # Pull dependencies within prepare, allowing for offline builds later on
    fvm flutter --no-version-check pub get
}

build() {
    cd "${pkgname}-${pkgver}"
    fvm flutter --no-version-check build linux --release --prefixed-errors

    # Copy icon to source directory for installing
    cp assets/icon/resized/icon-512x512.png ./saber.png
}

package() {
    # Build directory for the final executable
    cd "${pkgname}-${pkgver}/build/linux/x64/release/bundle"

    # Install application, licence and desktop file (with assets)
    install -d "${pkgdir}/opt/${pkgname}"
    cp -rdp --no-preserve=ownership . "${pkgdir}/opt/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-${pkgver}/saber.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${srcdir}/${pkgname}-${pkgver}/saber.png"

    # Copy wrapper script to /usr/bin
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
