# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=thinlinc-server
pkgver=4.15.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('dbus' 'ghostscript' 'glibc' 'hicolor-icon-theme' 'iproute2' 'krb5'
         'libasyncns' 'libcap' 'libsndfile' 'libx11' 'libxcb' 'libxcrypt-compat'
         'nspr' 'nss' 'pam' 'procps-ng' 'python' 'python-gobject' 'rtkit'
         'smtp-forwarder' 'systemd' 'xdg-utils' 'xorg-xauth' 'zlib' 'python-gssapi'
         'python-six' 'gtk3' 'python-cairo' 'pango' 'python-numpy' )
optdepends=('apache: Web integration'
            'mod_nss: Web integration'
            'python-markdown: Web Integration'
            'python-pygments: Web Integration'
            'nfs-utils: Local drive redirection'
            'python-ldap: LDAP integration tools',
            'libpulse: Audio redirection',
            'libcups: Printer redirection')

_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip::https://www.cendio.com/downloads/server/tl-${pkgver}-server.zip"
        'LICENSE'
        'tlwebaccess.service'
        'tlwebadm.service'
        'vsmagent.service'
        'vsmserver.service')
sha256sums=('a0d19a66b53e9015e81acab8add05157410efe3b73637e9588cf894db21c7826'
            '179583f1e2f61a9a75a99bbe8bb988e35a0216fc2ddcbd4c85ad8bdc70c3149e'
            '3d59ff1c0db479fc4266d67916c9f64050e061b874ccca79a2ac3894f4ba6e25'
            'ff22ea3833eedb4338eeab6d5ce10fa823b9c78ebab1d47152c073075a6ddeb1'
            '43db698879addc8fc7d54d554a50cabcdc753fbb3d95cf890c0178b4c3db3254'
            '26bcc6f900078c80f30f5092ef8d6b7215dd67c90dcae3cc274a5db463b9c5b9')

_extract_dir="extract"

build()
{
    cd "${srcdir}/${_archive_name}/packages"
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm; do
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
