# Maintainer: taotieren <admin@taotieren.com>

pkgname=asciidoctor-web-pdf
_tagname=1.0.1
pkgver=${_tagname//-/_}
pkgrel=1
pkgdesc="A PDF converter for AsciiDoc based on web technologies. It allows complex layouts to be defined with CSS and JavaScript, while writing the content in AsciiDoc."
arch=('any')
url="https://github.com/Mogztter/asciidoctor-web-pdf"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    cairo
    dbus
    expat
    glib2
    libcups
    libgcc_s.so
    libstdc++.so
    libx11
    libxcb
    libxext
    nodejs
    nspr
    nss
)
makedepends=(
    npm
    poppler
    ghostscript
)
backup=()
options=()
install=
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/v${_tagname}.tar.gz")
sha256sums=('e9568bdfd9c140c642a6b2496aa26ee105fe8385bb24db5eaec5214ef01af8bc')
# noextract=("${pkgname}-${_tagname}.tar.gz")

package() {
    export PUPPETEER_SKIP_DOWNLOAD=true
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_tagname}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    install -Dm0644 "${srcdir}/${pkgname}-${_tagname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
