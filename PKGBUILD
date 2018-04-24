pkgname='enpass-bin'
_pkgname='enpass'
pkgver=5.6.8
pkgrel=1
pkgdesc='A multiplatform password manager'
arch=('x86_64')
url='http://enpass.io/'
license=('custom')
depends=('libxss' 'lsof')
conflicts=('enpass-beta-bin' 'enpass-rc-bin')
provides=("${_pkgname}")
install='enpass-bin.install'
source=("http://repo.sinew.in/pool/main/e/enpass/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('ba6289589874e7477cbd1bfad31180c0fcf7abbb7e47ab19c685dda3747eaa12')

# Disable strip as otherwise the browser extension will not work
options=('!strip')

package() {
    # Extract data
    tar xfz "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Remove unnecessary files which are included in the .deb
    find "${pkgdir}" -name '.DS_Store' -delete
    find "${pkgdir}" -name '._.DS_Store' -delete
    find "${pkgdir}" -name '._enpass.png' -delete
    find "${pkgdir}" -name '*.swp' -delete

    # Update permissions to match the default system ones
    chmod 755 "${pkgdir}/opt/"
    find "${pkgdir}/usr/" -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p "${pkgdir}/usr/bin"
    ln -s '/opt/Enpass/bin/runenpass.sh' "${pkgdir}/usr/bin/enpass"
}
