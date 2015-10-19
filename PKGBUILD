# Maintainer: Oscar Garcia Amor <ogarcia(at)connectical(dot)com>

pkgname=slack-desktop
pkgver=1.2.4
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com/apps"
license=('custom')
depends=('expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libgcrypt' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")

md5sums_i686=('5c66910fa1e5ebc63994d7008835d7f1')
md5sums_x86_64=('8024d5dac7a777563f32c2364b46e743')

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
