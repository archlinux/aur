# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=6.0.5
_wingrel=1
_wing_patch_lvl=2 #bump this when adding a patch
pkgver=$_wingver.$_wingrel.$_wing_patch_lvl
pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('x86_64')
_wingpatch=("fix-auto-arg-removal-6.0.5p1-all.tar" "fix-script-print-encoding-6.0.5p2-all.tar" "fix-logging-6.0.5p3-all.tar" "fix-remote-bps-6.0.5p4-all.tar" "fix-vi-mode-yy-6.0.5p5-all.tar")
_patch_url_prefix=http://wingware.com/pub/$pkgname/$_wingver/patches/
_wingpatch=( "${_wingpatch[@]/#/$_patch_url_prefix}" )
source=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-x86_64-linux.tar.bz2" ${_wingpatch[*]})
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums=('944c2edf81b7a681a9d0ab5dc528498c'
         '5c6ac15d903a67a3c2f62d8720ea7c25'
         '25ae8c72354f4798c7bb871d45bedb37'
         '117eec0e2ed0d062fcddbb9484170f53'
         '3a841c186a0c1f850acd5463c2f612b8'
         'aa5edf6eb1259b04def4a989632cf2ca')

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

