# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-devel-git
_pkgname=xrdp
pkgver=0.9.16.r0.ga4c7ee07
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/$_pkgname"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('git' 'nasm')
depends=('tigervnc' 'libxrandr' 'lame' 'opus' 'fuse')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#branch=devel"
        "arch-config.diff")
md5sums=('SKIP'
         '68880e5311dd0fbb6d970278f52241f4')

pkgver() {
  cd $pkgname
  printf "0.9.16.r%s.g%s" "$(git rev-list --count v0.9.16..HEAD)" "$(git rev-parse --short HEAD)"
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
              --with-systemdsystemdunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-fuse \
	      --enable-opus \
	      --enable-rfxcodec \
	      --enable-mp3lame \
	      --enable-pixman
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
