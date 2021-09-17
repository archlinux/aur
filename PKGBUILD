# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=thinlinc-server
pkgver=4.13.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('i686' 'x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('dbus' 'ghostscript' 'glibc' 'hicolor-icon-theme' 'iproute2' 'krb5'
         'libasyncns' 'libcap' 'libsndfile' 'libx11' 'libxcb' 'libxcrypt' 'nspr'
         'nss' 'pam' 'procps-ng' 'python' 'python-gobject' 'rtkit'
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
sha256sums=('fcf7869079e80d1b5c97ebf2f8fcd7d3edb9c8af051c4dd539bd31275d1e9d87'
            '179583f1e2f61a9a75a99bbe8bb988e35a0216fc2ddcbd4c85ad8bdc70c3149e'
            '8e70ef23f9716dcb100eba660932e7f5d05351d63074fb262cf925812dbdbb63'
            '5a92c5beac6c64487debd92a4d94b56074b9f9b0cd38d154a14a320105f3bccd'
            '292e6ef1295f329ab95d1d16c5bf7286f5c5c288d6637d0d736b9a144e85449d'
            'a1fe20c565e7e468407d73a0f59c8c352318a7e4c8e85fe068d89cbb0afd5e71')

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
