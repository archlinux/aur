pkgname=jitsi-meet
# https://github.com/jitsi/jitsi-meet/releases/latest
pkgver=1.0.4289
_tag="jitsi-meet_4857"
pkgrel=1
pkgdesc="WebRTC JavaScript video conferences"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-meet"
license=("Apache")
makedepends=("git" "npm")
optdepends=("jicofo"
            "jitsi-videobridge"
            "nginx"
            "prosody")
backup=("opt/jitsi-meet/config.js"
        "opt/jitsi-meet/interface_config.js"
        "opt/jitsi-meet/logging_config.js")
options=("!strip")
source=($pkgname-$pkgver.tar.gz::https://github.com/jitsi/jitsi-meet/archive/stable/$_tag.tar.gz)
sha256sums=('f15f9060ddbc650724563d12bfc8f85c88d303ea823fbb402b462d11e23473cd')

build() {
    cd "${srcdir}/${pkgname}-stable-${_tag}"
    # this seems to break the package, even though it is the documented way of packaging
    #npm install -g --user root --prefix "$pkgdir/usr"
    npm install
    # fix as many vulns as possible, but seems to break the package as well
    #npm audit fix
    make
    # Hack https://github.com/jitsi/jitsi-meet/pull/6925
    for c in $(ls node_modules/i18n-iso-countries/langs); do
      cp node_modules/i18n-iso-countries/langs/${c} lang/countries-${c}
    done
    # Build the final source
    make source-package
    tar xvfj $pkgname.tar.bz2
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${pkgname}-stable-${_tag}/${pkgname}" "${pkgdir}/opt/jitsi-meet"

    # get rid of all local references
    find "${pkgdir}" -type f -execdir sed -i "s#$srcdir##g" "{}" \;

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
