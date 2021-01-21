# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-bin-git
pkgname0=xrdp-git
_pkgname=xrdp
pkgver=0.9.15.r8.gb9c5c00d
pkgrel=1
epoch=1
pkgdesc="Forked from xrdp-git. Replace the dependence of tigervnc with tigervnc-server."
url="https://github.com/neutrinolabs/$_pkgname"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('git' 'nasm')
depends=('tigervnc-server' 'libxrandr' 'lame' 'opus' 'fuse')
conflicts=("${_pkgname}" "${pkgname0}")
provides=("${_pkgname}" "${pkgname0}")
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname0}.install"
source=("$pkgname0::git+https://github.com/neutrinolabs/xrdp.git#branch=devel"
        "arch-config.diff")
md5sums=('SKIP'
         '7997625333e8c96c6f32e7e2d0224105')

pkgver() {
  cd $pkgname0
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'

}

prepare() {
  cd $pkgname0
  patch -Np2 -b -z .orig <../arch-config.diff
  ./bootstrap
}

build() {
  cd $pkgname0
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-systemdsystemdunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-fuse \
	      --enable-opus \
	      --enable-mp3lame \
	      --enable-pixman \
	      --enable-vsock
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd $pkgname0
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname0/COPYING
}
