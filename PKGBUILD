# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=1.2.6
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com/apps"
license=('custom')
depends=('expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libgcrypt' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")

sha256sums_x86_64=('f7a10e7b565e2251f63bff879e9a31728af374c5e0aa36b577d3c542a3e25760')
sha256sums_i686=('474a1f95920e39e3a93e7771e7214401e8549d82142d313e6224540c9e17ddef')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"
    rm -rf "${pkgdir}/usr/share/slack/resources/app.asar.unpacked/static/plugins/darwin"
    rm -rf "${pkgdir}/usr/share/slack/resources/app.asar.unpacked/static/plugins/win32"
    find "${pkgdir}" -type f -iname \*.dll -delete
    find "${pkgdir}" -type f -iname \*.exe -delete

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/slack/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
