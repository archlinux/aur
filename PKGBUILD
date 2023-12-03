# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation-git
_pkgname=tomato-radio-automation
pkgver=0.4.0.r46.g2a5bf62f
pkgrel=1
pkgdesc='Tomato Radio Automation. Dead simple radio ads. Latest git (preview) version.'
arch=('x86_64' 'aarch64')
url='https://dtcooper.github.io/tomato/'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('nodejs' 'npm' 'git')
source=(
    "${_pkgname}::git+https://github.com/dtcooper/tomato.git"
)
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")
_clientdir="${_pkgname}/client"

pkgver() {
  cd "${_pkgname}"
  git describe --exclude=preview-build --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

# Source below the exact same as tomato-radio-automation
prepare() {
    cd "${_clientdir}"
    npm install
    cp "scripts/debian/tomato.desktop" "${srcdir}/${_pkgname}.desktop"
    sed "s/^\(Exec\|Icon\)=tomato/\1=${_pkgname}/" scripts/debian/tomato.desktop > "${srcdir}/${_pkgname}.desktop"
}

build() {
    cd "${_clientdir}"
    TOMATO_VERSION="${pkgver} (arch)" npm run package
    mv -v "out/Tomato-linux-"* "out/${_pkgname}"
    chmod 0755 "out/${_pkgname}"
}

package() {
    install -dm755 "${pkgdir}/opt/"
    cp -r "${srcdir}/${_clientdir}/out/${_pkgname}" "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_clientdir}/assets/icons/tomato.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/tomato" "${pkgdir}/usr/bin/${_pkgname}"
}
