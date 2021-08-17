# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.0.7
pkgrel=3
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('custom')
url="https://zep.disig.sk/"
source_i686=('https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer.ubuntu_i386.deb')
source_x86_64=('https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer.ubuntu_amd64.deb')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"


pkgver() {
	# Match Debian package version
	ar p ${srcdir}/disig-web-signer.ubuntu_${upstream_arch}.deb control.tar.gz | tar -Oxz ./control | grep ^Version: | cut -f2 -d" " | tr -d '[:space:]' | cut -f1 -d"-"
}

package() {
    depends=("glibc" "gcc-libs" "mesa" "qt5-base" "qt5-websockets")

    ar p ${srcdir}/disig-web-signer.ubuntu_${upstream_arch}.deb data.tar.xz | tar -xJ -C "${pkgdir}"

    # Create a native messaging host for Google Chrome browser and Chromium; this is done by a postinst script in upstream deb package
    mkdir -p ${pkgdir}/etc/opt/chrome/native-messaging-hosts ${pkgdir}/etc/chromium/native-messaging-hosts
    for file in ${pkgdir}/opt/disig/websigner/chrome/sk.disig.websigner.*.json ; do
        ln -sf "${file}" ${pkgdir}/etc/opt/chrome/native-messaging-hosts/
        ln -sf "${file}" ${pkgdir}/etc/chromium/native-messaging-hosts/
    done
}
