# Maintainer: Maksym Polishchuk <mpolishchuck[at]gmail[dot]com>

pkgbase=eusw
pkgname=(
    "${pkgbase}"
    "${pkgbase}-npapi-plugin"
    "${pkgbase}-nmh-manifest"
    "${pkgbase}-pcsc-driver"
)
pkgver=1.3.1.83
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="https://iit.com.ua"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('execstack')

if [[ $CARCH = i686 ]]; then
    _src_md5sum='260f3d6cec2aa7a8ba3e37bb18fb48f9'
    _srcuri_filename='euswi.tar'
    _src_filename="eusw_${pkgver}_i386.tar"
else
    _src_md5sum='76044397a5a5787c39c7760debf4efd1'
    _srcuri_filename='euswi.64.tar'
    _src_filename="eusw_${pkgver}_amd64.tar"
fi

source=(
    "${_src_filename}::https://iit.com.ua/download/productfiles/${_srcuri_filename}"
    'chrome.ua.com.iit.eusign.nmh.json'
    'mozilla.ua.com.iit.eusign.nmh.json'
    'NO-LICENSE'
)
noextract=("${_src_filename}")
md5sums=(
    "${_src_md5sum}"
    '64ed17e9ee22c1cbd05593131c492f33'
    '9d9c48e1078d3c58a3d82b216ff98cbc'
    '9a35d24d8c91d1cdf8b9b4b306aa178d'
)

package_eusw() {
    pkgdesc="IIT End User CA-1. Sign (web). Base program."
    depends=('glibc' 'gcc-libs')
    backup=(
        'opt/iit/eu/sw/osplm.ini'
    )

    msg2 "Extracting the ${_src_filename}..."
    bsdtar -xf "${_src_filename}" -C "$pkgdir/"

    # Moving udev rules file under /usr/lib.
    mkdir -p ${pkgdir}/usr/lib/udev/rules.d
    mv ${pkgdir}/etc/udev/rules.d/60-iit-e-keys.rules ${pkgdir}/usr/lib/udev/rules.d/60-iit-e-keys.rules
    rmdir ${pkgdir}/etc/udev/rules.d
    rmdir ${pkgdir}/etc/udev
    rmdir ${pkgdir}/etc
    # Fixing permissions of udev rules file
    chmod a-x ${pkgdir}/usr/lib/udev/rules.d/60-iit-e-keys.rules

    # Removing 'execstack' flag from the lib.
    # Since GLIBC 2.41 that lib cannot be loaded because it has 'execstack' flag.
    # However, it seems like that lib actually does not do code excution from stack.
    # At least it works when we remove the flag.
    execstack -c ${pkgdir}/opt/iit/eu/sw/libav337p11d.so

    # Removing install/uninstall scripts
    rm ${pkgdir}/opt/iit/eu/sw/install.sh
    rm ${pkgdir}/opt/iit/eu/sw/uninstall.sh

    # Install license information file
    install -Dm644 "${srcdir}/NO-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NO-LICENSE"
}

package_eusw-npapi-plugin() {
    pkgdesc="IIT End User CA-1. Sign (web). NPAPI plugin."
    depends=("${pkgbase}")

    mkdir -p ${pkgdir}/usr/lib/mozilla/plugins
    ln -s /opt/iit/eu/sw/npeuscp.so ${pkgdir}/usr/lib/mozilla/plugins/npeuscp.so

    # Install license information file
    install -Dm644 "${srcdir}/NO-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NO-LICENSE"
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

    # Install license information file
    install -Dm644 "${srcdir}/NO-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NO-LICENSE"
}

package_eusw-pcsc-driver() {
    pkgdesc="IIT End User CA-1. Sign (web). PC/SC driver(s)."
    depends=("${pkgbase}" 'pcsclite')

    mkdir -p ${pkgdir}/usr/lib
    ln -s /opt/iit/eu/sw/libav337p11d.so ${pkgdir}/usr/lib/libav337p11d.so

    # Install license information file
    install -Dm644 "${srcdir}/NO-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NO-LICENSE"
}
