# Maintainer: Core_UK <mail.coreuk@gmail.com>

pkgname=cider
_pkgname=Cider
pkgver=1.4.5
pkgrel=1
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Compiled from the GitHub repositories main branch."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/CiderApp/${_pkgname}.git"
_url="https://api.github.com/repos/ciderapp/cider-releases/releases/latest"
license=('GPL')
depends=('gtk3' 'nss')
optdepends=('libnotify: Playback notifications')
source=("cider.desktop")
sha256sums=('7bf97dfa92b312ceb95d005a8aa7f225af079ee450f38b58b894e951a529d997')

pkgver() {
    wget $_url \
        -qO- | grep tag_name | cut -d '"' -f 4 | sed 's/v//' | xargs
}

build() {
    cd "$srcdir"

    # Download the latest debian package
    echo "Building ${_pkgname} on v${pkgver} : [Downloading Debian Package] | Extracting Package | Done"
    curl -s $_url |
        grep "browser_download_url.*deb" |
        cut -d : -f 2,3 |
        tr -d \" |
        wget -qi -

    # Extract the package
    echo "Building ${_pkgname} on v${pkgver} : Downloading Debian Package | [Extracting Package] | Done"
    ar vx *.deb
    echo "Building ${_pkgname} on v${pkgver} : Downloading Debian Package | Extracting Package | [Done]"

    # Fetch the Various Useful Files
    echo "Fetching additional Files"
    wget -qO- https://raw.githubusercontent.com/CiderApp/cider/master/README.md |
        sed 's/^/  /' >README

    wget -qO- https://raw.githubusercontent.com/CiderApp/cider/master/LICENSE |
        sed 's/^/  /' >LICENSE

    wget -qO- https://raw.githubusercontent.com/CiderApp/cider/master/resources/icons/cider.png |
        sed 's/^/  /' >icon.png

}

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    # Desktop File
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
