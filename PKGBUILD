# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='kinect-audio-setup'
pkgver=0.5
pkgrel=1
pkgdesc='Tools to download and apply USB Audio Class firmware for Kinect and use it as microphone'
arch=('x86_64' 'i686')
url='https://git.ao2.it/kinect-audio-setup.git'
license=('WTFPL' 'BSD')
depends=('wget' 'p7zip>=9.20')
makedepends=('make' 'gcc')
install="${pkgname}.install"

source=("git+${url}#tag=v${pkgver}"
        'improved-fetch.patch'
	    '55-kinect-audio.rules'
	    'LICENSE')
sha256sums=('SKIP'
	        'a27b9e1cffd9c5f062fd15c494e12fdf8bc73e5ae590329bf40eabe16f731c79'
	        '8f9f343eeed07c59c65940f4a03814da5e2018cdbc331664bfacc2c98cd7d549'
	        'd23efd383bc03aa8cdeac33be24a9c915f05ad92d20f4070e7160bdcff7f4a8c')

prepare() {
	cd "$pkgname"
	patch -Np1 -i "${srcdir}/improved-fetch.patch"
}

build() {
    cd "${pkgname}/kinect_upload_fw"
    make kinect_upload_fw
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/kinect_upload_fw/kinect_upload_fw" "${pkgdir}/usr/bin/kinect_upload_fw"
    install -Dm755 "${srcdir}/${pkgname}/kinect_fetch_fw" "${pkgdir}/usr/bin/kinect_fetch_fw"
    install -Dm644 "${srcdir}/55-kinect-audio.rules" "${pkgdir}/usr/lib/udev/rules.d/55-kinect-audio.rules"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
