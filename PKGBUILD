# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

# PRE-BUILD INSTRUCTIONS:
# -----------------------
#
# Replace the dummy tl-4.8.0-server.zip in the same directory
# as the PKGBUILD with the real thing.  Download it from here:
# https://www.cendio.com/thinlinc/download

pkgname=thinlinc-server
pkgver=4.8.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop server"
arch=('i686' 'x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('python2' 'net-tools' 'procps-ng' 'xorg-xauth' 'pcsclite'
         'java-environment' 'nspr' 'nss' 'ghostscript' 'postfix'
         'ncurses5-compat-libs' 'pulseaudio' 'xdg-utils')
optdepends=('nfs-utils: Local drive redirection'
            'python2-ldap: LDAP integration tools'
            'apache: Web integration'
            'mod_nss: Web integration')

_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip"
        'LICENSE')
sha256sums=('73437ea15b12f26fb29a6788c8232675ad161cf5e49af4cb8043b8b8c60947d7'
            '179583f1e2f61a9a75a99bbe8bb988e35a0216fc2ddcbd4c85ad8bdc70c3149e')

_extract_dir="extract"

build()
{
    cd "${srcdir}/${_archive_name}/packages"
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm *noarch*rpm; do
        bsdtar -C "${_extract_dir}" -xf "${rpm}"
    done

    cd "${_extract_dir}"
    [[ "$CARCH" == "x86_64" ]] && mkdir "usr" && mv "lib64" "usr/lib"
    rm -Rf "etc/init.d"
}

package()
{
    cd "${srcdir}/${_archive_name}/packages/${_extract_dir}"
    cp -aR * "${pkgdir}"

    cd "$srcdir"
    install -Dm644 LICENSE             "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 tlwebaccess.service "$pkgdir"/usr/lib/systemd/system/tlwebaccess.service
    install -Dm644 tlwebadm.service    "$pkgdir"/usr/lib/systemd/system/tlwebadm.service
    install -Dm644 vsmagent.service    "$pkgdir"/usr/lib/systemd/system/vsmagent.service
    install -Dm644 vsmserver.service   "$pkgdir"/usr/lib/systemd/system/vsmserver.service
}
