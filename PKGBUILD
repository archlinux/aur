# Maintainer: Joomzie <tntecyu74 at mozmail dot com>
pkgname=bbhost-desktop-bin
_pkgname=bbhost
pkgver=0.2.22
pkgrel=2
pkgdesc="Definitive Bloodborne PC Experience"
arch=('x86_64')
url="https://github.com/droogie/bbhost"
license=('GPL3' 'Apache-2.0' 'MIT' 'custom')
depends=("vulkan-icd-loader" "curl" "zlib")
provides=('bbhost')
source=("https://github.com/droogie/bbhost/releases/download/v${pkgver}/bbhost-linux-v${pkgver}.tar.gz"
        "bbhost.png")
sha256sums=('0ac810c3924cc11a2333ee148efc8c9a45831221aad06847f513d0356b24df19'
            '67816f5b2a1ce724baa48a49cf55b5119bd5108bfae8ad4441fa3d48b133b16f')

prepare() {
    # Set up logging
    sed -i 's|mkdir -p logs|mkdir -p $HOME/.local/share/bbhost/data/logs|g' "${srcdir}/bbhost-linux-v${pkgver}/run-bbhost.sh"
    sed -i 's|log=logs/bbhost-$(date +%Y%m%d-%H%M%S).log|log=$HOME/.local/share/bbhost/data/logs/bbhost-$(date +%Y%m%d-%H%M%S).log|g' "${srcdir}/bbhost-linux-v${pkgver}/run-bbhost.sh"
    sed -i 's|ls -1t logs|ls -1t $HOME/.local/share/bbhost/data/logs|g' "${srcdir}/bbhost-linux-v${pkgver}/run-bbhost.sh"
    rmdir ${srcdir}/bbhost-linux-v${pkgver}/logs

    # Remove superfluous plugins directory, and other unneeded files
    # Plugins can be downloaded through the launcher, and are saved to $HOME/.config/bbhost
    rm -rf ${srcdir}/bbhost-linux-v${pkgver}/plugins
    rm ${srcdir}/bbhost-linux-v${pkgver}/bbhost.example.toml
    rm ${srcdir}/bbhost-linux-v${pkgver}/README-linux.txt
}

package() {
    # Install bbhost to /opt
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "bbhost-linux-v${pkgver}" "${pkgdir}/opt/${_pkgname}"

    # Set up license files
    install -d "$pkgdir"/usr/share/licenses/${_pkgname}
    ln -s /opt/${_pkgname}/LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/
    ln -s /opt/${_pkgname}/licenses/dxc "$pkgdir"/usr/share/licenses/${_pkgname}/

    # Install icon (Credit: aetherium. @ steamgriddb.com) and .desktop file
    install -Dm644 "bbhost.png" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Bloodborne
GenericName=${_pkgname}
Exec=/opt/bbhost/run-bbhost.sh
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Game;
EOF
}
