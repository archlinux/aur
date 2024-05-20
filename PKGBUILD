# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: jakob <grandchild@gmx.net>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=ninjam
pkgname=ninjam-server
pkgver=0.080
pkgrel=2
# git blame -l ninjam/server/ninjamsrv.cpp | grep "#define VERSION" | cut -d ' ' -f 1
_commit=44c21b98042afc440af456e110f857b7947ff859
pkgdesc='Ninjam online jamming server'
arch=(aarch64 x86_64)
url='https://cockos.com/ninjam/'
license=(GPL-2.0-or-later)
depends=(gcc-libs)
makedepends=(git)
groups=(pro-audio)
source=("git+https://www-dev.cockos.com/ninjam/ninjam.git#commit=$_commit"
        "$_name.service"
        "$_name.sysusers")
sha256sums=('4f78057d1f49eb192daed33d2a9c856bf1c56326b2716d35656955bb99450470'
            '3b88687ecfc7ec413bc530ae43a7c13f0924a9a2533c05286903e86bf46dafa0'
            '78a06cd88f3b721237f81436fc8653b5dc6d29ce25eb4ccf1179a51b77b9b4cc')
backup=("etc/$_name.cfg")

prepare() {
  cd $_name/$_name/server
  sed -i 's:cclicense\.txt:/usr/share/ninjam-server/cclicense.txt:' example.cfg
}

build() {
  cd $_name/$_name/server
  # Makefile is not including outside flags
  make CXXFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
  install -vDm644 $_name.sysusers "$pkgdir"/usr/lib/sysusers.d/$_name.conf
  install -vDm644 $_name.service -t "$pkgdir"/usr/lib/systemd/system
  cd $_name/$_name/server
  install -vDm755 ninjamsrv -t "$pkgdir"/usr/bin
  install -vDm644 example.cfg "$pkgdir"/etc/$_name.cfg
  install -vDm644 cclicense.txt -t "$pkgdir"/usr/share/$pkgname
}
