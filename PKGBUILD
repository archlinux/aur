# Maintainer: WhiredPlanck
# Contributor: Bruce Zhang

pkgname=slack-electron
_pkgname=slack
pkgver=4.8.0
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, modified to use the system 'electron' package instead of its own"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom: Slack')
depends=('electron')
provides=('slack' 'slack-desktop')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/${_pkgname}-desktop-${pkgver}-amd64.deb")
sha256sums=('60febe824334cbc33e4c63e7ac133a53efc325447405fc8a3ffa426ecbbf1861')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz 
	echo "#!/bin/env sh
exec electron /usr/share/${_pkgname}/app.asar \$@
" > "${srcdir}/${_pkgname}.sh"

    # Fix hardcoded icon path in .desktop file
    sed -i "s/Icon=\/usr\/share\/pixmaps\/slack.png/Icon=slack/g"  usr/share/applications/slack.desktop

    # Permission fix
    find "${srcdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${srcdir}/etc"
    #rm -rf "${pkgdir}/usr/lib/slack/src"
    rm -rf "${srcdir}/usr/share/lintian"
    rm -rf "${srcdir}/usr/share/doc"
}
package() {
    # Install share
    cd "${srcdir}/usr/share"
	find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/{}" \;
    
    # Install .sh
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/slack"
    
    # Install resources
    cd "${srcdir}/usr/lib/slack/resources"
	install -Dm644 app.asar "${pkgdir}/usr/share/${_pkgname}/app.asar"
	
    cd app.asar.unpacked
	find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/app.asar.unpacked/{}" \;

    # Install license
    install -Dm755 "${srcdir}/usr/lib/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    
}
