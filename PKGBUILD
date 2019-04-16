pkgname=globus-connect-personal
_pkgname=globusconnectpersonal
pkgver=2.3.6
pkgrel=1
pkgdesc="Globus Connect Personal turns your laptop or other personal computer into a Globus endpoint with a just a few clicks."
arch=('x86_64' 'i686')
url="https://www.globus.org/globus-connect-personal"
license=('Apache')
depends=('python2' 'libtool')
depends_i686=('zlib')
depends_x86_64=('pam')
optdepends=('tk: for GUI')
install=$pkgname.install
source=("https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-$pkgver.tgz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname@.service"
        "globusconnect")
sha256sums=('71f84e46cf1b0607d0db45ee98542dd1ffd6745fdc49ce0fa8b7bd9a264088ca'
            'e02212562b046dbe6d92e9a0ecd9aead22c6fec85a525a4e7c05451b1d76aec1'
            '211cca27d2e2fa963606d1d29ceb2d71b333cc33de9a85821d5c85aac36a4a9e'
            'a33e11761644011264a467d3ecf90147fed308b33e8915569cc4d65b2089ff2b'
            'd5fdbd95707bce40f1e6db29f528328eeb03f364aa33d2021a03b01f6174f916')

prepare() {
    cd "$_pkgname-$pkgver"
    # patch to use python2
    for file in setup.py gc.py gc-ctrl.py; do
        sed -E -i 's#/usr/bin/python#/usr/bin/python2#g' "$file"
    done
}

package() {
    cd "$_pkgname-$pkgver"

    # Remove lib for other arch
    if [[ $CARCH = "x86_64" ]]; then
        rm -rf gt_i386
    else
        rm -rf gt_amd64
    fi

    local targetdir=$pkgdir/usr/lib/$_pkgname
    install -d $targetdir
    cp -dr --preserve=mode,timestamp . $targetdir

    install -m 755 -D -t $pkgdir/usr/bin/ $srcdir/globusconnect
    install -m 644 -D -t $pkgdir/usr/lib/systemd/user/ $srcdir/globus-connect-personal.service
    install -m 644 -D -t $pkgdir/usr/lib/systemd/system/ $srcdir/globus-connect-personal@.service
}
