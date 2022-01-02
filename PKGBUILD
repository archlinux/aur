# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-git
_pkgname=xrdp
pkgver=0.9.17.r105.ga8375d68
pkgrel=1
epoch=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/$_pkgname"
arch=(i686 x86_64 armv6h armv7l aarch64)
license=('Apache')
makedepends=('git' 'nasm')
depends=('tigervnc' 'libxrandr' 'fuse' 'libfdk-aac' 'ffmpeg')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#branch=devel"
        "arch-config.diff")
sha256sums=('SKIP'
            '30fc3ab273bbde55966eadc117e02a85ae331ce6136995fd34309cc3c57ea619')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'

}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig <../arch-config.diff
  ./bootstrap
}

build() {
  cd $pkgname
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
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
