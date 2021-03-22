# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=spotify-edge-snap
pkgver=1.1.55.494.gca75f788
_snapid=pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7
_revision=45
pkgrel=2
pkgdesc='A proprietary music streaming service'
arch=('x86_64')
conflicts=('spotify')
provides=('spotify')
license=('custom')
url='https://www.spotify.com'
depends=('gtk3' 'libsm' 'nss')
makedepends=('squashfs-tools')
source=('spotify.protocol'
        'LICENSE')
# Get latest version info: curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/spotify
source_x86_64=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_revision}.snap")
sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615')
sha512sums_x86_64=('5d61a2d5b26be651620ab5d18d3a204d8d7b09dcec8a733ddc176c44cb43e9176c4350933ebe4498b065ba219113f3226c13bea9659da738fe635f41d01db303')

prepare() {
    cd "${srcdir}"
    unsquashfs ${_snapid}_${_revision}.snap
}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/opt"
    cp -a squashfs-root/usr/share/spotify "${pkgdir}/opt"

    install -Dm644 "${pkgdir}"/opt/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    sed -i 's/\/usr\/share\/spotify\/icons\/spotify-linux-128.png/spotify/' "${pkgdir}"/usr/share/applications/spotify.desktop

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/opt/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Symlink spotify binary which is located in /opt
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/spotify/spotify "${pkgdir}/usr/bin/spotify"

    # Remove unneeded files
    rm -r "${pkgdir}/opt/spotify/apt-keys"
    rm -r "${pkgdir}/opt/spotify/icons"
    rm "${pkgdir}/opt/spotify/spotify.desktop"

    # Copy protocol file for KDE
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
