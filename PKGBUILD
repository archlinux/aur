# Maintainer: Jon Stelly < 967068+jonstelly at users.noreply.github.com >
pkgname=icu66-bin
pkgver=66.1
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
provides=('icu66')
conflicts=('icu66')
depends=('bash')
source=("https://github.com/unicode-org/icu/releases/download/release-66-1/icu4c-66_1-Fedora31-x64.tgz")
sha512sums=('9c906f915aa7533c39d3be44fda1812c8639f404cf51d3edf45f7820ea8160711d751958577d8062b79a7e0033ed19dc0b96016fb8f4d79f266aa1a9c3c80816')

package() {
    tar xf icu4c-66_1-Fedora31-x64.tgz
    # Remove certain files if icu is installed to not cause conflicts
    rm -rf "${srcdir}"/icu/usr/local/lib/icu "${srcdir}"/icu/usr/local/lib/pkgconfig
    for filename in "${srcdir}"/icu/usr/local/lib/*.so; do
        if [[ ! -e "$filename" ]]; then continue; fi
        if [[ -e "/usr/lib/${filename##*/}" ]]; then
            rm -rf "${filename}"
        fi
    done
    mkdir -p "${pkgdir}"/usr/{share,lib}
    mkdir -p "${pkgdir}"/usr/share/licenses/icu66
    cp -rn "${srcdir}"/icu/usr/local/lib/* -t "${pkgdir}"/usr/lib/
    install -Dm644 "${srcdir}"/icu/usr/local/share/icu/66.1/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
