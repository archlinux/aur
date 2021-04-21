# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=7.2.9.0
_wing_patch_lvl=0 #bump this when adding a patch
pkgver=$_wingver.$_wing_patch_lvl
pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('x86_64')
_wingpatch=("")
_patch_url_prefix=https://wingware.com/pub/wingpro/$_wingver/patches/
#_wingpatch=( "${_wingpatch[@]/#/$_patch_url_prefix}" )
source=("https://wingware.com/pub/wingpro/$_wingver/wingpro-$_wingver-linux-x64.tar.bz2" ${_wingpatch[*]})
depends=('hicolor-icon-theme' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
sha1sums=('d36a8083ff291a8fe52940d3d12efa06d94788fc')

install=${pkgname}.install

prepare() {
    cd "$srcdir/wingpro-$_wingver-linux-x64"
    sed -i 's/python/python2/' wing-install.py
}

package() {
    cd "$srcdir/wingpro-$_wingver-linux-x64"
    ./wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    # Correct the WINGHOME environment variable
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing

    # Correct ARCH environment variable
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wingide/bootstrap/run-wing.sh
    # Fix a bug in the script
    sed -i "s|'x86_64'\]|'x86_64' \]|" ${pkgdir}/opt/wingide/bootstrap/run-wing.sh

    # Copy over patch (if any)
    if [ -d ../patches ]; then
        cp -r ../patches ${pkgdir}/opt/${pkgname}/.
    fi

    # remove refrence to ${pkgdir}
    sed -i "s,${pkgdir},,g" "${pkgdir}/opt/wingide/file-list.txt"

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

