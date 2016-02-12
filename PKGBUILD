# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=wingide
_wingver=5.1.9
_wingrel=1
pkgver=$_wingver.$_wingrel
pkgrel=2
epoch=1 #bump this when adding a new patch
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
[ "$CARCH" = 'i686' ] && _pkgarch=i386
[ "$CARCH" = 'x86_64' ] && _pkgarch=x86_64
_wingpatch_x86_64=("completer-fix-5.1.9p1-all.tar" "fix-rep-compare-5.1.9p2-all.tar")
_wingpatch_i686=("completer-fix-5.1.9p1-all.tar" "fix-rep-compare-5.1.9p2-all.tar")
_patch_url_prefix=http://wingware.com/pub/$pkgname/$_wingver/patches/
if [[ ! -z "$_wingpatch_x86_64" ]]; then
    _wingpatch_x86_64=( "${_wingpatch_x86_64[@]/#/$_patch_url_prefix}" )
fi
if [[ ! -z "$_wingpatch_i686" ]]; then
    _wingpatch_i686=( "${_wingpatch_i686[@]/#/$_patch_url_prefix}" )
fi
source_x86_64=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-x86_64-linux.tar.gz" $_wingpatch_x86_64)
source_i686=("http://wingware.com/pub/$pkgname/$_wingver/$pkgname-$_wingver-$_wingrel-i386-linux.tar.gz" $_wingpatch_i686)
depends=('hicolor-icon-theme' 'libpng' 'python2' 'xdg-utils')
options=(!strip !emptydirs)
md5sums_i686=('faa0e3886822334aa915fee36b8b6392'
              '4715939cdbf494f4993b5e97ffacda55')
md5sums_x86_64=('c02ef6cecd3394ed14947c49176b8fb1'
                '4715939cdbf494f4993b5e97ffacda55')
install=${pkgname}.install

prepare() {
    cd "$srcdir/$pkgname-$_wingver-$_wingrel-$_pkgarch-linux"
    sed -i 's/python/python2/' wing-install.py
}

package() {
    cd "$srcdir/$pkgname-$_wingver-$_wingrel-$_pkgarch-linux"
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
