pkgname=coolerdash-git
pkgver=2.0.3.r0.gacdc432
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Monitor telemetry data on an AIO liquid cooler with an integrated LCD display"
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'libinih' 'ttf-roboto')
makedepends=('gcc' 'make' 'pkg-config' 'git')
backup=('etc/coolerdash/config.ini')
install=coolerdash.install
_commit=acdc432308dc869b4955b2b9f7648ccb494630a2
source=("git+https://github.com/damachine/coolerdash.git#commit=${_commit}")
sha256sums=('SKIP') # SKIP for git repo source

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
    rm -rf build bin || true
    mkdir -p build bin || true

    # Clean any previous builds if a Makefile exists
    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean || true
    fi

    # Build
    make || return 1

    # Copy binary to ${srcdir}/bin for packaging
    mkdir -p "${srcdir}/bin"
    cp -a bin/coolerdash "${srcdir}/bin/coolerdash"

    # Copy all required files for packaging to ${srcdir}
    cp -a README.md "${srcdir}/README.md"
    cp -a CHANGELOG.md "${srcdir}/CHANGELOG.md"
    cp -a VERSION "${srcdir}/VERSION"
    cp -a LICENSE "${srcdir}/LICENSE"
    cp -a etc/coolerdash/config.ini "${srcdir}/config.ini"
    mkdir -p "${srcdir}/images"
    cp -a images/shutdown.png "${srcdir}/images/shutdown.png"
    mkdir -p "${srcdir}/systemd"
    cp -a etc/systemd/coolerdash.service "${srcdir}/systemd/coolerdash.service"
    mkdir -p "${srcdir}/man"
    cp -a man/coolerdash.1 "${srcdir}/man/coolerdash.1"
    #mkdir -p "${srcdir}/plugins/coolercontrol"
    #cp -a etc/coolercontrol/plugins/coolerdash/manifest.toml "${srcdir}/plugins/coolercontrol/manifest.toml"
}

check() {
    # Check in the checked-out repository
    cd "${srcdir}/coolerdash" || return 1

    if [[ -f bin/coolerdash ]]; then
        echo "Build successful - binary created"
    else
        echo "ERROR: Binary not found"
        return 1
    fi
}

package() {
    # Create necessary directories and install files
    install -dm755 "${pkgdir}/opt/coolerdash"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/opt/coolerdash/README.md"
    install -Dm644 "${srcdir}/VERSION" "${pkgdir}/opt/coolerdash/VERSION"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/coolerdash/LICENSE"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/opt/coolerdash/CHANGELOG.md"
    install -Dm644 "${srcdir}/config.ini" "${pkgdir}/etc/coolerdash/config.ini"
    install -dm755 "${pkgdir}/opt/coolerdash/bin"
    install -Dm755 "${srcdir}/bin/coolerdash" "${pkgdir}/opt/coolerdash/bin/coolerdash"
    install -dm755 "${pkgdir}/opt/coolerdash/images"
    install -Dm644 "${srcdir}/images/shutdown.png" "${pkgdir}/opt/coolerdash/images/shutdown.png"
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/coolerdash/bin/coolerdash "${pkgdir}/usr/bin/coolerdash"
    install -Dm644 "${srcdir}/systemd/coolerdash.service" "${pkgdir}/etc/systemd/system/coolerdash.service"
    #install -Dm644 "${srcdir}/plugins/coolercontrol/manifest.toml" "${pkgdir}/etc/coolercontrol/plugins/coolerdash/manifest.toml"
    install -Dm644 "${srcdir}/man/coolerdash.1" "${pkgdir}/usr/share/man/man1/coolerdash.1"
}
