# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-chat
pkgver=1.1.7
pkgrel=1
pkgdesc="Slack Chat (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com"
license=('custom')
depends=('gconf' 'gtk2' 'libgcrypt' 'libnotify' 'libxtst' 'gvfs' 'xdg-utils')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-${pkgver}-i386.deb")

sha256sums_x86_64=('4934d682d5fcac4ba1aa30fa1b8ee0ff98b4ec8b6dbbf433c6f08cd2543f1f19')
sha256sums_i686=('ec361c5a264912f5fc1ab6f95aeb8978732022530324432b4a96f929b79b9f1a')

package() {
    bsdtar -O -xf "slack-${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

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
