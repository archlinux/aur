pkgname='enpass-bin'
_pkgname='enpass'
pkgver=6.10.1.1661
pkgrel=1
pkgdesc='A multiplatform password manager'
arch=('x86_64')
url='http://enpass.io/'
license=('custom')
depends=('libxss' 'lsof' 'curl' 'libxkbcommon-x11' 'libxcb' 'xcb-util-wm'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil')
optdepends=('libxdg-basedir: Open links in the default browser.'
            'libqtxdg: Open links in the default browser (Qt implementation)')
provides=("${_pkgname}")
install='enpass-bin.install'
source=("https://apt.enpass.io/pool/main/e/enpass/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('52e9a6819b186b83eb8d8b9e2d5d4f62dedbb24382819738c18cb28976e8b07b')

# Disable strip as otherwise the browser extension will not work
options=('!strip')

package() {
    # Extract data
    tar xfz "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Remove unnecessary files which are included in the .deb
    # find "${pkgdir}" -name '*~' -delete

    # Update permissions to match the default system ones
    chmod -R go-w "${pkgdir}/opt/"
    chmod 755 "${pkgdir}/opt/"
    find "${pkgdir}/usr/" -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '/opt/enpass/Enpass' "${pkgdir}/usr/bin/enpass"
}


# vim: set syntax=sh:
