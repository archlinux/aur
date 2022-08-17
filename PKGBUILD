# Maintainer: syntheit <daniel@matv.io>
pkgname=icu67-bin
pkgver=67.1
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
provides=('icu67')
conflicts=('icu67')
depends=('bash')
source=("https://github.com/unicode-org/icu/releases/download/release-67-1/icu4c-67_1-Fedora31-x64.tgz")
sha512sums=('a60a1ecd6c942d69181442559d32afdf44b852490dbf3833e5b9dcd340754a26edaafbe08432a86ff9ff6372e4b14e631471178d48d4108b9e90be0564564ade')

package() {
    tar xf icu4c-67_1-Fedora31-x64.tgz
    # Remove certain files if icu is installed to not cause conflicts
    rm -rf "${srcdir}"/icu/usr/local/lib/icu  "${srcdir}"/icu/usr/local/lib/pkgconfig
    for filename in "${srcdir}"/icu/usr/local/lib/*.so; do
		if [[ ! -e "$filename" ]]; then continue; fi
        if [[ -e "/usr/lib/${filename##*/}" ]]; then
            rm -rf "${filename}"
        fi
    done
    mkdir -p "${pkgdir}"/usr/{share,lib}
    mkdir -p "${pkgdir}"/usr/share/licenses/icu67
    cp -rn "${srcdir}"/icu/usr/local/lib/* -t "${pkgdir}"/usr/lib/
    install -Dm644 "${srcdir}"/icu/usr/local/share/icu/67.1/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
