# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=pokemon-revolution-online-bin
pkgver=20230201+asset0.5
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="https://pokemonrevolution.net"
license=('custom')
depends=('vulkan-driver' 'opengl-driver')
makedepends=('git')
optdepends=('gtk2: required for the Unity ScreenSelector plugin')
conflicts=('pokemon-revolution-online')
options=(debug)
__PROCLIENT_VER=20230201
__LIN_DESKTOP_ASSET_COMMIT=da21f5467ed5b29d59cc67df3ccdc7686d763406  #tag 0.5
source=("git+https://gitlab.com/fabiscafe/pro_assets_lin_desktop.git#commit=${__LIN_DESKTOP_ASSET_COMMIT}"
        "PROClient_linux-${__PROCLIENT_VER}.tar.gz::https://ddl.pokemonrevolution.net/PROClient_linux.tar.gz"
)
sha512sums=('SKIP'
            'f5a3004ffd89a199b070fc1b98d9c017950e076d88f05dfaf95e22b9ee12d32812d4eb58224a47fe51ce9c4ce79049038fb19728fe81eaf49164dc7b83096c9e')

pkgver() {
    cd pro_assets_lin_desktop
    printf "${__PROCLIENT_VER}+asset$(git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g')"
}

package() {
    cd "PROClient"
    # As of wishes from the license, don't touch the original, extracted files.
    # Instead copy the structure and files 1:1 with better permissions.
    # Everything outside of /opt/PROClient is provided by
    # https://gitlab.com/fabiscafe/pro_assets_lin_desktop.git

    # Folderstructure
    /usr/bin/find . \
        -type d \
        -exec \
        /usr/bin/install -dm755 "${pkgdir}/opt/PROClient/{}" \;

    # Gamedata and binaries
    /usr/bin/find . \
        -type f \
        ! -name "PROClient.x86_64" \
        -exec \
        /usr/bin/install -m644 "{}" "${pkgdir}/opt/PROClient/{}" \;

    /usr/bin/install -m755 "${srcdir}/PROClient/PROClient.x86_64" "${pkgdir}/opt/PROClient/PROClient.x86_64"

    # Integration (by pro_assets_lin_desktop.git)
    /usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/net.pokemonrevolution.PROClient.svg" \
        "${pkgdir}/usr/share/pixmaps/net.pokemonrevolution.PROClient.svg"

    /usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/net.pokemonrevolution.PROClient-symbolic.svg" \
        "${pkgdir}/usr/share/pixmaps/net.pokemonrevolution.PROClient-symbolic.svg"

    /usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/net.pokemonrevolution.PROClient.desktop" \
        "${pkgdir}/usr/share/applications/net.pokemonrevolution.PROClient.desktop"

    /usr/bin/install -D -m755 "${srcdir}/pro_assets_lin_desktop/PROClient" \
        "${pkgdir}/usr/bin/PROClient"

    /usr/bin/install -D -m644 "${srcdir}/pro_assets_lin_desktop/pkg_copyright" \
        "${pkgdir}/usr/share/licenses/pokemon-revolution-online-bin/copyright"
}
