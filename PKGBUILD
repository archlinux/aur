# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Polarian <polarian@polarian.dev>

pkgname=saber
pkgver=0.21.3
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
        "saber.sh")
sha256sums=('1869973a8eb40fa243345235320a34becacdc4d09757fef5aa3307276c69f43a'
            '2b563ad53416aba926c6f6983daefbe3294be44ff95f3406fa5247ae596a4fa0')

prepare() {
    cd "${pkgname}-${pkgver}"
    echo y | fvm global stable

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
