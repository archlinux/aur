# Maintainer: Pouya Shojaei <pouyashojaei85@gmail.com>
pkgname=libicu72-bin
pkgver=72.1
_debrel=3+deb12u1
pkgrel=1
pkgdesc="ICU 72 runtime libraries (repackaged from Debian arm64) needed by legacy TheSkyX builds"
arch=('aarch64')
url="https://packages.debian.org/bookworm/libicu72"
license=('custom:ICU')
provides=('libicudata.so.72' 'libicui18n.so.72' 'libicuio.so.72'
          'libicutest.so.72' 'libicutu.so.72' 'libicuuc.so.72')

# Full manifest of the upstream .deb (confirmed via `dpkg-deb -c`), all under
# ./usr/lib/aarch64-linux-gnu/, each shipped as versioned file + unversioned
# symlink (e.g. libicuuc.so.72.1 -> libicuuc.so.72):
#   libicudata.so.72.1  (~31 MB, ICU data — pulled in by all the others)
#   libicui18n.so.72.1
#   libicuio.so.72.1
#   libicutest.so.72.1
#   libicutu.so.72.1
#   libicuuc.so.72.1
# The package() glob below (libicu*.so.72*) picks up all of these.
options=('!strip' '!debug')
source=("libicu72_${pkgver}-${_debrel}_arm64.deb::http://deb.debian.org/debian/pool/main/i/icu/libicu72_${pkgver}-${_debrel}_arm64.deb")
sha256sums=('4f5d892fd81110435e45ed0a5f1b12899d7ff989d51db283cbc043f5631646d8')

package() {
  cd "$srcdir"

  # A .deb is an ar archive containing control.tar.*, data.tar.*, debian-binary
  bsdtar -xf "libicu72_${pkgver}-${_debrel}_arm64.deb"

  # data.tar.* may be .xz, .zst, or .gz depending on the release
  local datatar
  datatar=$(ls data.tar.* 2>/dev/null | head -n1)

  mkdir -p "$srcdir/extracted"
  bsdtar -xf "$datatar" -C "$srcdir/extracted"

  install -d "$pkgdir/usr/lib"
  # -a preserves the libicuXX.so.72 -> libicuXX.so.72.1 symlinks
  cp -a "$srcdir"/extracted/usr/lib/aarch64-linux-gnu/libicu*.so.72* "$pkgdir/usr/lib/"

  # Debian's ICU license text, for compliance
  if [ -f "$srcdir/extracted/usr/share/doc/libicu72/copyright" ]; then
    install -Dm644 "$srcdir/extracted/usr/share/doc/libicu72/copyright" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
