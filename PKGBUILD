# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.11.0.16_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
_date=$(date +%Y%m%d)
options=(!strip)
install=expressvpn.install
source=("license-${_date}.html::https://www.expressvpn.com/vpn-software/vpn-linux/open-source")
_url="https://www.expressvpn.works/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums=('SKIP')

sha512sums_x86_64=('cc9c9f346d35b46fc61892478e4252f16fc10d348c0321caebf38912f87700857d8ff19846560e4095999419993eb055a2500e39b9852eb63bb4c91189dca98d'
                   'SKIP')
sha512sums_i686=('bdd4705c1be9985e542bb4fd339b582cf2908fe108644fe0a2793c4018c526bb142db728784e0ab515ffb67a95d1590879c37c158145999012c377e7d113bf6c'
                 'SKIP')
sha512sums_armv7h=('4ba8480f0cea9c04f89300e307f8bbdbe5291de4bc4ff616ff62802845cb7160224e76610500ff1c9b8247f769e7d454de458d293f5380cb45c705f7c8c9ab99'
                   'SKIP')


validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it. Upstream also install files to both /lib and /usr/lib
    # merge these and move to correct location
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:" -s ":/usr/lib:/lib:"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -Dm644 "${srcdir}/license-${_date}.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -dm755 "${pkgdir}/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"
}
