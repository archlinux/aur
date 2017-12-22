# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-stable
pkgver=1.0.69.336
_commit=g7edcc575
_ver_x86_64=39
_ver_i686=39
pkgrel=3
pkgdesc='A proprietary music streaming service'
arch=('x86_64' 'i686')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gconf' 'gtk2' 'glib2' 'nss' 'libsystemd' 'libxtst' 'libx11' 'libxss' 'libcurl-compat' 'desktop-file-utils' 'rtmpdump' 'openssl-1.0')
optdepends=('ffmpeg0.10: Adds support for playback of local files'
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}-${_ver_x86_64}_amd64.deb"
               "${pkgname}-${pkgver}-x86_64-Packages::http://repository.spotify.com/dists/stable/non-free/binary-amd64/Packages")
source_i686=("${pkgname}-${pkgver}-i686.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}-${_ver_i686}_i386.deb"
             "${pkgname}-${pkgver}-i686-Packages::http://repository.spotify.com/dists/stable/non-free/binary-i386/Packages")
sha512sums=('73124cb25e831534c94232ad607d6cf7716c6fb5e0cbb7ad4cd0976a45f6fa9efdc50c58109cd9594021476c9879d6b1a90cdb4ecbb03d5ad89ae52c82fc473a'
            '999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '281c33b3e21b0feeba557b81230bb8168cbfe4ec2166755b6ca2fb4b4bc22416bbbe618a4ec681a169d7ea25b41995e228e7b445a14d98045f3d83008304aff1'
            '4103d2dbeea3684cf77fb293b2bc2354dcee28cfdb8e464f34d28f932e2e9025080cca827ae6f8edfcd8464105323cecd1e802181c63262afd9a5bae45985982')
sha512sums_x86_64=('cc0cdc5065d21ebb2fa3d05f088b43c49ce95a7ddbedbb474841a11b6a6a79771767e939828cc18ec8f21bb6ba5a3931c6c62ba69321990ed72911c8cd872c04'
                   'fa48080af1b277672f9babca4750aac40cc6b0daf9af2860a33a923e6764e7184d219065b71b124051b9379c9caa4c6e5c7ced258150ac7aa918a288f82d55f4')
sha512sums_i686=('41ab715a247029e1d380387962c554153af734e4eaf6965d1e175f9370d71cefe7559e358b0d402162955bb069a72cd24249d341b1bb7c75fc40b9b65bbc80da'
                 'd7958520af64fd680378d19e4b5357d5317a2c385d0e6d0e8c1ce957ed7f4745b9deea05a1aea4fb2f3586addf223ab5a85ab43611ce69f46745eac30ae5b1a8')
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
