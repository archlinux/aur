# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=tlog
pkgver=15
pkgrel=1
pkgdesc="Terminal I/O logger"
arch=(x86_64)
url="https://scribery.github.io/tlog/"
install="$pkgname.install"
license=(GPL-2.0-or-later)
depends=(curl json-c libutempter)
backup=(etc/tlog/tlog-play.conf etc/tlog/tlog-rec.conf etc/tlog/tlog-rec-session.conf)
source=("https://github.com/Scribery/tlog/releases/download/v$pkgver/tlog-$pkgver.tar.gz"
  "tlog.sysusers"
  "tlog.tmpfiles")
sha512sums=('e426868125b8d74a1e29712d665f2b449196332949dc79bd5c2b83bdac72d6f435a84022fab985a9ce46a324a1785a1f4b3bda481b9fc92577d60ad37eb11a0c'
  'f060968c09dfd002bde5d38aea9ba6ef70b16c1fe46bdc2cf6617201f25541f2706b481e8cae857230e9233fc8721d43a8f64ebdd9d514238c41c353725f06da'
  '70335c3556a6167f03336ce875d411f85978bf057c8c71a9d032b54ee6cb5ebb87524b9cdc260fe5460838de8ad5308c96e657278069e2d229beb651e36ef972')
b2sums=('a0a94d0deb5e63a0b6f20c9f4d88f13816232ad5ca24619ed48e4f6e4fb38bdd3cb6918f554ac255c2ee6f3b4665179e6e21199e0fb8c72d2c7787f91619f3c2'
  '45b8654ecce6ddf5a06bde21f25f9370434d639fe4235a207ed6165f4ab6e924b6fd5ee1e044dff0fd1c3cd01dfe10c75b56a6c6d4186c0c1ebf85d280ab24c6'
  '83f4a126b68d05576c0f9718015e9a17006d3d13d594aef15307622a7a3bdb1f5611cb51b0ba4cade5885cb5b6e8eea5d5764c05f337bac3de9d1ea717c24114')

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
