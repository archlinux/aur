# Maintainer: c3rt1fiedd <slitchio0@gmail.com>
# Last Packager: Grey Christoforo

pkgname=wingide
pkgver=11.1.0.0
pkgrel=1
pkgdesc="Wing IDE Professional is a full-featured Python IDE for professional programmers."
arch=('x86_64')
url="https://wingware.com"
license=('custom')
depends=('hicolor-icon-theme' 'xdg-utils' 'python') # Removed python2
options=(!strip !emptydirs)
source=("https://wingware.com/pub/wingpro/${pkgver%.*}.0/wingpro-11.1.0.0-linux-x64.tar.bz2")
sha256sums=('SKIP') # Run 'updpkgsums' to populate this automatically

package() {
    cd "$srcdir/wingpro-$pkgver-linux-x64"
    
    # Wing's installer script now defaults to Python 3
    ./wing-install.py \
        --install-binary \
        --winghome "${pkgdir}/opt/${pkgname}" \
        --bin-dir "${pkgdir}/usr/bin" > /dev/null 2>&1

    # Fix hardcoded paths in the installed scripts
    sed -i "s|${pkgdir}||g" "${pkgdir}/opt/${pkgname}/wingdbstub.py"
    sed -i "s|${pkgdir}||g" "${pkgdir}/opt/${pkgname}/wing"
    
    # Modern Wing versions usually handle ARCH/uname better, 
    # but we'll keep the cleanup for the file list
    if [ -f "${pkgdir}/opt/${pkgname}/file-list.txt" ]; then
        sed -i "s|${pkgdir}||g" "${pkgdir}/opt/${pkgname}/file-list.txt"
    fi

    # Install the LICENSE
    # install -D -m 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
