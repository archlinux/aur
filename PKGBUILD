# Maintainer: aeneby <aaron (at) sowry (dot) nz>
# Contributor: Phhere <p.rehs (at) gmx (dot) net>
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=thinlinc-server
pkgver=4.20.1
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('x86_64')
url="https://cendio.com"
license=('custom')
install=${pkgname}.install
options=(!debug)

depends=('gcc-libs' 'ghostscript' 'glibc' 'gtk3' 'iproute2' 'krb5' 'libx11'
         'libxcrypt-compat' 'msmtp-mta' 'nss' 'nspr' 'pam' 'procps-ng'
         'python-cairo' 'python-gobject' 'python-six' 'systemd' 'xorg-xauth'
         'xorg-xhost' 'zlib')

optdepends=('cups: printer redirection'
            'nfs-utils: local drive redirection'
            'openssh: native client support'
            'python-ldap: LDAP integration')

source=("https://www.cendio.com/downloads/server/tl-${pkgver}-server.zip")

sha256sums=('4a7f217ccff9ff58606e3867e1fd0c951762752d2623bfedc3282d653803e9ac')

prepare() {
    cd "${srcdir}/tl-${pkgver}-server/packages"
    mkdir -p extract

    for rpm in *${CARCH}*rpm; do
        bsdtar -C extract -xf "${rpm}"
    done
}

package() {
    cd "${srcdir}/tl-${pkgver}-server/packages/extract"
    cp -aR etc/ opt/ usr/ var/ "$pkgdir"

    install -dm755 "$pkgdir"/usr/lib
    cp -af usr/lib64/libnss_passwdaliases.so.2 "$pkgdir"/usr/lib

    cd "$srcdir/tl-${pkgver}-server"
    cp -aR libs/etc/* "$pkgdir"/etc
    cp -aR libs/libexec/* "$pkgdir"/opt/thinlinc/libexec
    cp -aR libs/modules/* "$pkgdir"/opt/thinlinc/modules
    cp -aR libs/share/* "$pkgdir"/opt/thinlinc/share
    rm -rf "$pkgdir/usr/lib64"
    ln -s "/opt/thinlinc/modules" "$pkgdir/usr/lib/$pkgname"
    chmod u+s "$pkgdir"/opt/thinlinc/libexec/tl-mount-personal
    
    install -Dm644 "$srcdir/tl-${pkgver}-server/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
