# Maintainer: Seamus Connor

pkgname=slack-desktop-dark
pkgver=3.3.7
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, with dark theme patch"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk3' 'libcurl-compat' 'libsecret' 'libxss' 'libxtst' 'nss' 'glibc>=2.28-4')
optdepends=('gnome-keyring')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname%-dark}-${pkgver}-amd64.deb"
		"https://raw.githubusercontent.com/laCour/slack-night-mode/master/css/raw/black.css"
		"darkify_slack.js"
    	"${pkgname}.patch")
noextract=("${pkgname%-dark}-${pkgver}-amd64.deb")
sha256sums=('17310bc323eafcef86c134c7aea9b53a82f8394aa30a886ac419f9a5a23168e0'
            '115d799ca0f7491bfe61963803babe5cb71b551e66bed9b210f7769deffaed86'
            '3a54ac5cfa3ec9bbe5f1f1a854311f8ec9bfff4207b84357f46a94ab003e52d7'
            'c952eb32dd59beff9fc5374853b04acde4a60ed8c39934fcd0b66829455d594d')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d "${pkgdir}" -p1 <"${pkgname}".patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    lineno=$(sed -n '/HERE/=' darkify_slack.js)
    file="${pkgdir}/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js"
    head -n $((lineno - 1)) darkify_slack.js >> $file
    cat black.css >> $file
    tail -n +$((lineno + 1)) darkify_slack.js >> $file

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
