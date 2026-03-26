# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=tlog
pkgver=14
pkgrel=3
pkgdesc="Terminal I/O logger"
arch=(x86_64)
url="http://scribery.github.io/tlog/"
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
            '6dc1a01ef923d2db5a2fe8ac4cb8c9afd6e23c8ffda90579f3f2b966f113faf9e7b05e8ab84c45f89e3cb067dd8e200b8b1d03334c36863de6fdeafa9cd9ed64'
            '233fbc400ab1ba617cde7b5c0c0e755c4b36e290fe86e39438506453ba13b05686d40509c0a5ff5b98ed3901df05d73619e1f093cb549c6d79650209bc01465f')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np0 -i $srcdir/rec-pointer-type-fix.patch
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --enable-utempter --disable-static --disable-rpath --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm 644 "${srcdir}/tlog.sysusers" "${pkgdir}/usr/lib/sysusers.d/tlog.conf"
    install -Dm 644 "${srcdir}/tlog.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tlog.conf"
}
