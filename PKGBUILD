# Maintainer: Jbsco <https://github.com/Jbsco>
#
# One package for a whole whatsOn deployment: the server, its web frontend,
# the native client artifacts the server offers to other machines, the
# systemd units and the service account. Built from release assets alone.
# packaging/aur.sh sets pkgver and sha256sums for each release.
pkgname=whatson-bin
pkgver=2.0.54
pkgrel=1
pkgdesc='Television broadcast station emulator: channels from a local media library, with a program guide, a browser client and native clients'
arch=('x86_64')
url='https://github.com/Jbsco/whatsOn'
license=('MIT' 'GPL-2.0-or-later' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'ffmpeg' 'curl')
optdepends=('libva-mesa-driver: VAAPI hardware transcoding on AMD'
            'intel-media-driver: VAAPI hardware transcoding on Intel')
provides=('whatson')
conflicts=('whatson')
install=whatson-bin.install
_release="https://github.com/Jbsco/whatsOn/releases/download/v${pkgver}"
_server="whatson-server-v${pkgver}-linux-x86_64.tar.gz"
_linux="whatson-desktop-v${pkgver}-linux-x86_64.tar.gz"
_windows="whatson-desktop-v${pkgver}-windows-x86_64.zip"
source=("${_release}/${_server}"
        "${_release}/${_linux}"
        "${_release}/${_windows}"
        'whatson.sysusers'
        'whatson.tmpfiles')
noextract=("${_server}" "${_linux}" "${_windows}")
sha256sums=('bdc179a60a05b403d82259afaaf1b6b625d607ef5110f59050af68d80d6fbd63' 'eb3a403f1959efabf08fed11a90726241d75d2a3bb9577f0fb1b610c2cbd80e6' 'd9223b87523e80c64eec66857bbfccf4c356276629e2b91b15c2159bdf9d0db0' '8a4a4428b375d1117c78f5135fbeb7e6fc3a8a7c0e3eec4e0ca51b905a57291c' '2d546af65fde9161881d10e3cb2239b73e938a831af84d95c7574df8ffda8089')

prepare() {
    rm -rf "${srcdir}/server"
    mkdir "${srcdir}/server"
    bsdtar -xf "${srcdir}/${_server}" -C "${srcdir}/server"
}

package() {
    local lib="${pkgdir}/usr/lib/whatson"
    cd "${srcdir}"

    # Server and frontend, laid out as a release directory is, so the server
    # finds its web root and the clients it offers beside it.
    install -Dm755 server/whatson "${lib}/whatson"
    cp -r server/web "${lib}/web"
    install -Dm644 -t "${lib}/clients" "${_linux}" "${_windows}"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/whatson/whatson "${pkgdir}/usr/bin/whatson"

    # Units as shipped, with the release-directory paths set for this layout.
    local unit
    for unit in whatson.service whatson-index.service whatson-index.timer; do
        sed 's|/opt/whatson/current|/usr/lib/whatson|g' "server/share/systemd/${unit}" \
            | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${unit}"
    done

    # Service account, and the example config copied in only when no config
    # exists: an upgrade never replaces a configured channels.yaml.
    install -Dm644 whatson.sysusers "${pkgdir}/usr/lib/sysusers.d/whatson.conf"
    install -Dm644 whatson.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/whatson.conf"
    # The example config keeps its database in the state directory.
    sed 's|^\( *database_path:\).*|\1 "/var/lib/whatson/whatson.db"|' server/share/whatson/channels.yaml \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/whatson/channels.yaml"
    grep -q '^ *database_path: "/var/lib/whatson/whatson.db"$' "${pkgdir}/usr/share/whatson/channels.yaml"

    install -Dm644 server/share/licenses/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    bsdtar -xOf "${_linux}" THIRD-PARTY-LICENSES.txt \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.txt"
}
