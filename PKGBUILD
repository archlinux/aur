# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=6.0.12
_wingrel=1
_wing_patch_lvl=3 #bump this when adding a patch
pkgver=$_wingver.$_wingrel.$_wing_patch_lvl
pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('x86_64')

_wingpatch=("fix-remotely-stored-projects-6.0.12p1-all.tar" "fix-vi-visual-bc-6.0.12p2-all.tar" "fix-matplotlib-debug-6.0.12p3-all.tar" "fix-logging-exc-6.0.12p4-all.tar" "avoid-lic-notify-6.0.12p5-all.tar")
_patch_url_prefix=http://wingware.com/pub/$pkgname/$_wingver/patches/
_wingpatch=( "${_wingpatch[@]/#/$_patch_url_prefix}" )
source=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-x86_64-linux.tar.bz2" ${_wingpatch[*]})
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums=('74a72215aa827fe19049bea5d24382cc'
         '8ab32b0c575907db9603e6ed52b4fe69'
         'caef531adab241abc9349259a82a5cf6'
         '1bd037a9f2b4b1ce3fc9d3a2e1c3213a'
         '3dd2a8fbec556973b2b432a085f2bb7d'
         'c89995b2b11c11bc03064d7f7b69f562')

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

