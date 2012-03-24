# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=targetcli-fb
pkgver=2.0rc1.fb10
pkgrel=1
epoch=
pkgdesc="free branch of the targetcli LIO administration shell (iSCSI + Co)"
arch=('any')
url="https://github.com/agrover/targetcli-fb"
license=('AGPL3')
groups=()
depends=('python2-rtslib-fb>=2.1.fb2' 'python2-configshell')
optdepends=()
conflicts=('lio-utils')
provides=('targetcli')
replaces=('rtsadmin')
backup=()
options=()
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/agrover/$pkgname/tarball/v$pkgver
https://raw.github.com/JonnyJD/targetcli-fb/189705fd1cef3947d4b8106a360a33c41a27ab43/scripts/targetstatus
target)
md5sums=('127000dcb187fc3316fa943be281918f'
         '1ee54b6c6e8bf17283b84a16bbb57346'
         '474d2697f982ee76337fd67d18126501')

_githubname=agrover-targetcli-fb
_gitversion=8022276

build() {
  cd "$srcdir/$_githubname-$_gitversion"
  python2 setup.py build
  gzip --stdout targetcli.8 > "targetcli.8.gz"
}

package() {
  cd "$srcdir/$_githubname-$_gitversion"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -D -m 644 targetcli.8.gz "$pkgdir/usr/share/man/man8/targetcli.8.gz"

  # arch specific
  cd "$srcdir"
  install -D -m 755 target "$pkgdir/etc/rc.d/target"
  install -d "$pkgdir/etc/target"
  sed -i '1s/python/python2/' targetstatus
  install -m 755 targetstatus "$pkgdir/usr/bin/targetstatus"
}

# vim:set ts=2 sw=2 et:
