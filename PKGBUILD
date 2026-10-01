# Maintainer: czyt <czytcn@gmail.com>
# Contributor: ZacharyZhang-NY <ZacharyZhang-NY@users.noreply.github.com>
# Repackages the Desktop .deb built by `pnpm run package:desktop:linux:x64`.

pkgname=deepseek-harness-desktop-bin
_pkgver=0.2.0-rc.2
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc='Desktop shell for the DeepSeek Harness agent runtime'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libnotify' 'libsecret' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libayatana-appindicator: system tray icon support')
provides=('deepseek-harness-desktop')
conflicts=('deepseek-harness-desktop')
options=('!strip' '!debug')
_deb="deepseek-harness-${_pkgver}-linux-amd64.deb"
source=("${_deb}::https://github.com/ZacharyZhang-NY/deepseek-harness/releases/download/desktop-v${_pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums=('defc5e533be640159c9d83b8059f1b6ed23178cd6253f6d5755d714f5099d4fa')

package() {
    bsdtar -xOf "${_deb}" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"

    # The .deb creates these in its postinst script, which pacman does not run.
    install -d "${pkgdir}/usr/bin"
    ln -s '/opt/DeepSeek Harness/deepseek-harness' "${pkgdir}/usr/bin/deepseek-harness"
    chmod 4755 "${pkgdir}/opt/DeepSeek Harness/chrome-sandbox"
    install -Dm644 "${pkgdir}/opt/DeepSeek Harness/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
