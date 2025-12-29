# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Aaron Rubesh <contact@aaronrubesh.io>
pkgname=antigravity-bin
pkgver=1.13.3
_electronversion=37
pkgrel=1
pkgdesc="An agentic development platform from Google, evolving the IDE into the agent-first era.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url='https://antigravity.google/'
_dlurl="https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian"
license=('LicenseRef-Google-Antigravity')
depends=(
    "electron${_electronversion}"
    'libxkbfile'
    'python-fonttools'
    'perl'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://antigravity.google/terms"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${pkgname%-bin}_${pkgver}-1766182168_arm64_940bc88042cadeaee51d9b1eedf6a506.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${pkgname%-bin}_${pkgver}-1766182170_amd64_365061c50063f9bd47a9ff88432261b8.deb")
sha256sums=('d87597d52234cb741574f0e68bd1f951a4cb680b9c621209b352b9078eb7689d'
            '19a6316e7e32c598a99022d66f61b7e822cbc8b03f0fab1176a10bc00b1e59fa'
            'e0ab2fe87491fabd9c7886f22c6929169edb508be832036a02698760b721f207')
sha256sums_aarch64=('9d4d5a0f4dc39514a8841e726bf032e19f8baf42310ed11531cd95d43922c14e')
sha256sums_x86_64=('d9920f9e0788245b1dab0f73a607b4eea00605bfb70e16795da1c1ac89eabd4b')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i -e "
        s/\/usr\/share\/${pkgname%-bin}\///g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    fi
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/vendor-completions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/vendor-completions"
    fi
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
