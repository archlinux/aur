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
pkgrel=4
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=('x86_64')
url="https://www.freerdp.com/"
license=('Apache')
depends=('dbus-glib' 'glibc' 'libcups'
'libjpeg-turbo' 'libgssglue' 'libx11' 'libxcursor' 'libxext' 'libxdamage'
'libxfixes' 'libxkbcommon' 'libxi' 'libxinerama' 'libxkbfile' 'libxrandr'
'libxrender' 'libxtst' 'openssl' 'pam' 'pcsclite' 'wayland')
makedepends=('alsa-lib' 'cmake' 'docbook-xsl' 'ffmpeg' 'krb5' 'libpulse'
'libusb' 'systemd-libs' 'xmlto' 'xorgproto')
conflicts=('freerdp')
provides=('libfreerdp2.so' 'libfreerdp-client2.so' 'libfreerdp-server2'
'libfreerdp-shadow2.so' 'libfreerdp-shadow-subsystem2.so' 'libwinpr2.so'
'libwinpr-tools2.so' 'libuwac0.so' 'freerdp')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        "${_pkgname}-2.0.0-manpage_formatting.patch"
        "${_pkgname}-2.0.0-usb_redirection_channel.patch::https://github.com/${_pkgname}/${_pkgname}/commit/0f8437d1d86b2798edd46033974eb9678b6eecf0.patch")
sha512sums=('efdaa1b018e5166c0f2469663bdd0dc788de0577d0c0cb8b98048a535f8cb07de1078f86aaacc9445d42078d2e02fd7bc7f1ed700ca96032976f6bd84c68ee8f'
            'd960e042d1527b5d5721136b6b20fc36f65beafd010581ea5b908668537fe9fe622de6689a29c0274b0d6f1e513615f0d02e56c1d1d1e613d093e145d39af8d7'
            '6ae7bbdd787e8005c52d1c89348d1e8691d48684863f67005dfbe3b1302eb2f6098008b74147e171dc1e4e6764579609fea9168253282fcef95c1cc4f81b89b9')

prepare() {
  cd "${_name}-${pkgver}"
  # fix man page formatting:
  # https://bugs.archlinux.org/task/64814
  patch -Np1 -i "../${_pkgname}-2.0.0-manpage_formatting.patch"
  # fix usb redirection channel: https://bugs.archlinux.org/task/66209
  patch -Np1 -i "../${_pkgname}-2.0.0-usb_redirection_channel.patch"
}

build() {
  cd "${_name}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_DSP_FFMPEG=ON \
        -DWITH_FFMPEG=ON \
        -DWITH_MBEDTLS=ON \
        -DWITH_PULSE=ON \
        -DWITH_CUPS=ON \
        -DWITH_PCSC=ON \
        -DWITH_JPEG=ON \
        -DWITH_SERVER=ON \
        -DWITH_SWSCALE=ON \
        -DWITH_CHANNELS=ON \
        -DWITH_CLIENT_CHANNELS=ON \
        -DWITH_SERVER_CHANNELS=ON \
        -DCHANNEL_URBDRC_CLIENT=ON \
        -DPROXY_PLUGINDIR=/usr/lib/freerdp2/server/proxy/plugins \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libasound.so' 'libavcodec.so' 'libavutil.so' 'libpulse.so'
  'libswscale.so' 'libswresample.so' 'libsystemd.so' 'libusb-1.0.so')
  cd "${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
