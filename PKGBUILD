# Maintainer: Christian Kühn (damachin3 at proton dot me)
_pkgbase=coolerdash
pkgname=${_pkgbase}-git
pkgver=3.3.3.r0.g8d37a8b
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Plug-in for CoolerControl that extends the LCD functionality with additional features"
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrold' 'curl' 'fontconfig' 'gdk-pixbuf2' 'glibc' 'jansson' 'ttf-roboto')
makedepends=('git')
backup=('var/lib/coolercontrol/plugins/coolerdash/config.json')
install=coolerdash.install
_commit=8d37a8b5d2f1550a1f174176a8e8b5bcf1c632c9
source=("${_pkgbase}::git+https://github.com/damachine/${_pkgbase}.git#commit=${_commit}")
sha256sums=('SKIP') # SKIP for git repo source builds

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    git describe --tags --long --match "v*" | sed -E 's/^v//; s/-([0-9]+)-g/\.r\1.g/; s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbase}"

    rm -f "${pkgname}"-*.pkg.tar.*

    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean
    fi

    # Build
    make
}

package() {
    install -dm711 "${pkgdir}/var/lib/coolercontrol"
    install -dm755 "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash"
    install -Dm755 "${srcdir}/${_pkgbase}/bin/coolerdash" "${pkgdir}/usr/libexec/coolerdash/coolerdash"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../libexec/coolerdash/coolerdash "${pkgdir}/usr/bin/coolerdash"
    install -m644 "${srcdir}/${_pkgbase}/README.md" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/README.md"
    install -m644 "${srcdir}/${_pkgbase}/VERSION" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/VERSION"
    install -m644 "${srcdir}/${_pkgbase}/CHANGELOG.md" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/CHANGELOG.md"
    install -m600 "${srcdir}/${_pkgbase}/etc/coolercontrol/plugins/coolerdash/config.json" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/config.json"

    install -dm755 "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui"
    install -m644 "${srcdir}/${_pkgbase}/etc/coolercontrol/plugins/coolerdash/ui/index.html" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui/index.html"
    install -m644 "${srcdir}/${_pkgbase}/images/shutdown.png" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/shutdown.png"
    install -m644 "${srcdir}/${_pkgbase}/etc/coolercontrol/plugins/coolerdash/manifest.toml" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/manifest.toml"

    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/manifest.toml"
    sed -i "s/{{VERSION}}/${pkgver}/g" "${pkgdir}/var/lib/coolercontrol/plugins/coolerdash/ui/index.html"

    install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
