# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=tlog
pkgver=14
pkgrel=5
pkgdesc="Terminal I/O logger"
arch=(x86_64)
url="https://scribery.github.io/tlog/"
install="$pkgname.install"
license=('GPL-2.0-or-later')
depends=(curl json-c libutempter)
backup=("etc/tlog/tlog-play.conf" "etc/tlog/tlog-rec.conf" "etc/tlog/tlog-rec-session.conf")
source=("https://github.com/Scribery/tlog/releases/download/v$pkgver/tlog-$pkgver.tar.gz"
  "rec-pointer-type-fix.patch"
  "tlog.sysusers"
  "tlog.tmpfiles")
sha512sums=('593d0d845b6b10de33094658160fb6d675d7f07493e5e3a84b20ea26154c56bb1f75a85805468bc061f0a14e305f6c2140e56e6cfa8e94d9849387d47f674ccd'
  '81b848816a98ae09ade89dc149fc02c79a21cf8dcc4a3f2d5009050e333ee06cd8ef6cf346c96546fe42cd5233b6e66a1769af137d20c6b6ee539a3c5cb64b40'
  'f060968c09dfd002bde5d38aea9ba6ef70b16c1fe46bdc2cf6617201f25541f2706b481e8cae857230e9233fc8721d43a8f64ebdd9d514238c41c353725f06da'
  '70335c3556a6167f03336ce875d411f85978bf057c8c71a9d032b54ee6cb5ebb87524b9cdc260fe5460838de8ad5308c96e657278069e2d229beb651e36ef972')
b2sums=('8da71c2a4626ca136aa4822feeeafb30ad121b9bc6d2e27893793f2515cbec767179e4eae992aa4b8daa8f27b4058330e80cef5baa6be399b0ab4dd30a11f92c'
  'b92e8e5739b1fe48ee51141ddf78a60698c0ca90f1a2f27a8301ae607bf1bb655d18560ce70587aff658e6648c57712ba5b0d6f912e0f93adea24da724d1761d'
  '45b8654ecce6ddf5a06bde21f25f9370434d639fe4235a207ed6165f4ab6e924b6fd5ee1e044dff0fd1c3cd01dfe10c75b56a6c6d4186c0c1ebf85d280ab24c6'
  '83f4a126b68d05576c0f9718015e9a17006d3d13d594aef15307622a7a3bdb1f5611cb51b0ba4cade5885cb5b6e8eea5d5764c05f337bac3de9d1ea717c24114')

prepare() {
  cd "$pkgname-$pkgver" || exit
  patch -Np0 -i "$srcdir/rec-pointer-type-fix.patch"
}

build() {
  cd "$pkgname-$pkgver" || exit
  ./configure --enable-utempter --disable-static --disable-rpath --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "$pkgname-$pkgver" || exit
  make -k check
}

package() {
  cd "$pkgname-$pkgver" || exit
  make DESTDIR="$pkgdir/" install

  install -Dm 644 "${srcdir}/tlog.sysusers" "${pkgdir}/usr/lib/sysusers.d/tlog.conf"
  install -Dm 644 "${srcdir}/tlog.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tlog.conf"
}
