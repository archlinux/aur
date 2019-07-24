# Maintainer: Ben Isenhart <bisenhar(at)uvm(dot)edu>
# Contributor: Seamus Connor
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop-dark
pkgver=4.0.0
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux, with dark theme patch"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'asar' 'gconf' 'gtk3' 'libcurl-compat' 'libsecret' 'libxss'
         'libxtst' 'nss' 'glibc>=2.28-4' 'xdg-utils')
optdepends=('gnome-keyring')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname%-dark}-${pkgver}-amd64.deb"
        "https://raw.githubusercontent.com/Nockiro/slack-black-theme/master/custom.css"
        "darkify_slack.js"
        "${pkgname}.patch")
noextract=("${pkgname%-dark}-${pkgver}-amd64.deb")
sha256sums=('911a4c05fb4f85181df13f013e82440b0d171862c9cb137dc19b6381d47bd57e'
            'aa3bdc785de47ac08ba90aa4a3c083482463be86ca6d29df505586ba2cb16f6f'
            'SKIP'
            'SKIP')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d "${pkgdir}" -p1 <"${pkgname}".patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/lib/slack/src"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Slack packs resources into an ASAR, so it needs to be extracted
    resources="${pkgdir}/usr/lib/slack/resources"
    asar extract "${resources}/app.asar" "${resources}/app.asar.unpacked"

    # Insert the black theme directly into ssb-interop
    lineno=$(sed -n '/HERE/=' darkify_slack.js)
    file="${resources}/app.asar.unpacked/dist/ssb-interop.bundle.js"

    # The last line of ssb-interop is comment, so a newline prevents the first line
    # of our function from being commented out
    echo "" >> $file
    head -n $((lineno - 1)) darkify_slack.js >> $file
    cat custom.css >> $file
    tail -n +$((lineno + 1)) darkify_slack.js >> $file

    # Repack with the theme change
    asar pack "${resources}/app.asar.unpacked" "${resources}/app.asar" 

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
