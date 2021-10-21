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
pkgver=2.4.1
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=('x86_64')
url="https://www.freerdp.com/"
license=('Apache')
depends=('dbus-glib' 'glibc' 'libcups' 'libgssglue' 'libx11' 'libxcursor' 'libxext'
         'libxdamage' 'libxfixes' 'libxkbcommon' 'libxi' 'libxinerama' 'libxkbfile' 'libxrandr'
         'libxrender' 'libxtst' 'openssl' 'pcsclite' 'wayland')
makedepends=('alsa-lib' 'cmake' 'docbook-xsl' 'ffmpeg' 'icu' 'krb5' 'libjpeg-turbo'
             'libpulse' 'libusb' 'pam' 'systemd-libs' 'xmlto' 'xorgproto')
conflicts=('freerdp')
provides=('libfreerdp2.so' 'libfreerdp-client2.so' 'libfreerdp-server2'
'libfreerdp-shadow2.so' 'libfreerdp-shadow-subsystem2.so' 'libwinpr2.so'
'libwinpr-tools2.so' 'libuwac0.so' 'freerdp')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        "${_pkgname}-manpage_formatting.patch")
sha512sums=('a02c2fac8f90142b8b7a36e31a720c79d7947c32fc8d4ac1c976e4f01467b3d78c50b00974af1db6e3e61c2c81ac77c1ac9bf889d14e4be084afa18b634e28f0'
            'd960e042d1527b5d5721136b6b20fc36f65beafd010581ea5b908668537fe9fe622de6689a29c0274b0d6f1e513615f0d02e56c1d1d1e613d093e145d39af8d7')

prepare() {
  cd "${_name}-${pkgver}"
  # fix man page formatting:
  # https://bugs.archlinux.org/task/64814
  patch -Np1 -i "../${_pkgname}-manpage_formatting.patch"
}

build() {
  cd "${_name}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DCMAKE_BUILD_TYPE='None' \
        -DPROXY_PLUGINDIR='/usr/lib/freerdp2/server/proxy/plugins' \
        -DWITH_DSP_FFMPEG=ON \
        -DWITH_FFMPEG=ON \
        -DWITH_PULSE=ON \
        -DWITH_CUPS=ON \
        -DWITH_PCSC=ON \
        -DWITH_ICU=ON \
        -DWITH_JPEG=ON \
        -DWITH_SERVER=ON \
        -DWITH_SWSCALE=ON \
        -DWITH_CHANNELS=ON \
        -DWITH_CLIENT_CHANNELS=ON \
        -DWITH_SERVER_CHANNELS=ON \
        -DWITH_VAAPI=OFF \
        -DCHANNEL_URBDRC_CLIENT=ON \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libasound.so' 'libavcodec.so' 'libavutil.so' 'libicuuc.so' 'libjpeg.so' 'libpam.so' 'libpulse.so'
            'libswscale.so' 'libswresample.so' 'libsystemd.so' 'libusb-1.0.so')
  cd "${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
