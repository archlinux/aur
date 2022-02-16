# Maintainer: Reza Jahanbakhshi <reza dot jahanbakhshi at gmail dot com>

pkgname=candle2-git
pkgdesc="GRBL and GRBL-Advanced controller application with G-Code visualizer written in Qt - git version"
pkgver=V2.3.r4.b6364d3.24.d41d8cd98f00b204e9800998ecf8427e
pkgrel=1
arch=(x86_64 aarch64)
url="https://github.com/Schildkroet/Candle2.git"
license=('GPL3')
groups=()
depends=('qt5-serialport' 'qt5-base' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
replaces=()
backup=()
options=()
install=
source=(
    "${pkgname%-git}"::'git+https://github.com/Schildkroet/Candle2.git'
    "${pkgname%-git}.desktop"
)
noextract=()
md5sums=('SKIP'
         '060580e207a2230c5182badf908d0bf9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    local _patchver
    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        _patchver="${_patchver}$(md5sum ${srcdir}/${_patchfile} | cut -c1-32)"
    done
    _patchver="$(echo -n $_patchver | md5sum | cut -c1-32)"

    echo $(git describe --tags --match 'V*' | sed 's/\([^-]*-\)g/r\1/;s/-/./g').$(git rev-list --count HEAD).${_patchver}
}

prepare() {
    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        echo "Applying patch $_patchfile..."
        patch --directory="$srcdir/${pkgname%-git}" --forward --strip=1 --input="${srcdir}/${_patchfile}"
    done
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	qmake candle2.pro
	make
}

package() {
    install -m644 ../"${pkgname%-git}.desktop" -Dt "$pkgdir"/usr/share/applications
	cd "$srcdir/${pkgname%-git}"
    install -m644 src/images/icon.svg -D "$pkgdir"/usr/share/icons/hicolor/scalable/apps/candle2.svg
    install -m755 src/Candle2 -Dt "$pkgdir"/usr/bin
}

