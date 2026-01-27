# Maintainer: aeneby <aaron (at) sowry (dot) nz>
# Contributor: Phhere <p.rehs (at) gmx (dot) net>
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=thinlinc-server
pkgver=4.18.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('gcc-libs' 'ghostscript' 'glibc' 'gtk3' 'iproute2' 'krb5' 'libx11'
         'libxcrypt-compat' 'msmtp-mta' 'nss' 'nspr' 'pam' 'procps-ng'
         'python-cairo' 'python-gobject' 'python-six' 'systemd' 'xorg-xauth'
         'xorg-xhost' 'zlib')

optdepends=('cups: printer redirection'
            'nfs-utils: local drive redirection'
            'openssh: native client support'
            'python-ldap: LDAP integration')

_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip::https://www.cendio.com/downloads/server/tl-${pkgver}-server.zip")

sha256sums=('767fc47c46857b37ad70faefd36342ae8ddd4d44d8a1c30002340c4d7d517c56')

_extract_dir="extract"

prepare()
{
    cd "${srcdir}/${_archive_name}/packages"
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm; do
        bsdtar -C "${_extract_dir}" -xf "${rpm}"
    done

}



package()
{
    cd "${srcdir}/${_archive_name}/packages/${_extract_dir}"
    rm -Rf "etc/init.d"
    cp -aR etc/ opt/ usr/ var/ "$pkgdir"

    install -dm755 "$pkgdir"/usr/lib
    #cp -aR libs/* "$pkgdir"/usr/lib

    cd "$srcdir/${_archive_name}"
    cp -aR libs/etc/* "$pkgdir"/etc
    cp -aR libs/libexec/tl-ssh* "$pkgdir"/opt/thinlinc/bin
    cp -aR libs/modules/* "$pkgdir"/opt/thinlinc/modules/
    cp -aR libs/share/* "$pkgdir"/usr/share/
    rm -rf "$pkgdir/usr/lib64/"
    rm -rf "$pkgdir/usr/lib/.build-id"
    ln -s "/opt/thinlinc/modules" "$pkgdir/usr/lib/$pkgname"
    
    install -Dm644 "$srcdir/tl-${pkgver}-server/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
