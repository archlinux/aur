# Maintainer: Danilo Falcão <danilo@falcao.org>

pkgname=wayrdp
pkgver=0.1.0
pkgrel=1
pkgdesc='Native RDP server for wlroots-based Wayland compositors'
arch=('x86_64')
url='https://github.com/danilofalcao/wayrdp'
license=('MIT' 'HPND-sell-variant')
depends=(
  'freerdp'
  'glibc'
  'libpipewire'
  'libxkbcommon'
  # Called as a command to generate TLS certificates.
  'openssl'
  'wayland'
)
makedepends=('wayland-protocols' 'wlr-protocols')
optdepends=('pipewire: desktop audio and remote microphone support')

# Keep makepkg's extraction and cleanup away from the upstream checkout's src/.
# A packaging-only checkout and an independent user BUILDDIR keep their defaults.
if [[ -f src/main.c &&
      ( $BUILDDIR -ef . || $BUILDDIR/$pkgname -ef . ) ]]; then
  BUILDDIR="$PWD/build/makepkg"
fi

# Initial version, pinned to a published snapshot until upstream has release tags.
_commit=1adcc4336013fc5d64fda5ca229c028b04b2b401
source=(
  "$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  'upstream.patch'
  'wayrdp.service'
)
sha256sums=(
  'de7b499a8f92f4617043a2e82354598512d63df32ccc77753b6fd5672d7dcfc3'
  'fc4f17163493bd4ca91a2f4d39d36e0af2b0e9ebd66f19dc779cd84fb1a9b577'
  '36a394cb040608660ee2a987610fc2d23d9c76d365b0490612129dd01706ca1e'
)

prepare() {
  cd "$pkgname-$_commit"
  patch -Np1 -i "$srcdir/upstream.patch"
}

build() {
  cd "$pkgname-$_commit"
  make
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 build/wayrdp "$pkgdir/usr/bin/wayrdp"
  install -Dm755 build/wayrdp-probe "$pkgdir/usr/bin/wayrdp-probe"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/wayrdp.service" "$pkgdir/usr/lib/systemd/user/wayrdp.service"

  # Generated bindings retain the copyrights of the system and vendored XMLs.
  local protocol name
  for protocol in build/gen/*-protocol.c; do
    name=${protocol##*/}
    sed -n '/^ \* Copyright/,/^ \*\//{ /^ \*\//d; s/^ \* \?//; p; }' \
      "$protocol" > "$pkgdir/usr/share/licenses/$pkgname/${name%-protocol.c}.LICENSE"
  done
}
