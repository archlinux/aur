# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tk-fossil
pkgver=r18665.95085c3
pkgrel=2
pkgdesc="An GUI toolkit for Tcl"
arch=('i686' 'x86_64')
url="https://www.tcl.tk/"
license=('custom')
depends=('glibc' 'libxft' 'libxss' 'tcl')
makedepends=('fossil')
provides=("tk=$pkgver")
conflicts=('tk')
options=('staticlibs')
source=("fossil+https://core.tcl-lang.org/tk")
sha256sums=('SKIP')


pkgver() {
  cd "tk"

  _info=$(fossil info)
  _hash=$(echo "$_info" | sed -n 's|checkout: *\([0-9a-z]*\).*|\1|p' | cut -c 1-7)
  _revision=$(echo "$_info" | sed -n 's|check-ins: *\(.*\)|\1|p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "tk/unix"

  ./configure \
    --prefix="/usr" \
    --enable-64bit
  make
}

check() {
  cd "tk"

  #make -C "unix" test
}

package() {
  cd "tk"

  make \
    DESTDIR="$pkgdir" \
    -C "unix" \
    install \
    install-private-headers

  pushd "$pkgdir/usr/bin"
  ln -s wish* "wish"
  popd
  pushd "$pkgdir/usr/lib"
  ln -s libtk*.so "libtk.so"
  popd

  install -Dm644 "license.terms" -t "$pkgdir/usr/share/licenses/tk"

  # install private headers s
  for dir in compat generic generic/ttk unix; do
    install -Dm644 $dir/*.h -t "$pkgdir/usr/include/tk-private/$dir"
  done

  # remove buildroot traces
  sed -e "s#$srcdir/tk/unix#/usr/lib#" \
      -e "s#$srcdir/tk#/usr/include#" \
      -i "$pkgdir/usr/lib/tkConfig.sh"

  # remove unrequired execute permissions (FS#75042)
  chmod -x "$pkgdir/usr/lib"/libtkstub*.a
}
