# Maintainer: David Cooper <david@dtcooper.com>

pkgname=tomato-radio-automation-git
_pkgname=tomato-radio-automation
pkgver=0.12.10.next.6.6fe2b33b
pkgrel=1
pkgdesc='Tomato Radio Automation desktop client. Dead simple radio ads. Preview version.'
arch=('x86_64' 'aarch64')
url='https://dtcooper.github.io/tomato/'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('nodejs' 'npm' 'git')
options=('!debug')
source=(
    "${_pkgname}::git+https://github.com/dtcooper/tomato.git"
)
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")
_repodir="${_pkgname}"
_buildver="r${pkgver}"

_shortver() {
    local SHORTVER
    SHORTVER="$(git describe --exclude=preview-build --tags | sed 's/^v//' | sed 's/-g.*$//' | sed 's/-/-next./')"
    if echo "${SHORTVER}" | grep -qv -- -; then
        SHORTVER="${SHORTVER}-next.0"
    fi
    echo "${SHORTVER}"
}

_longver() {
    echo "$(_shortver)-$(git rev-parse --short=8 HEAD)"
}

pkgver() {
    cd "${_pkgname}"
    _longver | sed 's/-/./g'
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
    jq '.version = "'"$(_shortver)"'"' package.json > package.json.tmp
    mv -v package.json.tmp package.json
    TOMATO_VERSION="$(_longver) (arch)" npm run package
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
