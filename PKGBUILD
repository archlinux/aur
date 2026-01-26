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

depends=('dbus' 'ghostscript' 'glibc' 'glib2' 'hicolor-icon-theme' 'iproute2'
         'libasyncns' 'libcap' 'libsndfile' 'libx11' 'libxcb' 'libxcrypt-compat'
         'nspr' 'nss' 'pam' 'procps-ng' 'python' 'python-gobject' 'rtkit'
         'smtp-forwarder' 'systemd' 'xdg-utils' 'xorg-xauth' 'zlib' 'python-gssapi'
         'python-six' 'gtk3' 'gdk-pixbuf2' 'python-cairo' 'pango' 'python-numpy' 'xorg-xhost' 
         'xdg-utils')
optdepends=('apache: Web integration'
            'mod_nss: Web integration'
            'python-markdown: Web integration'
            'python-pygments: Web integration'
            'nfs-utils: Local drive redirection'
            'python-ldap: LDAP integration tools',
            'libpulse: Audio redirection',
            'libcups: Printer redirection',
            'krb5: Kerberos integration')

_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip::https://www.cendio.com/downloads/server/tl-${pkgver}-server.zip"
	'LICENSE')
sha256sums=('767fc47c46857b37ad70faefd36342ae8ddd4d44d8a1c30002340c4d7d517c56'
	    '179583f1e2f61a9a75a99bbe8bb988e35a0216fc2ddcbd4c85ad8bdc70c3149e')

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
    
    cd "$srcdir"
    install -Dm644 LICENSE             "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
