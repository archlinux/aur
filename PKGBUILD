# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>

pkgname=eusw
pkgver=1.3.1.55
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="https://iit.com.ua"
arch=('i686' 'x86_64')
backup=(
    'opt/iit/eu/sw/osplm.ini'
    'etc/udev/rules.d/60-iit-e-keys.rules'
)

if [[ $CARCH = i686 ]]; then
    _src_md5sum='e095a4a91dffe370e933d4482dc2f711'
    _srcuri_filename='euswi.tar'
    _src_filename="eusw_${pkgver}_i386.tar"
else
    _src_md5sum='3081d8838cd9cfe0c987ce8c10cd22a7'
    _srcuri_filename='euswi.64.tar'
    _src_filename="eusw_${pkgver}_amd64.tar"
fi

source=(
    "${_src_filename}::https://iit.com.ua/download/productfiles/${_srcuri_filename}"
    'chrome.ua.com.iit.eusign.nmh.json'
    'mozilla.ua.com.iit.eusign.nmh.json'
)
noextract=("${_src_filename}")
md5sums=(
    "${_src_md5sum}"
    '64ed17e9ee22c1cbd05593131c492f33'
    '9d9c48e1078d3c58a3d82b216ff98cbc'
)

package() {
    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf "${_src_filename}" -C "$pkgdir/"

    mkdir -p ${pkgdir}/usr/lib/mozilla/plugins
    ln -s /opt/iit/eu/sw/npeuscp.so ${pkgdir}/usr/lib/mozilla/plugins/npeuscp.so

    # Installing native messaging host manifest (Chrome)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/opt/chrome/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Chromium)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/chromium/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Mozilla)
    install -Dm644 ${srcdir}/mozilla.ua.com.iit.eusign.nmh.json ${pkgdir}/usr/lib/mozilla/native-messaging-hosts/ua.com.iit.eusign.nmh.json

    # Fixing permissions of udev rules file
    chmod a-x ${pkgdir}/etc/udev/rules.d/60-iit-e-keys.rules

    rm ${pkgdir}/opt/iit/eu/sw/install.sh
    rm ${pkgdir}/opt/iit/eu/sw/uninstall.sh
}
