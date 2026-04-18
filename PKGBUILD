# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.18.1
pkgrel=1
pkgdesc='build2 build system'
arch=(x86_64)
url='https://build2.org/'
license=(MIT)
makedepends=(chrpath)
depends=(glibc
         libgcc
         libstdc++
         sqlite)
source=(https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz)
sha256sums=('a5f3eab9d4522bc22704899593dd6c7013349a1b8c37278c8b2321073e25ff16')

build() {
  mkdir -p "$srcdir/build/usr"
  cd "$srcdir/build2-toolchain-$pkgver"

  local log="$srcdir/build-sh.log"

  set -o pipefail
  if ! ./build.sh \
      --trust yes \
      --local \
      --system libsqlite3 \
      --install-dir "$srcdir/build/usr" \
      "${CXX:-g++}" $CXXFLAGS $LDFLAGS \
      2>&1 | tee "$log"
  then
    if grep -Fq 'error: current directory already configured, start with clean source' "$log"; then
      cat >&2 <<EOF
==> ERROR: The upstream build2 build.sh script cannot resume an interrupted configured build tree.
==>        Please perform a clean rebuild.
==>
==>          Re-run from the package directory:
==>            cd "$startdir" && makepkg -C
==>
==>          If using an AUR helper, rebuild the package:
==>            yay -S "$pkgname" --rebuild
==>            paru -S "$pkgname" --rebuild
==>
==>          Manual fallback:
==>            rm -rf "$srcdir" "$pkgdir" && cd "$startdir" && makepkg
EOF
    fi
    return 1
  fi
  set +o pipefail

  for f in "$srcdir"/build/usr/lib/pkgconfig/*.pc; do
    sed -i "s|$srcdir/build||" "$f"
  done
}

package() {
  cp -av build/usr "$pkgdir"
  chrpath -d "$pkgdir"/usr/bin/{b,bpkg,bdep} "$pkgdir"/usr/lib/*.so

  install -Dm644 "$pkgdir"/usr/share/doc/build2/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
