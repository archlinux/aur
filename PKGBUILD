# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation-git
_pkgname=tomato-radio-automation
pkgver=0.4.0.r69.gd0ab5336
pkgrel=1
pkgdesc='Tomato Radio Automation desktop client. Dead simple radio ads. Preview version.'
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
_repodir="${_pkgname}"

pkgver() {
  cd "${_pkgname}"
  git describe --exclude=preview-build --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

# Source below the exact same as tomato-radio-automation
prepare() {
    cd "${_repodir}/client"
    npm install
    cp "scripts/debian/tomato.desktop" "${srcdir}/${_pkgname}.desktop"
    sed "s/^\(Exec\|Icon\)=tomato/\1=${_pkgname}/" scripts/debian/tomato.desktop > "${srcdir}/${_pkgname}.desktop"
}

build() {
    cd "${_repodir}/client"
    TOMATO_VERSION="${pkgver} (arch)" npm run package
    mv -v "out/Tomato-linux-"* "out/${_pkgname}"
    chmod 0755 "out/${_pkgname}"
}

package() {
    install -dm755 "${pkgdir}/opt/"
    cp -r "${srcdir}/${_repodir}/client/out/${_pkgname}" "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_repodir}/client/assets/icons/tomato.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_repodir}/LICENSE" "${pkgdir}/usr/share/licenses/tomato-radio-automation/LICENSE"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/tomato" "${pkgdir}/usr/bin/${_pkgname}"
}
