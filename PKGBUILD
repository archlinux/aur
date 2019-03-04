# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=1.1.5
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('custom')
url="https://zep.disig.sk/"
source_i686=('https://download.disigcdn.sk/cdn/products/websigner/disig-web-signer.debian_i386.deb')
source_x86_64=('https://download.disigcdn.sk/cdn/products/websigner/disig-web-signer.debian_amd64.deb')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")
install="disig-web-signer.install"

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"


pkgver() {
	# Match Debian package version
	ar p ${srcdir}/disig-web-signer.debian_${upstream_arch}.deb control.tar.gz | tar -Oxz ./control | grep ^Version: | cut -f2 -d" " | tr -d '[:space:]' | cut -f1 -d"-"
}

package() {
    depends=("glibc" "gcc-libs" "mesa" "qt5-base" "openssl-1.0")

    ar p ${srcdir}/disig-web-signer.debian_${upstream_arch}.deb data.tar.xz | tar -xJ -C "${pkgdir}"

    # Create a native messaging host for Google Chrome browser (as a link to Chromium version); this is done by a postinst script in upstream Debian package
    mkdir -p ${pkgdir}/etc/opt/chrome/native-messaging-hosts
    native_messaging_host_filename=$(basename $(find ${pkgdir}/etc/chromium/native-messaging-hosts/ -name sk.disig.websigner.*.java.json))
    ln -s /etc/chromium/native-messaging-hosts/${native_messaging_host_filename} ${pkgdir}/etc/opt/chrome/native-messaging-hosts

    # Let autostart configuration up to a user's discretion
    rm -r ${pkgdir}/etc/xdg

}
