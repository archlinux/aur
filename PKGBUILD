# Maintainer: pzl <alsoelp@gmail.com>

_pkgname=phallus-fonts
pkgname=${_pkgname}-git
pkgver=241.2581eb6
pkgrel=1
pkgdesc="Lemon and Uushi fonts by phallus"
arch=('any')
url="https://github.com/phallus/fonts"
license=('custom:WTFPL')
depends=()
makedepends=('git' 'fontconfig' 'xorg-font-util' 'xorg-bdftopcf')
install="${_pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
source=("${_pkgname}::git+https://github.com/phallus/fonts")
md5sums=('SKIP')
sha256sums=('SKIP')

_maps=(ISO8859-1 ISO8859-2 ISO8859-4 ISO8859-9 ISO8859-15)

prepare() {
    cd "$srcdir/${_pkgname}"
    sed -i '/^\(FONT\|CHARSET_REGISTRY\)/s/ISO8859/ISO10646/' *.bdf
    for f in *.bdf; do
        for m in "${_maps[@]}"; do
            ucs2any "$f" "/usr/share/fonts/util/map-$m" "$m"
        done
    done
}

build() {
    cd "$srcdir/${_pkgname}"
    for f in *.bdf; do
        bdftopcf -o "${f%.bdf}.pcf" "$f"
    done
}

pkgver() {
    cd "$srcdir/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


package() {
    cd "$srcdir/${_pkgname}"
    for f in *.pcf; do
        install -D -m644 "$f" "${pkgdir}/usr/share/fonts/misc/$f"
    done
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
