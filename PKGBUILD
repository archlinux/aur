# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=6.1.2
_wingrel=1
_wing_patch_lvl=3 #bump this when adding a patch
pkgver=$_wingver.$_wingrel.$_wing_patch_lvl
pkgrel=1
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('x86_64')

_wingpatch=("fix-new-venv-6.1.2p1-all.tar" "fix-goto-defn-6.1.2p4-all.tar" "fix-activation-6.1.2p2-all.tar" "fix-sassist-links-6.1.2p6-all.tar" "fix-autocomplete-lockup-6.1.2p7-all.tar")
_patch_url_prefix=http://wingware.com/pub/$pkgname/$_wingver/patches/
_wingpatch=( "${_wingpatch[@]/#/$_patch_url_prefix}" )
source=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-x86_64-linux.tar.bz2" ${_wingpatch[*]})
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums=('c64255d62885498ac20513cafd7527c3'
         'cf1a2166c7a3605264d22269b346fb7d'
         'd691d2b46be9d0723b2c9742b89f9506'
         '67f6cf80f5b8031a6ace081b38e28286'
         '2e337be8917cbd6d7692f974c95888ad'
         '67926f2b3ad03cde727f66078455e8b7')

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

    # remove refrence to ${pkgdir}
    sed -i "s,${pkgdir},,g" "${pkgdir}/opt/wingide/file-list.txt"

    # Correct the file permissions
    chown -R root:root "${pkgdir}/opt/${pkgname}"
    chmod +x ${pkgdir}/opt/${pkgname}/resources/linux/desktop/install-linux-desktop.sh
    # Install the LICENSE
    install -D -m 644 "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

