# Maintainer: Ani Betts <anais@anaisbetts.org>
pkgname=formal-desktop-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="The Formal Desktop app for Linux - database access control and security"
arch=('x86_64' 'aarch64')
url="https://joinformal.com"
license=('custom:proprietary')
depends=('gtk3' 'glibc' 'libayatana-appindicator' 'libsecret' 'libx11')
provides=('formal-desktop' 'formal')
conflicts=('formal-desktop')
options=('!strip')

source_x86_64=("formal-desktop-${pkgver}-x86_64.deb::https://static-assets.formalcloud.net/desktop-app/linux/formal-desktop_${pkgver}_amd64.deb")
source_aarch64=("formal-desktop-${pkgver}-aarch64.deb::https://static-assets.formalcloud.net/desktop-app/linux/formal-desktop_${pkgver}_arm64.deb")

sha256sums_x86_64=('9a37fa0eed061e87d88f0af64c798ee44edaf5c5b568e71c57ea50b70ad6b37e')
sha256sums_aarch64=('993c6a41dd0cb8a82ca06bac4feb42da12f66d21590d31a8a944a13b42f0a82c')

package() {
    cd "${srcdir}"

    # Extract the deb package
    if [[ "${CARCH}" == "x86_64" ]]; then
        ar -x "formal-desktop-${pkgver}-x86_64.deb"
    else
        ar -x "formal-desktop-${pkgver}-aarch64.deb"
    fi

    # Extract data archive (could be .tar.gz, .tar.xz, or .tar.zst)
    if [[ -f data.tar.gz ]]; then
        tar -xzf data.tar.gz -C "${pkgdir}"
    elif [[ -f data.tar.xz ]]; then
        tar -xJf data.tar.xz -C "${pkgdir}"
    elif [[ -f data.tar.zst ]]; then
        tar --zstd -xf data.tar.zst -C "${pkgdir}"
    else
        # Try to find any data.tar.* file
        tar -xf data.tar.* -C "${pkgdir}"
    fi
}
