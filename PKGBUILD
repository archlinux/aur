# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=thinlinc-server
pkgver=4.14.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('i686' 'x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('dbus' 'ghostscript' 'glibc' 'hicolor-icon-theme' 'iproute2' 'krb5'
         'libasyncns' 'libcap' 'libsndfile' 'libx11' 'libxcb' 'libxcrypt-compat'
         'nspr' 'nss' 'pam' 'procps-ng' 'python' 'python-gobject' 'rtkit'
         'smtp-forwarder' 'systemd' 'xdg-utils' 'xorg-xauth' 'zlib')
optdepends=('apache: Web integration'
            'mod_nss: Web integration'
            'nfs-utils: Local drive redirection'
            'python-ldap: LDAP integration tools')

_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip::https://www.cendio.com/downloads/server/download.py"
        'LICENSE'
        'tlwebaccess.service'
        'tlwebadm.service'
        'vsmagent.service'
        'vsmserver.service')
sha256sums=('c53f7c8721876f9e7e8f6c4e9cc748d8729091cc9f59fc5db97ea7a5af58a040'
            '179583f1e2f61a9a75a99bbe8bb988e35a0216fc2ddcbd4c85ad8bdc70c3149e'
            'fc06091345702b4fe264840307ec83579b82ea24000a920770249e631534bfa9'
            'ca00d5ef2cb79a86ac1e428fe20c0a967e61927fc9a0fa49ceb2b218484266d7'
            'a15240406eaa7f952acb76bf09e65e6aa33ab621f29ff02d6cc15a95f1e6c31b'
            'fe9174542170be990d7d4579b34e534bb1c0756d838665ff27173dbc3e5ac84e')

_extract_dir="extract"

build()
{
    cd "${srcdir}/${_archive_name}/packages"
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm *noarch*rpm; do
        bsdtar -C "${_extract_dir}" -xf "${rpm}"
    done

    cd "${_extract_dir}"
    rm -Rf "etc/init.d"
}

package()
{
    cd "${srcdir}/${_archive_name}/packages/${_extract_dir}"
    cp -aR etc/ opt/ usr/ var/ "$pkgdir"

    install -dm755 "$pkgdir"/usr/lib
    cp -aR lib64/* "$pkgdir"/usr/lib

    cd "$srcdir"
    install -Dm644 LICENSE             "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 tlwebaccess.service "$pkgdir"/usr/lib/systemd/system/tlwebaccess.service
    install -Dm644 tlwebadm.service    "$pkgdir"/usr/lib/systemd/system/tlwebadm.service
    install -Dm644 vsmagent.service    "$pkgdir"/usr/lib/systemd/system/vsmagent.service
    install -Dm644 vsmserver.service   "$pkgdir"/usr/lib/systemd/system/vsmserver.service
}
