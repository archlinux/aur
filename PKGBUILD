# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=pokemon-revolution-online-bin
__PROCLIENT_VER=20250409
pkgver=20250409+asset0.5
pkgrel=1
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
options=('!strip')
arch=('x86_64')
url="https://pokemonrevolution.net"
license=('LicenseRef-Custom')
depends=(
  'bash'
  'cairo'
  'dbus'
  'gcc-libs'
  'glib2'
  'glibc'
  'libdecor'
  'opengl-driver'
  'pango'
  'vulkan-driver'
  'wayland')
makedepends=('git')
source=("git+https://gitlab.com/fabiscafe/pro_assets_lin_desktop.git#tag=0.5"
        "PROClient_linux-${__PROCLIENT_VER}.tar.gz::https://ddl.pokemonrevolution.net/PROClient_linux.tar.gz")
b2sums=('8d70ae01110e1b85e9206a7163d1d26414622940cd89d13d697b938d4087fa9b319c877fcbc424203a4767973194e58b38c311172909690bafe7015ec206b8ea'
        '0c8e308b97328da5f7638b4b0971f9f7b287c8fb86aa59d7694f9fd841c5ee17d3b97ddc82ac1e73f96999c154a894769ac97492b41525bfab12cf150b5bb607')

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
