# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=6.0.7
_wingrel=1
_wing_patch_lvl=23 #bump this when adding a patch
pkgver=$_wingver.$_wingrel.$_wing_patch_lvl
pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('x86_64')
_wingpatch=("fix-vi-mark-ranges-6.0.7p1-all.tar" "remote-healing-6.0.7p2-all.tar" "optimize-recent-6.0.7p3-all.tar" "fix-exit-failure-6.0.7p6-all.tar" "fix-debug-stop-6.0.7p5-all.tar" "fix-auto-perspectives-6.0.7p4-all.tar")
_patch_url_prefix=http://wingware.com/pub/$pkgname/$_wingver/patches/
_wingpatch=( "${_wingpatch[@]/#/$_patch_url_prefix}" )
source=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-x86_64-linux.tar.bz2" ${_wingpatch[*]})
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums=('f3ed3fec851faab4ad3a9fe822151cfe'
         '3f173e4b04f7cfdab3dc66a8a54613b7'
         'bd4739f28056900fd3c9797f43f6ee28'
         '47cc2e08696830188ba5ec145361e032'
         '84b4d1f65a60fb310e3caee093714e8e'
         'af58e6f1e4a6c73d6062645a4db75ee7'
         'dd54becbc042e853e27fc5a52bdce411')

install=${pkgname}.install

prepare() {
    cd "$srcdir/$pkgname-$_wingver-$_wingrel-x86_64-linux"
    sed -i 's/python/python2/' wing-install.py
}

package() {
    cd "$srcdir/$pkgname-$_wingver-$_wingrel-x86_64-linux"
    ./wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

    # Correct the WINGHOME environment variable
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wingdbstub.py
    sed -i "s|${pkgdir}||" ${pkgdir}/opt/${pkgname}/wing

    # Correct ARCH environment variable
    sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wingide/run-wing.sh
    # Fix a bug in the script
    sed -i "s|'x86_64'\]|'x86_64' \]|" ${pkgdir}/opt/wingide/run-wing.sh

    # Copy over patch (if any)
    if [ -d ../patches ]; then
        cp -r ../patches ${pkgdir}/opt/${pkgname}/.
    fi

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

