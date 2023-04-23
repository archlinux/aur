# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>

pkgbase=eusw
pkgname=(
    "${pkgbase}"
    "${pkgbase}-npapi-plugin"
    "${pkgbase}-nmh-manifest"
    "${pkgbase}-pcsc-driver"
)
pkgver=1.3.1.59
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="https://iit.com.ua"
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
    _src_md5sum='65696881544cf85185ceb5aae3e532d8'
    _srcuri_filename='euswi.tar'
    _src_filename="eusw_${pkgver}_i386.tar"
else
    _src_md5sum='a176ab3257797df3094a0f4c291dd52d'
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

package_eusw() {
    pkgdesc="IIT End User CA-1. Sign (web). Base program."
    depends=('glibc' 'gcc-libs')
    backup=(
        'opt/iit/eu/sw/osplm.ini'
        'etc/udev/rules.d/60-iit-e-keys.rules'
    )

    msg2 "Extracting the ${_src_filename}..."
    bsdtar -xf "${_src_filename}" -C "$pkgdir/"

    # Fixing permissions of udev rules file
    chmod a-x ${pkgdir}/etc/udev/rules.d/60-iit-e-keys.rules

    # Removing install/uninstall scripts
    rm ${pkgdir}/opt/iit/eu/sw/install.sh
    rm ${pkgdir}/opt/iit/eu/sw/uninstall.sh
}

package_eusw-npapi-plugin() {
    pkgdesc="IIT End User CA-1. Sign (web). NPAPI plugin."
    depends=("${pkgbase}")

    mkdir -p ${pkgdir}/usr/lib/mozilla/plugins
    ln -s /opt/iit/eu/sw/npeuscp.so ${pkgdir}/usr/lib/mozilla/plugins/npeuscp.so
}

package_eusw-nmh-manifest() {
    pkgdesc="IIT End User CA-1. Sign (web). Native Messaging Host manifest."
    depends=("${pkgbase}")

    # Installing native messaging host manifest (Chrome)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/opt/chrome/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Chromium)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/chromium/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Mozilla)
    install -Dm644 ${srcdir}/mozilla.ua.com.iit.eusign.nmh.json ${pkgdir}/usr/lib/mozilla/native-messaging-hosts/ua.com.iit.eusign.nmh.json
}

package_eusw-pcsc-driver() {
    pkgdesc="IIT End User CA-1. Sign (web). PC/SC driver(s)."
    depends=("${pkgbase}" 'pcsclite')

    mkdir -p ${pkgdir}/usr/lib
    ln -s /opt/iit/eu/sw/libav337p11d.so ${pkgdir}/usr/lib/libav337p11d.so
}
