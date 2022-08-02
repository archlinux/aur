# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

pkgname=freerdp-gstfree
pkgver=2.8.0
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=(x86_64)
url="https://www.freerdp.com/"
license=(APACHE)
depends=(dbus-glib libcups libgssglue libxcursor libxdamage libxkbcommon libxinerama
         libxkbfile libxrandr libxtst pcsclite wayland)
makedepends=(alsa-lib cmake docbook-xsl ffmpeg git icu krb5 libjpeg-turbo libpulse
             libusb pam systemd xmlto)
conflicts=(freerdp)
provides=(freerdp libfreerdp2.so libfreerdp-client2.so libfreerdp-server2
          libfreerdp-shadow2.so libfreerdp-shadow-subsystem2.so libwinpr2.so
          libwinpr-tools2.so libuwac0.so)
_commit=e3fc97feb512053189e276b2ca79762990bb8c4c  # tags/2.8.0
source=("freerdp::git+https://github.com/freerdp/freerdp.git#commit=${_commit}"
        "freerdp-manpage_formatting.patch")
sha256sums=('SKIP'
            'd51a478b4664b59227dc6b22eda06a21a1b5905cedff1817043fc8cb73468a65')

pkgver() {
  cd freerdp
  git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd freerdp
  # fix man page formatting, https://bugs.archlinux.org/task/64814
  patch -Np1 -i ../freerdp-manpage_formatting.patch
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DPROXY_PLUGINDIR=/usr/lib/freerdp2/server/proxy/plugins
    -DWITH_X11=ON
    -DWITH_WAYLAND=ON
    -DWITH_DSP_FFMPEG=ON
    -DWITH_FFMPEG=ON
    -DWITH_PULSE=ON
    -DWITH_CUPS=ON
    -DWITH_PCSC=ON
    -DWITH_ICU=ON
    -DWITH_JPEG=ON
    -DWITH_SERVER=ON
    -DWITH_SWSCALE=ON
    -DWITH_CHANNELS=ON
    -DWITH_CLIENT_CHANNELS=ON
    -DWITH_SERVER_CHANNELS=ON
    -DWITH_VAAPI=OFF
    -DCHANNEL_URBDRC_CLIENT=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}" -B build -S freerdp
  make VERBOSE=1 -C build
}

package() {
  depends+=(libasound.so libavcodec.so libavutil.so libicuuc.so libjpeg.so
            libpam.so libpulse.so libswscale.so libswresample.so libsystemd.so
            libusb-1.0.so)
  make DESTDIR="${pkgdir}" install -C build
  install -Dm644 freerdp/{ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
