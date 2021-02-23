# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Guillaume DELVIT <guiguid@free.fr>


pkgname=zram-init

pkgver=10.10
pkgrel=1

pkgdesc='Setup zram-based tmpfs and swap (compressed RAM devices)'
arch=('any')
url="https://github.com/vaeth/$pkgname"
license=('GPL2')

backup=('etc/modprobe.d/zram.conf')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('60ce6b9283e736b57b2e686e942dd0bee3b83902d9b260a138d13114cc6244a3'
            'SKIP')
validpgpkeys=('123D62DD87E7A81CA090CD65D18FC49C6F3A8EC0')


prepare() {
  cd "$pkgname-$pkgver"
  for f in systemd/system/*.service README.md Makefile; do
    sed -e 's/zram_var_tmp\.service/zram-var-tmp.service/g' \
        -e 's/zram_\(\(tmp\|swap\|btrfs\)\.service\)/zram-\1/g' \
        -i "$f"; done
  for s in zram_{{var_,}tmp,swap,btrfs}.service; do
    mv systemd/system/{"$s","${s//_/-}"}; done
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc BINDIR="$pkgdir/usr/bin" \
       OPENRC=FALSE MODIFY_SHEBANG=FALSE install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
