
# Created by: damachin3 (damachine3 at proton dot me)
# Website: https://github.com/damachine/coolerdash

pkgname=coolerdash-git
pkgver=2.2.1.r0.gc356e8c
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Monitor telemetry data on an AIO liquid cooler with an integrated LCD display"
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'ttf-roboto')
makedepends=('gcc' 'make' 'pkg-config' 'git')
backup=('etc/coolercontrol/plugins/coolerdash/config.json')
install=coolerdash.install
_commit=c356e8cb4861bab23995416695358dbbf7d51409
source=("git+https://github.com/damachine/coolerdash.git#commit=${_commit}")
sha256sums=('SKIP') # SKIP for git repo source builds

pkgver() {
    cd "${srcdir}/coolerdash"
    git fetch --tags
    git describe --tags --long --match "v*" | sed -E 's/^v//; s/-([0-9]+)-g/\.r\1.g/; s/-/./g'
}

build() {
    # Build inside the checked-out repository
    cd "${srcdir}/coolerdash" || return 1

    # Remove all previous tarball builds
    rm -rf coolerdash-*.pkg.* || true

    # Clean any previous builds if a Makefile exists
    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean || true
    fi

    # Build
    make || return 1
}

check() {
    # Check in the checked-out repository
    cd "${srcdir}/coolerdash" || return 1

    # Verify that the binary was created successfully
    if [[ -f bin/coolerdash ]]; then
        echo "Build successful - binary created"
    else
        echo "ERROR: Binary not found"
        return 1
    fi
}

package() {
    # Plugin-mode installation: Everything in /etc/coolercontrol/plugins/coolerdash/
    install -dm755 "${pkgdir}/etc/coolercontrol/plugins/coolerdash"
    install -m755 "${srcdir}/coolerdash/bin/coolerdash" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/coolerdash"
    install -m644 "${srcdir}/coolerdash/README.md" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/README.md"
    install -m644 "${srcdir}/coolerdash/VERSION" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/VERSION"
    install -m644 "${srcdir}/coolerdash/LICENSE" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/LICENSE"
    install -m644 "${srcdir}/coolerdash/CHANGELOG.md" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/CHANGELOG.md"
    install -m666 "${srcdir}/coolerdash/etc/coolercontrol/plugins/coolerdash/config.json" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/config.json"

    # Create ui directory first with correct permissions
    install -dm755 "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui"
    install -m644 "${srcdir}/coolerdash/etc/coolercontrol/plugins/coolerdash/ui/index.html" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui/index.html"
    install -m644 "${srcdir}/coolerdash/etc/coolercontrol/plugins/coolerdash/ui/cc-plugin-lib.js" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/ui/cc-plugin-lib.js"
    install -m644 "${srcdir}/coolerdash/images/shutdown.png" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/shutdown.png"
    install -m644 "${srcdir}/coolerdash/etc/coolercontrol/plugins/coolerdash/manifest.toml" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/manifest.toml"

    # Substitute VERSION placeholder in manifest.toml
    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/manifest.toml"

    # Manual page
    install -Dm644 "${srcdir}/coolerdash/man/coolerdash.1" "${pkgdir}/usr/share/man/man1/coolerdash.1"

    # Desktop shortcut for settings UI
    install -Dm644 "${srcdir}/coolerdash/etc/applications/coolerdash.desktop" "${pkgdir}/usr/share/applications/coolerdash.desktop"

    # USB power management udev rule for
    install -Dm644 "${srcdir}/coolerdash/etc/udev/rules.d/99-coolerdash.rules" "${pkgdir}/usr/lib/udev/rules.d/99-coolerdash.rules"

    # Application icon
    install -Dm644 "${srcdir}/coolerdash/etc/icons/coolerdash.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/coolerdash.svg"
}
