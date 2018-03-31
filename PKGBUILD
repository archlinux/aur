# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-stable
pkgver=1.0.72.117
_commit=g6bd7cc73
_ver_x86_64=35
_ver_i686=35
pkgrel=3
pkgdesc='A proprietary music streaming service'
arch=('x86_64' 'i686')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gconf' 'gtk2' 'glib2' 'nss' 'libsystemd' 'libxtst'
         'libx11' 'libxss' 'libcurl-compat' 'desktop-file-utils' 'rtmpdump'
         'openssl-1.0')
# TODO (reminder) switch to libcurl-gnutls starting of version 1.0.77
#depends_x86_64=('libcurl-gnutls')
#depends_i686=('libcurl-compat')
optdepends=('ffmpeg-compat-54: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip' '!upx')
provides=('spotify')
conflicts=('spotify')

# http://repository.spotify.com/dists/stable/Release
# http://repository.spotify.com/dists/stable/non-free/binary-amd64/Packages
# http://repository.spotify.com/dists/stable/non-free/binary-i386/Packages
# http://repository.spotify.com/dists/stable/Release.gpg
source=('spotify.sh'
        'spotify.protocol'
        'LICENSE'
        "${pkgname}-${pkgver}-Release::http://repository.spotify.com/dists/stable/Release"
        "${pkgname}-${pkgver}-Release.sig::http://repository.spotify.com/dists/stable/Release.gpg")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}-${_ver_x86_64}_amd64.deb"
               "${pkgname}-${pkgver}-x86_64-Packages::http://repository.spotify.com/dists/stable/non-free/binary-amd64/Packages")
source_i686=("${pkgname}-${pkgver}-i686.deb::https://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}-${_ver_i686}_i386.deb"
             "${pkgname}-${pkgver}-i686-Packages::http://repository.spotify.com/dists/stable/non-free/binary-i386/Packages")
sha512sums=('73124cb25e831534c94232ad607d6cf7716c6fb5e0cbb7ad4cd0976a45f6fa9efdc50c58109cd9594021476c9879d6b1a90cdb4ecbb03d5ad89ae52c82fc473a'
            '999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            'c6b5b8a8335c0349f38b230e053f28d09805f495458f61140c5f90767a706827a5c63f85b40463f82c6ba88918ded96c3e7cc113bd2592f6b9b7e834d847ae1b'
            '938dc215486bb3b6ee0d3f4f507ed0d5e735a55d7a9de71d3a8fdbdf681736267916bed8f59899d8310bb5b83bb4b97dae2e820c09aa0348d1af5a18f6ed641c')
sha512sums_x86_64=('fd33a5cd86edd4bf759849669516ffce35d89a77c6fcfb3ed0eb0ecb69024de5011499f36e48b8d37a873eb47da89eb21d9b9c7d280c498830a9fb1f8785db60'
                   '7f9d53edf98d8de9f27d23d43b31dc0dd1ad0c95c5f49c80906263ecc01e913afa534d204d863804bfe9259f3f38a24d6a76b865f2ac0df9f77e408da94a1484')
sha512sums_i686=('51d60f7592e5f31ea4b7e67736a85271cb48d4108459630da61c4ab67d2a470038240c1d6ff577280cb4498cf44f14d7bc7e0312f63d34265bcd1e70cd13142f'
                 '3caefe9060e737de2d91f52e7622bd7a8c4f4e9149d14eb7834e988425999a4dff2d13c4b8d2c9854105dc304f5baa49045aeaf01908826536edb09036aae8d3')
validpgpkeys=('0DF731E45CE24F27EEEB1450EFDC8610341D9410') # Spotify <tux@spotify.com>

# Spotify uses different names for the arch
if [ "${CARCH}" = "i686" ]; then
    _SPOTIFY_ARCH=i386
else
    _SPOTIFY_ARCH=amd64
fi

prepare() {
    # Validate hashes from the PGP signed "Release" file
    echo "$(grep non-free/binary-${_SPOTIFY_ARCH}/Packages ${pkgname}-${pkgver}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${CARCH}-Packages" \
        > "${pkgname}-${pkgver}-${CARCH}-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${CARCH}-Packages.sha256"

    echo "$(grep SHA512 ${pkgname}-${pkgver}-${CARCH}-Packages | head -n 1 | awk '{print $2}') ${pkgname}-${pkgver}-${CARCH}.deb" \
        > "${pkgname}-${pkgver}-${CARCH}.deb.sha512"
    sha512sum -c "${pkgname}-${pkgver}-${CARCH}.deb.sha512"
}

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install -Dm644 "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done
    rm -r "${pkgdir}/usr/share/spotify/icons/"

    # Move spotify binary to its proper location and instal wrapper script
    mkdir -p "${pkgdir}"/opt/spotify
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"
    rm "${pkgdir}"/usr/bin/spotify
    install -Dm755 "${srcdir}/spotify.sh" "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
