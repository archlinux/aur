# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation-git
_pkgname=tomato-radio-automation
pkgver=1060.2432278d
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
_buildver="r${pkgver}"

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short=8 HEAD)"
}

# Source below the exact same as tomato-radio-automation
prepare() {
    cd "${_repodir}/client"
    npm install
    cp "scripts/debian/tomato.desktop" "${srcdir}/${_pkgname}.desktop"
    sed "s/^\(\(Exec\|Icon\)=.*\)tomato/\1${_pkgname}/" scripts/debian/tomato.desktop > "${srcdir}/${_pkgname}.desktop"
}

build() {
    cd "${_repodir}/client"
    TOMATO_VERSION="${_buildver} (arch)" npm run package
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
