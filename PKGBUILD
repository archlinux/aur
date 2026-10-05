# Maintainer: Tobiichi-Origuchi <tobiichioriguchi@gmail.com>

pkgname=pixez-git
_pkgname=pixez
pkgver=0.9.109.r40.gb593440
pkgrel=1
pkgdesc="Pixiv third-party client written in Flutter"
arch=('x86_64')
url="https://github.com/Notsfsssf/pixez-flutter"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('git' 'fvm' 'cargo' 'clang' 'cmake' 'ninja' 'patchelf')
options=('!lto')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/Notsfsssf/pixez-flutter.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    find plugins -name ".fvmrc" -delete
    fvm install
    fvm flutter --disable-analytics
    fvm flutter --no-version-check pub get
    (cd plugins/rhttp/rhttp && fvm dart run build_runner build)
    fvm dart run build_runner build
}

build() {
    cd "${srcdir}/${_pkgname}"
    fvm flutter build linux --release --no-pub
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"

    cp -r "build/linux/x64/release/bundle/lib/" "${pkgdir}/opt/${_pkgname}/"
    cp -r "build/linux/x64/release/bundle/data/" "${pkgdir}/opt/${_pkgname}/"
    install -Dm755 "build/linux/x64/release/bundle/${_pkgname}" \
        "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    patchelf --set-rpath '$ORIGIN' "${pkgdir}/opt/${_pkgname}/lib"/*.so

    install -Dm644 "assets/images/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "linux/packaging/com.perol.pixez.desktop" \
        "${pkgdir}/usr/share/applications/com.perol.pixez.desktop"
}
