# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=1.2.5
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com/apps"
license=('custom')
depends=('expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libgcrypt' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")

sha256sums_x86_64=('2368e2449f08272d8ce38a423f44ed0cd35c1e77ca3c0525f069d0790b6ec58f')
sha256sums_i686=('4fc65a3a24a65c4e4ace23ed527bc73087234da75c5a9d9cdfd7924699a96aac')

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
