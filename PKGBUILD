# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=pmount
pkgver=0.9.23
pkgrel=12
pkgdesc="mount removable devices as normal user"
arch=(i686 x86_64 armv7h)
license=('GPL2')
url="http://pmount.alioth.debian.org/"
backup=('etc/pmount.allow')
depends=('sysfsutils>=2.0.0-1' 'util-linux')
makedepends=('intltool')
source=(
  "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.bz2"
  "https://anonscm.debian.org/cgit/pmount/pmount-debian.git/plain/debian/completion/pmount"
  "fix-pmount-segfault.diff"
)

build() {
  # commented out in order to avoid *** Error in `/usr/bin/ld': corrupted double-linked list: 0x09e43ce8 ***
  #export CFLAGS="${CFLAGS} -fPIE -pie"
  #export CXXFLAGS="${CXXFLAGS} -fPIE -pie"

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-hal \
    --with-cryptsetup-prog=/usr/sbin/cryptsetup
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/pmount ${pkgdir}/usr/share/bash-completion/completions/pmount
  mkdir -p ${pkgdir}/media
}
md5sums=('db19f5bf3151b1b41705ec7bafa439d3'
         '224f24127f8ab3605de8b9bcb433882f'
         'b66c2def19476b8e6945c28629b692df')
sha256sums=('db38fc290b710e8e9e9d442da2fb627d41e13b3ee80326c15cc2595ba00ea036'
            '2f3983432533d453cb1217b8e6804264e22fa689a0e73a2a4d8d11f0b704bacc'
            'cd1739e70cd4e195d166b7a32a45cbfa6abd1d04f2ddb8f159ef8b5f62142114')
