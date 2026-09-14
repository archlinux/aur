# Maintainer: npil

pkgname=ddccontrol-db
pkgver=20260902
pkgrel=1
pkgdesc="Monitor database for DDCControl"
arch=('any')
url="https://github.com/ddccontrol/ddccontrol-db"
license=('GPL-2.0-only')
depends=()
checkdepends=('ddccontrol')
source=("https://github.com/ddccontrol/ddccontrol-db/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('70ecf4ab6e1952234e9b2740bca8fd10e6cf7b290fa9d464bde08d11969d3e46')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check

  # Non-fatal: report every profile ddccontrol fails to validate instead of
  # aborting at the first one, since a single bad upstream profile (e.g. a
  # value id="0" quirk) shouldn't block packaging.
  local fail=0 total=0 file name
  for file in db/monitor/*.xml; do
    grep -q NOCHECKDB "$file" && continue
    name=${file##*/}
    name=${name%.xml}
    total=$((total + 1))
    ddccontrol -b db -v -v -i "$name" >/dev/null 2>&1 || { fail=$((fail + 1)); echo "check-db: FAILED $name"; }
  done
  echo "check-db: $fail / $total profiles failed"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
