# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-dev
_pkgname=spotify
pkgver=1.1.26.501
_commit=gbe11e53b
_rel=15
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="https://www.spotify.com"
depends=("alsa-lib>=1.0.14" "gtk2" "nss" "libxtst" "libxss" "libcurl-gnutls" "libglvnd")
optdepends=('ffmpeg0.10: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-Release::http://repository.spotify.com/dists/testing/Release"
	"${_pkgname}-Release::http://repository.spotify.com/dists/testing/Release.gpg"
	"${_pkgname}-${pkgver}-${CARCH}.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}-${_rel}_amd64.deb"
	"${_pkgname}-${CARCH}-Packages::http://repository.spotify.com/dists/testing/non-free/binary-amd64/Packages"
	'LICENSE')
sha512sums=('SKIP'
	'SKIP'
	'af9f1beafe0e4d2313326d1a55675550e8c3fcd5cd2dc0954127094c563048b98f74f669d99a10f0ef6e3b3405856bb9d6a2561644a434ab6bade9c812296963'
	'SKIP'
	'2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615')
validpgpkeys=('931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90')

# Spotify uses different names for the arch
_SPOTIFY_ARCH=amd64

prepare() {
    # Validate hashes from the PGP signed "Release" file
    #echo "$(grep non-free/binary-${_SPOTIFY_ARCH}/Packages ${_pkgname}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${_pkgname}-${CARCH}-Packages" > "${_pkgname}-${CARCH}-Packages.sha256"
    #sha256sum -c "${_pkgname}-${CARCH}-Packages.sha256"

    #echo "$(grep SHA512 ${_pkgname}-${CARCH}-Packages | awk '{print $2}') ${_pkgname}-${pkgver}-${CARCH}.deb" > "${_pkgname}-${pkgver}-${CARCH}.deb.sha512"
    #sha512sum -c "${_pkgname}-${pkgver}-${CARCH}.deb.sha512"
    true
}

build() {
    tar -xzf data.tar.gz -C "${srcdir}"
}

package() {

    # Install icons
    install -D -m 644 "${srcdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install -D -m 644 "${srcdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -D -m 644 "${srcdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Some vars to make life easier
    _srcshare="${srcdir}/usr/share/${_pkgname}"
    _pkgopt="${pkgdir}/opt/${_pkgname}"

    # Create target directories
    install -d -m 755 "${_pkgopt}"
    install -d -m 755 "${_pkgopt}/Apps"
    install -d -m 755 "${_pkgopt}/locales"

    # Install files in rootdir
    for _rfile in $(find "${_srcshare}" -maxdepth 1 -type f -name "*.pak" -o -name "*.dat" -o -name "*.bin" -o -name "libcef.so"); do
        install -D -m 644 "${_rfile}" "${_pkgopt}"
    done

    # Install files in appdir
    for _app in $(find "${_srcshare}/Apps" -maxdepth 1 -type f -name "*.spa"); do
        install -D -m 644 "${_app}" "${_pkgopt}/Apps"
    done

    # Install locale data
    for _loc in $(find "${_srcshare}/locales" -maxdepth 1 -type f -name "*.pak" -o -name "*.mo"); do
        install -D -m 644 "${_loc}" "${_pkgopt}/locales"
    done

    # Install binary
    install -D -m 755 "${_srcshare}/${_pkgname}" "${_pkgopt}"

    # Symlink binary
    install -d -m 755 "${pkgdir}"/usr/bin
    ln -s /opt/spotify/spotify "${pkgdir}"/usr/bin/spotify

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
