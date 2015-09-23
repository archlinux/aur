# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-chat
pkgver=1.2.1
pkgrel=1
pkgdesc="Slack Chat (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com"
license=('custom')
depends=('gconf' 'gtk2' 'libgcrypt' 'libnotify' 'libxtst' 'gvfs' 'xdg-utils' 'hunspell')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")

md5sums_i686=('2ea76cfcc870b0d3029db751dcd9673a')
md5sums_x86_64=('8c41170dca760f637313c74972be147d')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Strip cruft -- why are these shipped in Linux packages?  Consumes 60MB+
    rm -rf "${pkgdir}/usr/share/slack/resources/app.asar.unpacked/static/plugins/darwin"
    rm -rf "${pkgdir}/usr/share/slack/resources/app.asar.unpacked/static/plugins/win32"
    find "${pkgdir}" -type f -iname \*.dll -delete
    find "${pkgdir}" -type f -iname \*.exe -delete

    # The cron.daily script is toxic... manipulating keys and sources
    # list on debian.  These don't even work on Arch.  Someday a proper
    # systemd.timer service will exist if necessary.
    rm -rf "${pkgdir}/etc/cron.daily"
}
