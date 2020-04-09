# Maintainer: tinywrkb <tinywrkb@gmail.com>
#
# community/freerdp maintainer:
#   Sergej Pupykin <pupykin.s+arch@gmail.com>
#
# community/freerdp contributors:
#   David Runge <dvzrv@archlinux.org>
#   Stijn Segers <francesco dot borromini at gmail dot com>

_name=FreeRDP
_pkgname=freerdp
pkgname=freerdp-gstfree
pkgver=2.0.0
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=('x86_64')
url="http://www.freerdp.com/"
license=('Apache')
depends=('dbus-glib' 'glib2' 'glibc' 'gsm'
'lame' 'libcups' 'libjpeg-turbo' 'libgssglue' 'libsoxr' 'libusb' 'libxkbcommon'
'libxinerama' 'libxkbfile' 'libxrandr' 'mbedtls' 'openssl' 'pam' 'pcsclite'
'wayland')
makedepends=('alsa-lib' 'cmake' 'docbook-xsl' 'faac' 'faad2' 'ffmpeg' 'krb5'
'libpulse' 'systemd-libs' 'xmlto' 'xorgproto')
conflicts=('freerdp')
provides=('libwinpr-tools2.so' 'libfreerdp-client2.so' 'libfreerdp2.so'
'libwinpr2.so' 'freerdp')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver/_/-}.tar.gz")
sha512sums=('efdaa1b018e5166c0f2469663bdd0dc788de0577d0c0cb8b98048a535f8cb07de1078f86aaacc9445d42078d2e02fd7bc7f1ed700ca96032976f6bd84c68ee8f')

prepare() {
  cd "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_MBEDTLS=ON \
        -DWITH_PULSE=ON \
        -DWITH_CUPS=ON \
        -DWITH_PCSC=ON \
        -DWITH_JPEG=ON \
        -DWITH_GSM=ON \
        -DWITH_LAME=ON \
        -DWITH_FAAD2=ON \
        -DWITH_FAAC=ON \
        -DWITH_SOXR=ON \
        -DWITH_SERVER=ON \
        -DWITH_CHANNELS=ON \
        -DWITH_CLIENT_CHANNELS=ON \
        -DWITH_SERVER_CHANNELS=ON \
        -DCHANNEL_URBDRC_CLIENT=ON \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libasound.so' 'libavcodec.so' 'libavutil.so' 'libfaac.so'
  'libfaad.so' 'libpulse.so' 'libsystemd.so' 'libudev.so')
  cd "${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
