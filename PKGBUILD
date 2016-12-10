# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=2.3.3
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname}-${pkgver}-amd64.deb"
        "${pkgname}.patch")
sha256sums=('30f3aae35db492c5d9e58cdba8b9fa63f0135e7658a5ceade5eb7c6d23cb3445'
            '26ab82ad65162cb7a3aee568ecd7d3d61fcd4b95d096a530933d3b0f7771b8c3')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d ${pkgdir} -p1 <${pkgname}.patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/lib/slack/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/lib/slack/LICENSE
}
