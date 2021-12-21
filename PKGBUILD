# Maintainer: Topik topik@topik.tech
pkgname=icu68-bin
pkgver=68.2
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
provides=('icu68')
conflicts=('icu68')
depends=('bash')
source=("https://github.com/unicode-org/icu/releases/download/release-68-2/icu4c-68_2-Fedora32-x64.tgz")
sha512sums=('cbd895a282ba666720200dfb39ebfeda8b29ededf11f03d2bce362247e248a9fad4d0971fed88cfbf77f9235065c97372e58a3aa741a38267fc7a200e5082624')

package() {
    tar xf icu4c-68_2-Fedora32-x64.tgz
    # Remove certain files if icu is installed to not cause conflicts
    rm -rf "${srcdir}"/icu/usr/local/lib/icu  "${srcdir}"/icu/usr/local/lib/pkgconfig
    for filename in "${srcdir}"/icu/usr/local/lib/*.so; do
		if [[ ! -e "$filename" ]]; then continue; fi
        if [[ -e "/usr/lib/${filename##*/}" ]]; then
            rm -rf "${filename}"
        fi
    done
    mkdir -p "${pkgdir}"/usr/{share,lib}
    mkdir -p "${pkgdir}"/usr/share/licenses/icu68
    cp -rn "${srcdir}"/icu/usr/local/lib/* -t "${pkgdir}"/usr/lib/
    install -Dm644 "${srcdir}"/icu/usr/local/share/icu/68.2/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
