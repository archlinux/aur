# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

_nightly_version=$(curl -L -H "Accept: application/vnd.github+json" "https://api.github.com/repos/lf-lang/lingua-franca/releases/tags/nightly" 2>&1 | grep '"name":' | grep "Linux-x86" | cut -d'-' -f3-6)

pkgname=lf-cli-nightly-bin
pkgver=0.6.1+SNAPSHOT+nightly+20240201050246
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools (nightly release)"
arch=('x86_64' 'aarch64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
replaces=('lfc-bin')
conflicts=('lfc-bin' 'lf-cli-bin' 'lf-cli')
source=("https://github.com/lf-lang/lingua-franca/releases/download/nightly/lf-cli-${_nightly_version}-Linux-${CARCH}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/master/LICENSE")
sha512sums=('SKIP' 'SKIP')

pkgver() {
    echo "${_nightly_version}" | tr '-' '+'
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lfc-cli/LICENSE"

    cd "${srcdir}/lf-cli-${_nightly_version}-Linux-${CARCH}"

    for f in lib/*.jar; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/java/lf-cli/lib/$(basename "$f")"
    done
    install -Dm755 "bin/lfc" "${pkgdir}/usr/share/java/lf-cli/bin/lfc"
    install -Dm755 "bin/lfd" "${pkgdir}/usr/share/java/lf-cli/bin/lfd"
    install -Dm755 "bin/lff" "${pkgdir}/usr/share/java/lf-cli/bin/lff"

    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "../share/java/lf-cli/bin/lfc" lfc
    ln -s "../share/java/lf-cli/bin/lfd" lfd
    ln -s "../share/java/lf-cli/bin/lff" lff
}
