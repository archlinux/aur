# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributo: Jianhui Z <jianhui@outlook.com>
# Contributo: Tau Tsao <realturner at gmail.com>
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>
# Contributor: techryda <techryda at silentdome dot com>
# Contributor: Mathias R. <pu154r@overlinux.org>

pkgname=xrdp
pkgver=0.9.17
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server"
url="https://github.com/neutrinolabs/xrdp"
arch=(i686 x86_64 armv6h armv7l aarch64)
license=('Apache')
makedepends=('nasm')
depends=('tigervnc' 'libxrandr' 'fuse' 'libfdk-aac' 'ffmpeg')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname}.install"
source=("https://github.com/neutrinolabs/xrdp/releases/download/v${pkgver}/xrdp-${pkgver}.tar.gz"
	"arch-config.diff")
sha256sums=('56b913dd6d0f15b60f7a53963b30ad905f00669c91701db35bb4410be262a77e'
            '28a58f9cdf8cffc29b0d7738ee6b4d1bdab7fc7361be54282a49e0fa00c57d3c')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -b -z .orig <../arch-config.diff
  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-fuse \
	      --enable-fdkaac \
	      --enable-opus \
	      --enable-rfxcodec \
	      --enable-mp3lame \
	      --enable-pixman \
	      --enable-painter \
	      --enable-vsock \
	      --enable-ipv6 \
	      --enable-pam-config=arch \
	      --enable-rdpsndaudin
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
