# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.1.1
_upstream_pkgrel=1
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}.ubuntu_amd64.deb")
source_i686=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}.ubuntu_i386.deb")
sha256sums_x86_64=('2eebf5eae8d536e6b258245f0581f05d49473b89222215b8e6013341c66b6444')
sha256sums_i686=('3f6ae031ce3035626e9d8b91f8865f895f4ef1d1b28ad2e1a670ed2c19179846')
options=("!strip")

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"

package() {
    depends=("glibc" "gcc-libs" "mesa" "qt5-base" "qt5-websockets" "openssl-1.1")

    ar p "${srcdir}/disig-web-signer_${pkgver}-${_upstream_pkgrel}.ubuntu_${upstream_arch}.deb" data.tar.xz | tar -xJ -C "${pkgdir}"

    # Create a native messaging host for Google Chrome browser and Chromium; this is done by a postinst script in upstream deb package
    mkdir -p ${pkgdir}/etc/opt/chrome/native-messaging-hosts ${pkgdir}/etc/chromium/native-messaging-hosts
    for file in ${pkgdir}/opt/disig/websigner/chrome/sk.disig.websigner.*.json ; do
        ln -sf "${file}" ${pkgdir}/etc/opt/chrome/native-messaging-hosts/
        ln -sf "${file}" ${pkgdir}/etc/chromium/native-messaging-hosts/
    done
}
