# Maintainer: Yassine CHERRADI <yassinec.org@protonmail.com>

pkgname=mlink-bin
pkgver=1.2.0
pkgrel=4
pkgdesc="mLink - mBlock web version driver"
arch=('x86_64')
url="https://gitlab.com/yassinec.org/mlink-bin"
license=('LicenseRef-Makeblock-EULA')
depends=('glibc' 'gcc-libs' 'bash')
provides=('mlink')
conflicts=('mlink')
install=mlink.install
options=('!strip' '!debug')

source=("mlink-${pkgver}.deb::https://gitlab.com/yassinec.org/mlink-bin/-/raw/main/mLink-1.2.0-amd64.deb"
        "mlink.service")
sha256sums=('28bc63f356636c4be185acf4b1e341e165d7e726de67bfd6713d5d19f75695ed'
            'f7b301ac2c2fef280e6444cf74ffdff1a2ace509091324f263e8e220d0bf3e66')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"

    install -d "${pkgdir}/opt/makeblock"
    install -d "${pkgdir}/usr/bin"

    cp -r "${srcdir}/usr/local/makeblock/mLink" "${pkgdir}/opt/makeblock/mlink"

    sed -i 's|appDir="/usr/local/makeblock/mLink"|appDir="/opt/makeblock/mlink"|g' "${pkgdir}/opt/makeblock/mlink/mlink"

    find "${pkgdir}/opt/makeblock/mlink" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/makeblock/mlink" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/makeblock/mlink/mlink" "${pkgdir}/opt/makeblock/mlink/mnode"

    ln -s /opt/makeblock/mlink/mlink "${pkgdir}/usr/bin/mlink"

    install -Dm644 "${srcdir}/mlink.service" "${pkgdir}/usr/lib/systemd/system/mlink.service"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE" <<'EOF'
This package distributes a proprietary binary owned by Makeblock Co., Ltd.
It is not licensed under a standard open-source license. Refer to
Makeblock's official terms of use for the applicable license:
https://www.makeblock.com/pages/terms-of-use

This AUR package and its build scripts (PKGBUILD, install, service files)
are provided by the package maintainer to package the above binary for
Arch Linux, and are separate from the binary's own license.
EOF
}
