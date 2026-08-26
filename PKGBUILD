# Maintainer: Christian Heusel <christian@heusel.eu>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: TobFromme < TobFromme {hat} pm {dont} me >
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify
pkgver='1.2.96.518'
epoch=1
_commit=g366879e1
pkgrel=2
pkgdesc='A proprietary music streaming service'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm' 'libayatana-appindicator' 'libayatana-indicator')
optdepends=('ffmpeg4.4: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip')

# NOTE: We switched from stable to testing on 18th march, as the spotify
# stable repository is always outdated. Testing seems to be in sync with snap:
# https://snapcraft.io/spotify
# http://repository.spotify.com/dists/testing/Release
# http://repository.spotify.com/dists/testing/non-free/binary-amd64/Packages
# http://repository.spotify.com/dists/testing/Release.gpg
source=("${pkgname}-${pkgver}-${_commit}-x86_64.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}_amd64.deb"
        "spotify.sh"
        "spotify.protocol"
        "LICENSE"
        # GPG signature check
        "${pkgname}-${pkgver}-${pkgrel}-Release::http://repository.spotify.com/dists/testing/Release"
        "${pkgname}-${pkgver}-${pkgrel}-Release.sig::http://repository.spotify.com/dists/testing/Release.gpg"
        "${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages::http://repository.spotify.com/dists/testing/non-free/binary-amd64/Packages")
sha512sums=('98d25bd748258ca8b8357313cd35c7188bb0b26ed2d4390b0208473aa9fa3491a095559762f8ba06ec0828d73e05ee8fb488f0f357340191da4c65dd1f93c519'
            'da48b628a4ea925dd8521133ebf364b261b11aed252d264dde6605d915cdb631919ffe672c58534bcdb60869e5d87a49a60a8198780b99517123f0031e83fdb1'
            '999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '18f27971697835df865d63465d86d1250b20b9d1c12bbf7df1eafeef5c66bf0b3134c25b08269f72d4b7a4287151336ee3fd0f70bc46da25f13e8c91c004f710'
            'SKIP'
            '1fbb6f1f104b998265faafeb62cb3aff6d7048b2e689292049fbbe867ea4071af3b73fc5a023bff8d4c1e579e5d904c78179e3650ae4740602583db8e13bde8a')

# Import key with:
# curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.gpg | gpg --import -
validpgpkeys=('E1096BCBFF6D418796DE78515384CE82BA52C83A') # Spotify Public Repository Signing Key <tux@spotify.com>
# Old Keys:
# 63CBEEC9006602088F9B19326224F9941A8AA6D1
# E27409F51D1B66337F2D2F417A3A762FAFD4A51F
# F9A211976ED662F00E59361E5E3C45D7B312C643
# 8FD3D9A8D3800305A9FFF259D1742AD60D811D58
# 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
# 2EBF997C15BDA244B6EBF5D84773BD5E130D1D45
# B420FD3777CCE3A7F0076B55C85668DF69375001

# Skip "Release" and "Packages" files hashes as they are unstable
# Since "updpkgsums"/"pkgctl version upgrade" overwrite the checksum array with
# literal hashes, set them to SKIP with indexed assignments (pacman-contrib#119)
# https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
sha512sums[4]='SKIP'
sha512sums[6]='SKIP'

prepare() {
    # Validate hashes from the PGP signed "Release" file
    echo "$(grep non-free/binary-amd64/Packages ${pkgname}-${pkgver}-${pkgrel}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages" \
        > "${pkgname}-${pkgver}-x86_64-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-x86_64-Packages.sha256"

    echo "$(grep SHA512 ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages | head -n 1 | awk '{print $2}') ${pkgname}-${pkgver}-${_commit}-x86_64.deb" \
        > "${pkgname}-${pkgver}-x86_64.deb.sha512"
    sha512sum -c "${pkgname}-${pkgver}-x86_64.deb.sha512"
}

package() {
    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%u/' "${pkgdir}/usr/share/spotify/spotify.desktop"

    install -Dm 644 "${pkgdir}/usr/share/spotify/spotify.desktop" "${pkgdir}/usr/share/applications/spotify.desktop"
    install -Dm 644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-512.png" "${pkgdir}/usr/share/pixmaps/spotify-client.png"

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm 644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Move spotify binary to its proper location
    mkdir -p "${pkgdir}/opt/spotify"
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"

    # Copy launch script which allows the use of custom flags
    install -Dm 755 spotify.sh "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm 644 spotify.protocol "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
