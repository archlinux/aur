# Maintainer: Topik topik@topik.tech
pkgname=icu69-bin
pkgver=69.1
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
provides=('icu69')
conflicts=('icu69')
depends=('bash')
source=("https://github.com/unicode-org/icu/releases/download/release-69-1/icu4c-69_1-Fedora32-x64.tgz")
sha512sums=('21bb612c707fce3017a62f44848fa3d69bf4e7061dcb64df57a713443c766ed6370cec0e6202ea4543ae2702a8fff1402d02a652ab32a3a0388071ad41965169')

package() {
    tar xf icu4c-69_1-Fedora32-x64.tgz
    # Remove certain files if icu is installed to not cause conflicts
    rm -rf "${srcdir}"/icu/usr/local/lib/icu  "${srcdir}"/icu/usr/local/lib/pkgconfig
    for filename in "${srcdir}"/icu/usr/local/lib/*.so; do
		if [[ ! -e "$filename" ]]; then continue; fi
        if [[ -e "/usr/lib/${filename##*/}" ]]; then
            rm -rf "${filename}"
        fi
    done
    mkdir -p "${pkgdir}"/usr/{share,lib}
    mkdir -p "${pkgdir}"/usr/share/licenses/icu69
    cp -rn "${srcdir}"/icu/usr/local/lib/* -t "${pkgdir}"/usr/lib/
    install -Dm644 "${srcdir}"/icu/usr/local/share/icu/69.1/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
