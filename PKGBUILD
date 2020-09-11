# Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
pkgver=1.49.0
pkgrel=1
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('code')
conflicts=('code' 'vscode')

sha256sums_x86_64=('855f6f841edee01aa2f02966a0fdbbd54a57c43b61d09eeb94ed279a5ed51269')
sha256sums_aarch64=('525842130f4c98643947c8770f9399ffe6a9b04e38bda6f66853bde48f5f8c5b')
sha256sums_armv7h=('440a1f062e91106208739668aa385ce30beffa765dd899a432f84488ddc571bb')

source=(vscodium-bin.desktop)
sha256sums=('5504e93bd55f2bc068c29e4fa962c1eddc6e08edb39c3255319dd5ad998a1b86')
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x64.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-x64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-arm64.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-arm64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-${pkgrel}-arm.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-arm-${pkgver}.tar.gz")

case ${CARCH} in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
    armv7h) _arch=arm ;;
    *) _arch=unknown ;;
esac

noextract=("${pkgname}-${pkgver}-${pkgrel}-${_arch}.tar.gz")

prepare() {
    mkdir -p ${srcdir}/${pkgname}
    tar -xf ${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${_arch}.tar.gz -C ${srcdir}/${pkgname}
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/code
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
    install -D -m644 vscodium-bin.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/${pkgname}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
