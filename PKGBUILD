# Maintainer: Seamus Connor
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop-dark
pkgver=3.4.2
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, with dark theme patch"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk3' 'libcurl-compat' 'libsecret' 'libxss'
         'libxtst' 'nss' 'glibc>=2.28-4' 'xdg-utils')
optdepends=('gnome-keyring')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname%-dark}-${pkgver}-amd64.deb"
		# black.css based on "https://raw.githubusercontent.com/Nockiro/slack-black-theme/13a638fe11e58b4d5aad9dc4f38c904b2f8a600e/black.css"
		"black.css"
		"darkify_slack.js"
    	"${pkgname}.patch")
noextract=("${pkgname%-dark}-${pkgver}-amd64.deb")
sha256sums=('3833c1abdbd15b50d9f3e4f77deb4bf6d578cfebfeab2b6ee0e84f567d207261'
			'SKIP'
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

    # Insert the black theme directly into ssb-interop.js
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
