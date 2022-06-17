# Maintainer: Core_UK <mail.coreuk@gmail.com>

pkgname=cider
_pkgname=Cider
pkgver=1.5.1
pkgrel=1
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Installed using the debian release builds from CircleCI."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/CiderApp/${_pkgname}.git"
_url="https://api.github.com/repos/ciderapp/cider-releases/releases/latest"
license=('GPL')
depends=('gtk3' 'nss' 'wget')
optdepends=('libnotify: Playback notifications')
source=("cider.desktop")
sha256sums=('7bf97dfa92b312ceb95d005a8aa7f225af079ee450f38b58b894e951a529d997')

pkgver() {
    curl -s $_url | grep tag_name | cut -d '"' -f 4 | sed 's/v//' | sed 's/\-/./g' | xargs
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
    curl -s https://raw.githubusercontent.com/CiderApp/cider/master/README.md > README
    curl -s https://raw.githubusercontent.com/CiderApp/cider/master/LICENSE > LICENSE
    curl -s https://raw.githubusercontent.com/CiderApp/cider/master/resources/icons/cider.png > icon.png
}

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -d "$pkgdir/usr/bin/"
    ln -sf "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop File
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
