pkgname=globus-connect-personal
_pkgname=globusconnectpersonal
pkgver=3.2.8
pkgrel=1
pkgdesc="Globus Connect Personal turns your laptop or other personal computer into a Globus endpoint with a just a few clicks."
arch=('x86_64')
url="https://www.globus.org/globus-connect-personal"
license=('Apache')
depends=('python' 'libtool' 'openssl')
optdepends=(
	'tk: for GUI'
	'tcllib: for GUI'
)
install=$pkgname.install
source=("https://downloads.globus.org/globus-connect-personal/v3/linux/stable/globusconnectpersonal-${pkgver}.tgz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname@.service"
        "globusconnect")
sha256sums=('954e03923a98f21f62f62268f1f3771be990c9c0c4e3594043f53e6ad0924c3b'
            'eb12fd5d5d4e111f8a45af5f9ea803203f5c91a513287ba2d15547321fb7a59a'
            '211cca27d2e2fa963606d1d29ceb2d71b333cc33de9a85821d5c85aac36a4a9e'
            'a33e11761644011264a467d3ecf90147fed308b33e8915569cc4d65b2089ff2b'
            '8c0de73bccd4484d29592168b0719516c56ed0f96351d7565a0c59bc45e6be85')

package() {
    cd "$_pkgname-$pkgver"

    # Use system TCL instead of incompatible tclkit
    sed -i 's|./tclkit|tclsh|' globusconnectpersonal
    rm tclkit

    local targetdir=$pkgdir/usr/lib/$_pkgname
    install -d $targetdir
    cp -dr --preserve=mode,timestamp . $targetdir

    install -m 755 -D -t $pkgdir/usr/bin/ $srcdir/globusconnect
    install -m 644 -D -t $pkgdir/usr/lib/systemd/user/ $srcdir/globus-connect-personal.service
    install -m 644 -D -t $pkgdir/usr/lib/systemd/system/ $srcdir/globus-connect-personal@.service
}
