# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=jadx-bin
_pkgname=jadx
_pkgguiname=jadx-gui
pkgver=1.3.1
pkgrel=1
pkgdesc="Command line and GUI tools to produce Java source code from Android Dex and APK files"
arch=('any')
url="https://github.com/skylot/jadx"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip' 'gendesk')
provides=('jadx')
conflicts=('jadx')
source=(https://github.com/skylot/jadx/releases/download/v$pkgver/jadx-$pkgver.zip)
sha256sums=('0774347530fa5a008dcc10e3b55f03a72141dd34ffd7e5addee18db06d0a151f')

prepare() {
    gendesk -f -n \
                --name "${_pkgguiname}" \
                --pkgname "${_pkgguiname}" \
                --pkgdesc "${pkgdesc}" \
		--exec "/usr/share/java/${_pkgname}/bin/jadx-gui" \
                --categories="Development"
}

package() {
    cd "${srcdir}"
    install -Dm 755 bin/{jadx,jadx-gui} -t "${pkgdir}/usr/share/java/${_pkgname}/bin"
    install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${_pkgname}/lib"
    unzip -p "$srcdir/lib/jadx-gui-$pkgver.jar" \
             "logos/jadx-logo.png" > "$pkgname.png"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgguiname.png"

    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/java/${_pkgname}/bin/jadx "${pkgdir}/usr/bin/jadx"
    ln -s /usr/share/java/${_pkgname}/bin/jadx-gui "${pkgdir}/usr/bin/jadx-gui"

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 NOTICE README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 "${_pkgguiname}.desktop" "${pkgdir}/usr/share/applications/${_pkgguiname}.desktop"
}
