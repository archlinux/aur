# Maintainer: Zach Adams <zach at zach-adams dot com>
# Contributor: tadly
pkgname=enpass-beta-bin
_pkgname=enpass
pkgver=5.5.0.2
_pkgver=5.5.0-2
pkgrel=1
pkgdesc="A multiplatform password manager. Beta version"
arch=('x86_64')
url="https://enpass.io"
license=('custom')
depends=('qt5-base' 'qt5-websockets' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-multimedia' 'unixodbc' 'gtk2' 'postgresql-libs')
provides=("${_pkgname}")
conflicts=('enpass-bin' 'enpass-rc-bin')
# Disable strip as otherwise the browser extension will not work
options=('!strip')
install=enpass-bin.install
source=(
    "http://repo.sinew.in/testing/pool/beta/e/enpass/${_pkgname}_${_pkgver}beta_amd64.deb"
    "LICENSE")
sha256sums=('5d223d09a22c3c1f5931cc875b68091d3c6cf43494c44df6c33fa9204dde835d'
            'cffbf5627a9cefa762384b198bdff09697c8432e9a189d483cfcc771a4b68ce7')


package() {
    # Extract data
    tar xfz "${srcdir}/data.tar.gz" -C ${pkgdir}

    # Remove unnecessary files which are included in the .deb
    find ${pkgdir} -name ".DS_Store" -delete
    find ${pkgdir} -name "._.DS_Store" -delete
    find ${pkgdir} -name "._enpass.png" -delete
    find ${pkgdir} -name "*.swp" -delete

    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Update permissions to match the default system ones
    chmod 755 ${pkgdir}/opt/
    find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;

    # Symlink "runenpass.sh" to "/usr/bin" so it is accessible via cli
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}
