# Maintainer: Luke Street <luke.street@encounterpc.com>

pkgname=detex-convert-git
pkgver=0.1.2alpha2.r7.g0a7d38c
pkgrel=2
pkgdesc="Convert and decompress uncompressed and compressed texture files (KTX, DDS, raw)"
arch=(x86_64)
url="https://github.com/inequation/detex"
license=('ISC')
depends=("detex=$pkgver" 'gtk3' 'libpng')
source=('shared.patch' 'detex-view.desktop')
sha256sums=('SKIP' 'SKIP')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  patch -Np1 -i "$srcdir"/shared.patch
}

build() {
  cd "$_gitname"
  make LIBRARY_CONFIGURATION=SHARED programs
}

package() {
  cd "$_gitname"
  make LIBRARY_CONFIGURATION=SHARED \
    PROGRAM_INSTALL_DIR="$pkgdir"/usr/bin \
    install-programs
  install -Dm644 "$srcdir/detex-view.desktop" "$pkgdir/usr/share/applications/detex-view.desktop"
}

# vim:set ts=2 sw=2 et:
