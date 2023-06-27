# Maintainer: George Thomas <georgefsthomas@gmail.com>
pkgname="wxc"
pkgver="1.0.0.1" # TODO keep this in sync? https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
pkgrel="1"
pkgdesc="A C wrapper around the wxWidgets C++ library"
url="https://github.com/georgefst/wxHaskell"
arch=("x86_64")
depends=("gcc" "wxwidgets")
makedepends=("git" "cmake")
license=("custom:wxWindows")
source=("git+${url}#commit=152d1e0f4ead34d76240727fab87185bc0a89c0b") # TODO only clone `wxc` subdir and `license.txt`?
sha512sums=("SKIP")
package() {
  (cd wxHaskell/wxc && ./generate-version-header.sh)
  cmake -BwxHaskell/build -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" wxHaskell/wxc
  (cd wxHaskell/build && make install)
  install -Dm644 wxHaskell/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # TODO bit of a hack
  # wxc's current build system bakes in absolute paths earlier than Arch would like
  # so we just replace the whole first line
  # TODO we still see a warning, but can't find why and see no issues in practice (maybe just due to relative symlink?):
  # ==> WARNING: Package contains reference to $srcdir
  # usr/lib/libwxc.so.1.0.0.1
  sed -i "1s/.*/prefix=\/usr/" "${pkgdir}/usr/lib/pkgconfig/wxc.pc"
}
