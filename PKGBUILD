# Maintainer: Sébastien Luttringer
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: Fabian Brosda <fabi3141@gmx.de>

pkgname=ferm
pkgver=2.6
pkgrel=1
pkgdesc='Tool to maintain complex firewalls'
arch=('any')
url='http://ferm.foo-projects.org/'
license=('GPL2')
depends=('iptables' 'perl')
optdepends=('ebtables' 'arptables' 'ipset')
backup=("etc/$pkgname.conf")
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@blarg.de>
source=(
  "http://ferm.foo-projects.org/download/${pkgver:0:3}/$pkgname-$pkgver.tar.xz"{,.sig}
  "$pkgname.service")
sha256sums=('689541465e7c073cbd604c9cd18f113c31c0b41bb12614726a59b17e44058885'
            'SKIP'
            'b091bdef4b42c74d162de43b017c71bc00d7969b1a4f2d9188df01354c36a78e')


package() {
  # software setup
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
  cd "$pkgdir"
  # setup default config
  install -D -m 644 usr/share/doc/ferm/examples/workstation.ferm etc/$pkgname.conf
  # remove fancy docs
  rm usr/share/doc/ferm/ferm.{html,txt}
  # /usr merge
  mv usr/sbin usr/bin
  # systemd
  install -Dm 644 "$srcdir/$pkgname.service" usr/lib/systemd/system/$pkgname.service
}

# vim:set ts=2 sw=2 et:
