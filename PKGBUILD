# Maintainer: Samarth Ramesh <samarthr1@outlook.com>

pkgname="wingide8"

# cannot call it wingide8 as some parts hardcode it as wingide
_pkg_pname=wingide

pkgver=8.0.0.3
pkgrel=1

pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers.\nWarning. This is a beta package"
url="http://www.wingware.com"

license=('custom')
arch=('x86_64')

source=("https://wingware.com/pub/wingpro/$pkgver/wingpro-$pkgver-linux-x64.tar.bz2" )
sha1sums=("33532dc28ab8315caf7c1653df2086ba3a1aa673")

depends=('xdg-utils' 'python' 'qt5-svg' 'libxcb' 'perl' 'java-runtime')
provides=(${_pkg_pname})
conflicts=(${_pkg_pname})

install=${_pkg_pname}.install

options=("!strip")

package() {
    cd "$srcdir/wingpro-$pkgver-linux-x64"
    ./wing-install.py \
    --install-binary \
    --winghome "${pkgdir}/opt/${_pkg_pname}" \
    --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${_pkg_pname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${_pkg_pname}/wing
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/${_pkg_pname}/bootstrap/run-wing.sh
    # Fix a bug in the script
    
    sed -i "s|'`echo $arch`'\]|'`echo $arch`' \]|" ${pkgdir}/opt/${_pkg_pname}/bootstrap/run-wing.sh

    # Copy over patch (if any)
    if [ -d ../patches ]; then
        cp -r ../patches ${pkgdir}/opt/${_pkg_pname}/.
    fi

    # remove refrence to ${pkgdir}
    sed -i "s,${pkgdir},,g" "${pkgdir}/opt/wingide/file-list.txt"

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${_pkg_pname}"
    chmod +x ${pkgdir}/opt/${_pkg_pname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${_pkg_pname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgpname}/LICENSE"
}
