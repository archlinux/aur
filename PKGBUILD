# Maintainer: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>
# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

_pkgname=teleport
pkgname=teleport-bin
pkgver=17.5.2
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://goteleport.com/"
license=('LicenseRef-TeleportCommunityLicense')
depends=(glibc gcc-libs)
optdepends=("python: for the examples"
            "bash: for the examples")
provides=('teleport' 'tctl' 'tsh' 'tbot')
conflicts=('teleport')
install=teleport.install

source=("teleport.service"
        "teleport@.service"
        "teleport.install"
        "LICENSE-community::https://raw.githubusercontent.com/gravitational/teleport/master/build.assets/LICENSE-community")

# The teleport servers do not allow for byte ranges to continue download so we set -C0
# https://aur.archlinux.org/packages/teleport-bin#comment-906339
DLAGENTS=('https::/usr/bin/curl -qgb "" -fL -C0 --retry 3 --retry-delay 3 -o %o %u')

source_i386=("teleport-bin-${pkgver}-i386.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-386-bin.tar.gz")
source_x86_64=("teleport-bin-${pkgver}-x86_64.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz")
source_armv7h=("teleport-bin-${pkgver}-armv7h.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz")
source_aarch64=("teleport-bin-${pkgver}-aarch64.tar.gz::https://get.gravitational.com/teleport-v${pkgver}-linux-arm64-bin.tar.gz")

sha256sums=('68326e40c91aea621e2eab7efe8481574be1d313f49b38cb0d6aedad9efc47ab'
            'd5265830ec926e249d8643351216dc0f2842bd0c004f79dcdb260b3548fafdff'
            'c71bbe70179aceb0f49d2a4f1e0a83da040ca72373e17ca82cc2489cd6e07801'
            '3beda963b864fc67546e6926fd6ee8601cafee44a9d24440042efd68b7cab8f6')
sha256sums_i386=('9daacbc29065912efaab4b2ca849c3126fb8142737e741b915d5ee3391fb6e5c')
sha256sums_x86_64=('05267b1feddd16a58a5a89eb265812afc179281b0665952e4321d04944145ae5')
sha256sums_armv7h=('10c6a4b9352214d8643851262eca425025de1e2b3645aff7ec1bb69e76249c5c')
sha256sums_aarch64=('c74490a1edc20dac7cff448e091e56a601811e8c5941df806ebd5fa2cb0823ca')

options=(!strip)

package() {
    cd "${_pkgname}"

    # Install binaries
    install -Dm755 teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
    install -Dm755 tbot "${pkgdir}/usr/bin/tbot"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"

    # Install license
    install -Dm644 "${srcdir}/LICENSE-community" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
