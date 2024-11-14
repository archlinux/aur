# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>

pkgbase='luanti-modern'

pkgname=('luanti-modern-client' 'luanti-modern-server' 'luanti-modern-common' 'luanti-modern-documentation')
conflicts=('minetest>5.9' 'minetest-server>5.9' 'minetest-common>5.9')
conflicts+=('luanti' 'luanti-client' 'luanti-server' 'luanti-common')

pkgver=5.10.0
pkgrel=1
arch=('x86_64')

url='https://luanti.org/'
license=('LGPL')

pkgdesc='Luanti (formerly “Minetest”) as split-package build for server and client and common data and documentation, using a more modern and strict approach and explicitly trying to only use the new name only.'


# This compiles the Luanti client with SDL2 support to run as native Wayland
# client. Change to 0 if you encounter any issues. When set to 0, the client
# runs without SDL2 support as an Xwayland client.
#
# You can also set this to 0 if you’re not using Wayland, without any real
# effect on how the Luanti client runs.
_use_sdl2=1


makedepends=(
    'cmake'
    'curl'
    'freetype2'
    'git'
    'hicolor-icon-theme'
    'hiredis'
    'leveldb'
    'libgl'
    'libjpeg-turbo'
    'libvorbis'
    'libxi'
    'luajit'
    'ninja'
    'openal'
    'postgresql'
    'spatialindex'
    'sqlite'
)


source=(
    "https://github.com/minetest/minetest/archive/refs/tags/${pkgver}.tar.gz"
    'tmpfiles.d'
    'sysusers.d'
    'luanti.service'
)


sha256sums=(
    '2a3161c04e7389608006f01280eda30507f8bacfa1d6b64c2af1b820a62d2677'
    'c9a0c78a49461f56381e5615045d036cd594b741c910129eccf43e475c40cca1'
    '542811f61dd5798daffb94bda28620a34bde3d4a71b32f72ac596cb6386e2650'
    'f4f8fe4221f5d1443d75dcf5d52dfef6786731e20184f7ee8bda7d38c43f95d5'
)


pre_install() {
    echo 'Make sure to read the pinned AUR comment before installing the package!'
}


prepare() {
    install -d build_luanti-modern-{client,server}
    mv minetest-${pkgver} luanti-${pkgver} # The extracted package is still named `minetest-...`
}


build() {
    cd build_luanti-modern-client
    cmake -G Ninja ../luanti-${pkgver} \
        -DBUILD_DOCUMENTATION=0 \
        -DBUILD_UNITTESTS=0 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_DATADIR=share \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDEVELOPMENT_BUILD=0 \
        -DENABLE_CURSES=0 \
        -DENABLE_UPDATE_CHECKER=0 \
        -DINSTALL_DEVTEST=0 \
        -DPROJECT_NAME=luanti \
        -DUSE_SDL2=${_use_sdl2} \
        -DVERSION_EXTRA=$( [ "${_use_sdl2}" -eq 1 ] && echo 'sdl2' )
    ninja

    cd ../build_luanti-modern-server
    cmake -G Ninja ../luanti-${pkgver} \
        -DBUILD_CLIENT=0 \
        -DBUILD_DOCUMENTATION=0 \
        -DBUILD_SERVER=1 \
        -DBUILD_UNITTESTS=0 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_DATADIR=share \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDEVELOPMENT_BUILD=0 \
        -DENABLE_CURSES=0 \
        -DENABLE_UPDATE_CHECKER=0 \
        -DINSTALL_DEVTEST=0 \
        -DPROJECT_NAME=luanti
    ninja
}


package_luanti-modern-client() {
    pkgdesc='Luanti voxel game engine client'
    depends=(
        'curl'
        'desktop-file-utils'
        'freetype2'
        'hicolor-icon-theme'
        'jsoncpp'
        'libgl'
        'libjpeg-turbo'
        'libvorbis'
        'libxi'
        'luajit'
        'luanti-common'
        'openal'
        'postgresql-libs'
        'spatialindex'
        'sqlite'
        'xdg-utils'
    )

    # Build Luanti client
    cd build_luanti-modern-client
    DESTDIR="${pkgdir}" ninja install
    install -Dm644 ${srcdir}/luanti-${pkgver}/misc/net.minetest.minetest.desktop "${pkgdir}/usr/share/applications/net.luanti.luanti.desktop"

    # Remove unwanted files
    rm "${pkgdir}/usr/share/applications/net.minetest.minetest.desktop"
    rm "${pkgdir}"/usr/bin/minetest
    rm -rf "${pkgdir}"/usr/share/{luanti,doc,man}

    # Fix metainfo
    _metainfo="${pkgdir}/usr/share/metainfo/net.luanti.luanti.metainfo.xml"
    install -Dm644 ${srcdir}/luanti-${pkgver}/misc/net.minetest.minetest.metainfo.xml "${_metainfo}"
    sed -i "s/net.minetest.minetest/net.luanti.luanti/g" "${_metainfo}"
    rm "${pkgdir}/usr/share/metainfo/net.minetest.minetest.metainfo.xml"
}


package_luanti-modern-server() {
    pkgdesc='Server for the Luanti voxel game engine'
    depends=(
        'curl'
        'hiredis'
        'jsoncpp'
        'leveldb'
        'luajit'
        'luanti-common'
        'postgresql-libs'
        'spatialindex'
        'sqlite'
    )

    # Build Luanti server
    cd build_luanti-modern-server
    DESTDIR="${pkgdir}" ninja install

    # Server files
    install -d "${pkgdir}/etc/luanti"
    install -Dm644 "../luanti.service" "${pkgdir}/usr/lib/systemd/system/luanti@.service"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/luanti-server.conf"
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/luanti-server.conf"

    # Remove unwanted files
    rm -rf "${pkgdir}/usr/share/"
    rm "${pkgdir}"/usr/bin/minetestserver
}


package_luanti-modern-common() {
    pkgdesc='Common files for the Luanti client and server'
    license=('custom')

    # Shared files/directories
    cd luanti-${pkgver}
    install -d "${pkgdir}"/usr/share/luanti
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/luanti/LICENSE.txt"
    cp -r games builtin client fonts textures "${pkgdir}"/usr/share/luanti/
    cp -r "${srcdir}/build_luanti-client/locale" "${pkgdir}/usr/share/luanti/"
}


package_luanti-modern-documentation() {
    pkgdesc='(Mostly) Markdown documentation for the Luanti voxel game engine, including client and server manpages'
    license=('custom')

    cd ${srcdir}/luanti-${pkgver}

    # Documentation
    install -dm644 "${pkgdir}/usr/share/luanti/doc/developing/"
    install -Dm644 README.md "${pkgdir}/usr/share/luanti/doc/"
    install -Dm644 doc/*.{md,txt,png} "${pkgdir}/usr/share/luanti/doc/"
    install -Dm644 doc/developing/*.md "${pkgdir}/usr/share/luanti/doc/developing/"

    # Example configuration
    install -Dm644 minetest.conf.example "${pkgdir}/usr/share/luanti/doc/luanti.conf.example"

    # Manpages
    install -dm644 "${pkgdir}/usr/share/man/man6/"
    install -Dm644 doc/luanti{,server}.6 "${pkgdir}/usr/share/man/man6/"

    # Remove unwanted files
    rm "${pkgdir}/usr/share/luanti/doc/lua_api.txt"
    rm "${pkgdir}/usr/share/luanti/doc/lgpl-2.1.txt"
}
