# Maintainer: czyt <czytcn@gmail.com>
pkgname=kudu-app-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Free Windows, Mac and Linux cleaner, scanner, and more."
arch=('x86_64')
url="https://github.com/AdventDevInc/kudu"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'libxss' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
optdepends=('libappindicator-gtk3: system tray integration')
provides=('kudu-app')
# Both packages install /usr/bin/kudu.
conflicts=('kudu' 'kudu-bin')
options=('!strip' '!debug')
source=("kudu-${pkgver}-LICENSE::https://raw.githubusercontent.com/AdventDevInc/kudu/v${pkgver}/LICENSE")
source_x86_64=("Kudu-${pkgver}-amd64.deb::https://github.com/AdventDevInc/kudu/releases/download/v${pkgver}/Kudu-${pkgver}-amd64.deb")
noextract=("Kudu-${pkgver}-amd64.deb")
sha256sums=('25ffd176698d9f5cdebe9d8376a35b91a41aaef4dbac75c18d42730a71739a01')
sha256sums_x86_64=('8e20085499940d52702c676dcd3827e37a2858900972d56f47e21b0872b95b63')

package() {
    local deb="${srcdir}/Kudu-${pkgver}-amd64.deb"
    local data_archive
    data_archive=$(bsdtar -tf "$deb" | sed -n '/^data\.tar\(\..*\)\?$/p')
    [[ -n "$data_archive" ]] || return 1
    bsdtar -xOf "$deb" "$data_archive" |
        bsdtar --no-same-owner -xf - -C "$pkgdir" || return 1

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/Kudu/kudu "${pkgdir}/usr/bin/kudu"
    chmod 4755 "${pkgdir}/opt/Kudu/chrome-sandbox"
    install -Dm644 "${srcdir}/kudu-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
