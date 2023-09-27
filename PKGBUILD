# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle
_pkgname=Monokle
pkgver=2.4.0
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
url="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=('libxext' 'libxfixes' 'dbus' 'expat' 'glibc' 'mesa' 'gtk3' 'libcups' 'libxcomposite' 'hicolor-icon-theme' 'bash' 'libxkbcommon' \
    'cairo' 'nss' 'alsa-lib' 'libxdamage' 'at-spi2-core' 'nspr' 'pango' 'libx11' 'gcc-libs' 'libdrm' 'libxcb' 'glib2' 'libxrandr' 'python')
makedepends=('npm' 'nodejs>=20' 'jq' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8c658a42d3a5ed69cacea6e361997387a9031d0b79adc0575dbe7dae4106424')
prepare() {
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    sed -e "291,297d" -e "271,277d" -e "258,264d" -e '/arm64/d' -e 's|"x64",|"x64"|g' -i package.json
    npm ci
    npm run electron:build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32 48 64 256;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/large-icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}