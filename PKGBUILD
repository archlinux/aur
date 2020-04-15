# Maintainer: SuperITMan <admin(at)superitman(dot)com>
# Contributor: Ben Isenhart <bisenhar(at)uvm(dot)edu>
# Contributor: Seamus Connor
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop-black-theme-night-mood
pkgver=4.1.2
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, with black theme night mood patch"
cssver=766623d
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'ttf-muli' 'xdg-utils')
makedepends=('asar')
optdepends=('gnome-keyring')
conflicts=('slack-desktop' 'slack-desktop-dark')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname%-black-theme-night-mood}-${pkgver}-amd64.deb"
        "slack-4-${pkgver}-${pkgrel}::https://raw.githubusercontent.com/caiceA/slack-raw/${cssver}/slack-4"
        "darkify_slack.js"
        "${pkgname}.patch")
noextract=("${pkgname%-black-theme-night-mood}-${pkgver}-amd64.deb")
sha256sums=('70667911fff7f338d68137eaae93daf02c2c0f68f51db25a76345418d0142b28'
            'dfddb59821d99d40a2bb2795ac6109f33071d2e8ea89778cde20675a8df0ab8a'
            '13fc4ea2c9bfd113e123a7f74375f17c17a7256d7481f9acacb466088b913418'
            'c952eb32dd59beff9fc5374853b04acde4a60ed8c39934fcd0b66829455d594d')

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
	sed -i -e '/\\E/d' -e 's/939393/ffffff/' slack-4-${pkgver}-${pkgrel}
    cat slack-4-${pkgver}-${pkgrel} >> $file
    tail -n +$((lineno + 1)) darkify_slack.js >> $file

    # Repack with the theme change
    asar pack "${resources}/app.asar.unpacked" "${resources}/app.asar" 

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
