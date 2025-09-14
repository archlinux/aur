# Maintainer: Flinner Yuu <flinner @ tilde DOT team>
pkgname='jank-bin'
# package is always version 0.1-1 (until stable release). So I use date of .deb package
pkgver=20250914
pkgrel=1
pkgdesc="The native Clojure dialect hosted on LLVM with seamless C++ interop. Debain package."
arch=('x86_64')
url="https://jank-lang.org/"
license=('MPL-2.0')
options=()
# We require `libxml2-legacy` instead of `libxml2` because the .deb package uses
# old deps...
depends=('gcc' 'libzip' 'lbzip2' 'libxml2-legacy' 'libedit' 'python3') # TODO ???
makedepends=('patchelf')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('https://ppa.jank-lang.org/jank_0.1-1_amd64.deb')
sha256sums=('SKIP')

pkgver() {
    local last_modified=$(curl -sI --head "https://ppa.jank-lang.org/jank_0.1-1_amd64.deb" | grep -i '^Last-Modified:' )

    if [[ -n "$last_modified" ]]; then
        # Extract date part: "Sun, 14 Sep 2025 02:22:18 GMT"
        # Use LC_TIME=C to ensure English month names are parsed
        LC_TIME=C date -d "${last_modified#*Last-Modified: }" +"%Y%m%d" 2>/dev/null || echo "$(date +%Y%m%d)"
    else
        # Fallback: today's date if header missing
        date +%Y%m%d
    fi
}

package() {
    cd "$srcdir"
    tar xf data.tar.zst -C "$pkgdir"
    find "$pkgdir" -type d -empty -delete 2>/dev/null || true

    # move /usr/local to /usr/
    mv "$pkgdir/usr/local/"* "$pkgdir/usr/"
    rm -r "$pkgdir/usr/local"

    local bin="$pkgdir/usr/bin/${pkgname%-bin}"

    declare -A LIB_MAP=(
        ["libzip.so.4"]="libzip.so.5"
    )



  # Patch each known missing library
  for lib in "${!LIB_MAP[@]}"; do
    target="${LIB_MAP[$lib]}"
    if ldd "$bin" 2>/dev/null | grep "$lib => not found"; then
      echo "Patching $lib -> $target"
      patchelf --replace-needed "$lib" "$target" "$bin" || {
        echo "Failed to patch $lib to $target" >&2
        return 1
      }
    else
      echo "$lib is not missing - skipping."
    fi
  done
}
