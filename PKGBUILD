# Maintainer: taotieren <admin@taotieren.com>

pkgname=asciidoctor-web-pdf-git
pkgver=v1.0.0.alpha.12.r100.ga5421d1
pkgrel=1
pkgdesc="A PDF converter for AsciiDoc based on web technologies. It allows complex layouts to be defined with CSS and JavaScript, while writing the content in AsciiDoc."
arch=('any')
url="https://github.com/Mogztter/asciidoctor-web-pdf"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname%-git} asciidoctor-pdf)
#replaces=(${pkgname})
depends=('npm' 'poppler' 'ghostscript')
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
#noextract=("${pkgname}-${_pkgver}.tar.gz")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname%-git}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
