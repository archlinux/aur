# Maintainer: damachin3 (damachine3 at proton dot me)
# Website: https://github.com/damachine/coolerdash
pkgname=coolerdash-git
pkgver=3.0.5.1.r0.g1615484
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Plug-in for CoolerControl that extends the LCD functionality with additional features"
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'ttf-roboto')
makedepends=('gcc' 'make' 'pkg-config' 'git')
backup=('etc/coolercontrol/plugins/coolerdash/config.json')
install=coolerdash.install
_commit=161548412e904b960b19c42d0b6eb4020b85f756
source=("coolerdash-git::git+https://github.com/damachine/coolerdash.git#commit=${_commit}")
sha256sums=('SKIP') # SKIP for git repo source builds

pkgver() {
    cd "${srcdir}"/"${pkgname}"
    # Fetch latest tags in git repo
    git fetch --tags
    git describe --tags --long --match "v*" | sed -E 's/^v//; s/-([0-9]+)-g/\.r\1.g/; s/-/./g'
}

build() {
    # Build inside the checked-out repository
    cd "${srcdir}"/"${pkgname}"

    # Remove all previous tarball builds
    rm -f "${pkgname}"-*.pkg.tar.*

    # Clean any previous builds if a Makefile exists
    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean
    fi

    # Build the project
    make
}

check() {
    # Check in the checked-out repository
    cd "${srcdir}"/"${pkgname}"

    # Verify that the binary was created successfully
    if [[ -f bin/coolerdash ]]; then
        msg "Build successful - binary created"
    else
        error "Build failed - binary not found"
        return 1
    fi
}

package() {
    # Binary to /usr/libexec, plugin data stays in /etc/coolercontrol/plugins/
    install -dm755 "${pkgdir}/etc/coolercontrol/plugins/coolerdash"
    install -Dm755 "${srcdir}/${pkgname}/bin/coolerdash" "${pkgdir}/usr/libexec/coolerdash/coolerdash"
    install -m644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/README.md"
    install -m644 "${srcdir}/${pkgname}/VERSION" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/VERSION"
    install -m644 "${srcdir}/${pkgname}/CHANGELOG.md" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/CHANGELOG.md"
    install -m600 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/config.json" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/config.json"

    install -dm755 "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui"
    install -m644 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/ui/index.html" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui/index.html"
    install -m644 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/ui/cc-plugin-lib.js" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui/cc-plugin-lib.js"
    install -m644 "${srcdir}/${pkgname}/images/shutdown.png" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/shutdown.png"
    install -m644 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/manifest.toml" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/manifest.toml"

    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/manifest.toml"
    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui/index.html"

    install -Dm644 "${srcdir}/${pkgname}/man/coolerdash.1" "${pkgdir}/usr/share/man/man1/coolerdash.1"
    install -Dm644 "${srcdir}/${pkgname}/etc/applications/coolerdash.desktop" "${pkgdir}/usr/share/applications/coolerdash.desktop"
    install -Dm644 "${srcdir}/${pkgname}/etc/icons/coolerdash.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/coolerdash.svg"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
