# Maintainer: agony <27015 at riseup dot net>

pkgname=paranoia-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Local-first reverse-engineering tool for PE, ELF and Mach-O (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Altumptic/paranoia'
license=('Apache-2.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libcups' 'libgcc' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr'
         'nss' 'pango' 'systemd-libs')
optdepends=('libsecret: keep the assistant API key in the keyring'
            'python: Python scripting in the app and in paranoia script'
            'xdg-utils: open links in the browser')
provides=("paranoia=${pkgver}")
conflicts=('paranoia')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/Paranoia-${pkgver}-linux-amd64.deb"
               "${_release}/paranoia-cli-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${_release}/Paranoia-${pkgver}-linux-arm64.deb"
                "${_release}/paranoia-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('197f13a6f3e60405e64a8caa3a63f9a1e44442bb7ead77d04e3a75d8da29c943'
                   'ef76def9dae0a6202179d704835869910acecbcb044ab8770f2240f8999c580d')
sha256sums_aarch64=('e9c1fec7058364463cbf3423067f3bbcf676cd902abb8fe5834f8cf2dcad124c'
                    '104ec6ec63999b569f1a330e6021d6c755beae3bfdf16b7e4e8fb571f014f94b')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
  cp -a opt/Paranoia/. "${pkgdir}/usr/lib/${pkgname}/"
  ln -s "/usr/lib/${pkgname}/paranoia" "${pkgdir}/usr/bin/paranoia-desktop"
  install -Dm755 paranoia-cli-v"${pkgver}"-linux-*/paranoia -t "${pkgdir}/usr/bin"

  sed 's|^Exec=/opt/Paranoia/paranoia|Exec=paranoia-desktop|' usr/share/applications/paranoia.desktop \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/paranoia.desktop"
  install -Dm644 usr/share/icons/hicolor/512x512/apps/paranoia.png -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
}
