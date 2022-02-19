# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

pkgname=freerdp-gstfree
pkgver=2.5.0
pkgrel=2
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=(x86_64)
url="https://www.freerdp.com/"
license=(APACHE)
depends=(dbus-glib glibc libcups libgssglue
         libx11 libxcursor libxext libxdamage libxfixes libxkbcommon libxi libxinerama
         libxkbfile libxrandr libxrender libxtst openssl pcsclite wayland)
makedepends=(alsa-lib cmake docbook-xsl ffmpeg git icu krb5 libjpeg-turbo libpulse
             libusb pam systemd-libs xmlto xorgproto)
conflicts=(freerdp)
provides=(freerdp libfreerdp2.so libfreerdp-client2.so libfreerdp-server2
          libfreerdp-shadow2.so libfreerdp-shadow-subsystem2.so libwinpr2.so
          libwinpr-tools2.so libuwac0.so)
_commit=d50aef95520df4216c638495a6049125c00742cb  # tags/2.5.0
source=("freerdp::git+https://github.com/freerdp/freerdp.git#commit=${_commit}"
        "freerdp-manpage_formatting.patch")
sha256sums=('SKIP'
            'd51a478b4664b59227dc6b22eda06a21a1b5905cedff1817043fc8cb73468a65')

prepare() {
  cd freerdp
  # fix man page formatting, https://bugs.archlinux.org/task/64814
  patch -Np1 -i ../freerdp-manpage_formatting.patch

  # fix build with ffmpeg >= 5.0, https://github.com/FreeRDP/FreeRDP/pull/7578
  git cherry-pick -n 811d94c742b33d1e6de33f7e84c794d8bae26d3a
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=None
    -DPROXY_PLUGINDIR=/usr/lib/freerdp2/server/proxy/plugins
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
