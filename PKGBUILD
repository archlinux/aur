# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: jakob <grandchild@gmx.net>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=ninjam
pkgname=ninjam-server
pkgver=0.080
pkgrel=1
pkgdesc='Ninjam online jamming server'
arch=(x86_64 aarch64)
url='https://cockos.com/ninjam/'
license=(GPL2)
depends=(gcc-libs)
groups=(pro-audio)
conflicts=(ninjam-server-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cbix/$_name/archive/refs/tags/ninjamsrv/v$pkgver.tar.gz"
        "$_name.service"
        "$_name.sysusers")
sha256sums=('64a5e2745ed335cc3e750dafde4f5b80405762cbda4def534486ea081adf3eac'
            '3b88687ecfc7ec413bc530ae43a7c13f0924a9a2533c05286903e86bf46dafa0'
            '78a06cd88f3b721237f81436fc8653b5dc6d29ce25eb4ccf1179a51b77b9b4cc')
backup=("etc/$_name.cfg")

prepare() {
  cd $_name-ninjamsrv-v$pkgver/$_name/server
  sed -i 's:cclicense\.txt:/usr/share/ninjam-server/cclicense.txt:' example.cfg
}

build() {
  cd $_name-ninjamsrv-v$pkgver/$_name/server
  # Makefile is not including outside flags
  make CXXFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
  install -vDm644 $_name.sysusers "$pkgdir"/usr/lib/sysusers.d/$_name.conf
  install -vDm644 $_name.service -t "$pkgdir"/usr/lib/systemd/system
  cd $_name-ninjamsrv-v$pkgver/$_name/server
  install -vDm755 ninjamsrv -t "$pkgdir"/usr/bin
  install -vDm644 example.cfg "$pkgdir"/etc/$_name.cfg
  install -vDm644 cclicense.txt -t "$pkgdir"/usr/share/$pkgname
}
