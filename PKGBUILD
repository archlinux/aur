# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=deken-git
_pkgname=deken
pkgver=v0.2.6.r92.ga427c41
pkgrel=1
epoch=
pkgdesc="Externals wrangler for Pure Data"
arch=('i686' 'x86_64')
url="https://puredata.info/docs/Deken"
license=('custom:BSD')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=('deken')
conflicts=('deken')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/pure-data/$_pkgname"
        'deken.sh'
        'easywebdav2.diff')
md5sums=('SKIP'
         'bed7b62180a82ff6f89d414cccc70af1'
         'd2a170f510cea077e0a27b99628eaa46')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  # easywebdav2 for python3 compatibility
  if ! grep -q easywebdav2 developer/requirements.txt; then
      patch -p1 -i "$srcdir/easywebdav2.diff"
  fi
}

package() {
  cd "$_pkgname"
  local DEKEN_HOME="$pkgdir/usr/lib/deken"
  install -D -m644 developer/requirements.txt "$DEKEN_HOME/requirements.txt"
  install -D -m644 developer/deken.hy "$DEKEN_HOME/deken.hy"
  DEKEN_HOME="$DEKEN_HOME" DEKEN_ROOT=1 developer/deken install
  "$pkgdir/usr/lib/deken/virtualenv-source/virtualenv.py" --relocatable "$pkgdir/usr/lib/deken/virtualenv"
  rm -f "$pkgdir"/usr/lib/deken/virtualenv/bin/activate{,.csh,.fish}
  rm -rf "$pkgdir"/usr/lib/deken/virtualenv{-source,.tar.gz}
  install -D -m755 "$srcdir/deken.sh" "$pkgdir/usr/bin/deken"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
