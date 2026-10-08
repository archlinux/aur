# Maintainer: pandasato <sato.du@gmail.com>
pkgname=panda-iptv-bin
_pkgname=panda-iptv
pkgver=0.1.5
pkgrel=1
pkgdesc="Oriental Brutalist IPTV Player for Linux Desktop (MPV Accelerated)"
arch=('x86_64')
url="https://github.com/satodu/panda-iptv"
license=('MIT')
depends=('mpv' 'gtk3' 'glibc')
provides=('panda-iptv')
conflicts=('panda-iptv')
options=('!strip')
source=("https://github.com/satodu/panda-iptv/releases/download/v${pkgver}/panda-iptv-${pkgver}-linux-x64.tar.gz"
        "panda-iptv.desktop"
        "LICENSE")
sha256sums=('958f7d04e2b8eaa2dc3898f15207097fafe5337efb70e943a630ec9dffc6e62f'
            '267391f6971858e7235a5a30950e5d01f7abe0f1473cebd24545a149ab0788ad'
            'b3276f476122afd3ca641617539d6c95a3e4cb5cc8f943829343f075cbcf8470')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/bundle/." "${pkgdir}/opt/${_pkgname}/"

    # Compatibilidade com Arch Linux: linka libmpv.so.1 para a biblioteca mpv nativa do sistema
    ln -sf /usr/lib/libmpv.so "${pkgdir}/opt/${_pkgname}/lib/libmpv.so.1"

    # Script wrapper para configurar LD_LIBRARY_PATH e iniciar o aplicativo sem erros de biblioteca
    install -d "${pkgdir}/usr/bin"
    cat << 'WRAPPER' > "${pkgdir}/usr/bin/panda-iptv"
#!/usr/bin/env bash
export LD_LIBRARY_PATH="/opt/panda-iptv/lib:${LD_LIBRARY_PATH}"
exec /opt/panda-iptv/panda_iptv "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/panda-iptv"
    ln -s "/usr/bin/panda-iptv" "${pkgdir}/usr/bin/panda_iptv"

    install -Dm644 "${srcdir}/panda-iptv.desktop" "${pkgdir}/usr/share/applications/panda-iptv.desktop"
    install -Dm644 "${srcdir}/bundle/data/flutter_assets/assets/images/logo.png" "${pkgdir}/usr/share/pixmaps/panda_iptv.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
