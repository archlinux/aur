# Maintainer: Railgun

pkgname=collection-manager-git
_pkgname=collection-manager
pkgver=1.0.0
pkgrel=5
pkgdesc='osu! Collection Manager, supports Stable and Lazer'
arch=('x86_64')
url='https://github.com/nyaruku/collection-manager'
license=('custom')
depends=(
  'glibc'
  'gcc-libs'
  'zlib'
  'libuv'
  'brotli'
  'zstd'
  'openssl'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'gcc'
  'asio'
  'sassc'
)
provides=('collection-manager')
conflicts=('collection-manager')
source=(
  "$_pkgname::git+$url.git"
  'Crow::git+https://github.com/CrowCpp/Crow.git#tag=v1.3.2'
  'nlohmann_json::git+https://github.com/nlohmann/json.git#tag=v3.12.0'
  'libsass::git+https://github.com/sass/libsass.git#tag=3.6.6'
  'cpprealm::git+https://github.com/nyaruku/cpprealm.git#branch=patched'
  'cpprealm-realm-core::git+https://github.com/realm/realm-core.git#commit=60867846a0aca0c7da5e482282b293236f730216'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$srcdir/$_pkgname"

  rm -rf third_party/Crow third_party/nlohmann_json third_party/libsass third_party/cpprealm
  mkdir -p third_party
  ln -s "$srcdir/Crow" third_party/Crow
  ln -s "$srcdir/nlohmann_json" third_party/nlohmann_json
  ln -s "$srcdir/libsass" third_party/libsass
  ln -s "$srcdir/cpprealm" third_party/cpprealm

  rm -rf "$srcdir/cpprealm/realm-core" "$srcdir/cpprealm/Catch2"
  ln -s "$srcdir/cpprealm-realm-core" "$srcdir/cpprealm/realm-core"
}

build() {
  cd "$srcdir/$_pkgname"

  rm -rf build

  cmake -S . -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DREALM_DISABLE_ALIGNED_STORAGE=ON \
    -DREALM_CPP_NO_TESTS=ON \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 'build/collection-manager' "$pkgdir/usr/lib/collection-manager/collection-manager"

  install -dm755 "$pkgdir/usr/lib/collection-manager"
  cp -r 'build/www' "$pkgdir/usr/lib/collection-manager/www"
  sassc -t compressed \
    "$pkgdir/usr/lib/collection-manager/www/static/index.scss" \
    "$pkgdir/usr/lib/collection-manager/www/static/index.css"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/collection-manager" <<'EOF'
#!/bin/sh
cd /usr/lib/collection-manager || exit 1
exec /usr/lib/collection-manager/collection-manager "$@"
EOF

  install -Dm644 'README.md' "$pkgdir/usr/share/doc/collection-manager/README.md"
}

