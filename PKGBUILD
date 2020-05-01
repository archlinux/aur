# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=saku
pkgver=4.9.0
pkgrel=1
pkgdesc="Clone of P2P anonymous BBS shinGETsu"
arch=('any')
url="http://shingetsu.info/saku"
license=('BSD')
makedepends=('git')
depends=('python' 'python-jinja' 'python-markupsafe')
optdepends=('python-pillow: Python Imaging Library')
install=$pkgname.install
source=("git+https://github.com/shingetsu/saku#tag=release-${pkgver}"
    "$pkgname.service"
    "defaultpath.patch"
    "saku.sysusers"
)
sha256sums=('SKIP'
            '880dda8557bb63e4f610c14e58694ff3e98f533597d704154f5fb36d632360b2'
            '0745c4a258a2e7762aef0100ceb29e5b409717038a89f4f7b4712f33bd9ac205'
            '76f253166b90aa65f0d142940b4e0019847c02f249389aace53dfca4641bbbe1')

prepare(){
  cd "$srcdir/$pkgname"
  for _patch in "$srcdir"/*.patch ; do
	git apply --stat "$_patch"
  done
}

package(){
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir"

  install -Dvm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
  install -Dvm644 ../$pkgname.service \
      "$pkgdir"/usr/lib/systemd/system/$pkgname.service

  install -Dm644 "$srcdir"/saku.sysusers "$pkgdir"/usr/lib/sysusers.d/saku.conf
}
