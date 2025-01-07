# Thanks: Forest Crossman <cyrozap at gmail dot com>
# Maintainer: Alex FANG <resripper@connective.link>
# Contributor: Stephanie Wilde-Hobbs <gpg@stephanie.is>

pkgname=go-configure-sw-hub
_pkgver_major=6.46
_pkgver_minor=001
pkgver=$_pkgver_major.$_pkgver_minor

pkgrel=2
pkgdesc="Renesas/Dialog/Silego Go Configure software hub (greenpak designer)"
arch=('x86_64')
url="https://www.renesas.com/us/en/software-tool/go-configure-software-hub"
license=('custom')
depends=(
    desktop-file-utils
    shared-mime-info
    graphviz
)
conflicts=('greenpak-designer-dev' 'greenpak-designer')
replaces=('greenpak-designer-dev' 'greenpak-designer')
options=('!strip')

source=("https://renesasweb-greenpak.s3.us-west-2.amazonaws.com/v${_pkgver_major}/go-configure-sw-hub-v${pkgver}-debian-12-amd64.deb")
sha256sums=('ab6819404e1ee14e0e1a30ec29e2a02be5f66528500fb210ff33b8cf457de053')

package() {
    # Extract the package data
    tar -xf data.tar.xz -C "${pkgdir}"/

    # Install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    mv "${pkgdir}"/lib/udev/rules.d/* "${pkgdir}"/usr/lib/udev/rules.d
    rm -r "${pkgdir}"/lib

    # Remove unneeded files
    rm "${pkgdir}"/usr/bin/*

    # Move package to /opt
    install -dm 755 "${pkgdir}"/opt
    mv "${pkgdir}"/usr/local/"${pkgname}" "${pkgdir}"/opt/"${pkgname}"
    rm -r "${pkgdir}"/usr/local

    # Link launcher to /usr/bin
    ln -s /opt/${pkgname}/bin/GPLauncher "${pkgdir}"/usr/bin/GPLauncher

    # Fix desktop launchers
    for _launcher in "${pkgdir}/usr/share/applications"/*.desktop; do
        sed -i -e "s!local/${pkgname}/!!g" $_launcher
    done

    # Install license file
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
