# Maintainer: Samarth Ramesh <samarthr1@outlook.com>

pkgname=wingide8
pkg_pname=wingide
pkgver=8.0.0.2
pkgrel=0
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers.\nWarning. This is a beta package"
url="http://www.wingware.com"

license=('custom')
arch=('x86_64')

source=("https://wingware.com/pub/wingpro/$pkgver/wingpro-$pkgver-linux-x64.tar.bz2" )
sha1sums=("d0c80aff0d6612d062c79ad994af9212577cbaab")

depends=('xdg-utils' 'python'  'python2' 'qt5-svg' 'libxcb' 'perl' 'java-runtime')
provides=(${pkg_pname})
conflicts=(${pkg_pname})

install=${pkg_pname}.install

package() {
    cd "$srcdir/wingpro-$pkgver-linux-x64"
    ./wing-install.py \
    --install-binary \
    --winghome "${pkgdir}/opt/${pkg_pname}" \
    --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkg_pname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkg_pname}/wing
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/${pkg_pname}/bootstrap/run-wing.sh
    # Fix a bug in the script
    
    sed -i "s|'`echo $arch`'\]|'`echo $arch`' \]|" ${pkgdir}/opt/${pkg_pname}/bootstrap/run-wing.sh

    # Copy over patch (if any)
    if [ -d ../patches ]; then
        cp -r ../patches ${pkgdir}/opt/${pkg_pname}/.
    fi

    # remove refrence to ${pkgdir}
    sed -i "s,${pkgdir},,g" "${pkgdir}/opt/wingide/file-list.txt"

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkg_pname}"
    chmod +x ${pkgdir}/opt/${pkg_pname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkg_pname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkg_pname}/LICENSE"
}
