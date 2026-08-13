# Maintainer: Christian Kühn (damachin3 at proton dot me)
# Website: https://github.com/damachine/coolerdash
pkgname=coolerdash-git
pkgver=3.3.0.r0.g5b4415d
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
backup=('var/lib/coolercontrol/plugins/coolerdash/config.json')
install=coolerdash.install
_commit=5b4415dfc968126574082b6edf3318f071c93123
source=("coolerdash-git::git+https://github.com/damachine/coolerdash.git#commit=${_commit}")
sha256sums=('SKIP') # SKIP for git repo source builds

pkgver() {
    cd "${srcdir}"/"${pkgname}"
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

package() {
    # Binary to /usr/libexec, plugin data to /var/lib/coolercontrol/plugins/
    install -dm711 "${pkgdir}/var/lib/coolercontrol"
    install -dm755 "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash"
    install -Dm755 "${srcdir}/${pkgname}/bin/coolerdash" "${pkgdir}/usr/libexec/coolerdash/coolerdash"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../libexec/coolerdash/coolerdash "${pkgdir}/usr/bin/coolerdash"
    install -m644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/README.md"
    install -m644 "${srcdir}/${pkgname}/VERSION" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/VERSION"
    install -m644 "${srcdir}/${pkgname}/CHANGELOG.md" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/CHANGELOG.md"
    install -m600 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/config.json" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/config.json"

    install -dm755 "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui"
    install -m644 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/ui/index.html" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui/index.html"
    install -m644 "${srcdir}/${pkgname}/images/shutdown.png" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/shutdown.png"
    install -m644 "${srcdir}/${pkgname}/etc/coolercontrol/plugins/coolerdash/manifest.toml" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/manifest.toml"

    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/manifest.toml"
    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui/index.html"

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
