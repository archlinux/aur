# Maintainer:
# Contributor: nekgem2 <nekgem2@firemail.cc>

_pkgname="lokinet"
pkgname="$_pkgname"
pkgver=0.9.14
pkgrel=1
pkgdesc="Anonymous, decentralized and IP based overlay network for the internet"
url="https://github.com/oxen-io/lokinet"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'curl'
  'libsodium'
  'libuv'
  'unbound'
  'zeromq'
)
makedepends=(
  'cmake'
  'cppzmq'
  'git'
  'ninja'
  'nlohmann-json'
  'python'
)

install='lokinet.install'

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#tag=v$pkgver"
  'lokinet.conf'
  'lokinet.service'
  'lokinet-vpn@.service'
  'lokinet-resume.service'
  'lokinet.sysusers'
  'lokinet.tmpfiles'
  'lokinet.rules'
)
sha256sums=(
  'fbe9fe1764c920453155d0341b4ed716c11b3962cfd21f9e5b486f40488e287d'
  'ff5e7db4e65463e50978da0185487bd4a7f213f04bdb6256e221089f833c6ab6'
  'ffd87df5d7a6d8b7416577a87e89f79c54930e0f14824c9831ad16f0ecfb6f42'
  '1c90e7e362bf33d824af70fcf7da509dcc166f9d1f9c90111d25c28905b81857'
  'bcf4bd7b38d2f054e25cc243353d3c9a56d1948b42ad07ee5c0260de06e8dd6c'
  '137cf7eeebc8737d62f3ccfad2398fb1c442a91cb9db7d650429b218dd949a00'
  'b0d87fd610bbc7ef56148590dbc6ed6a68f36ec88db783f408a66c815705fd75'
  '6ea4d917ce2e46b2c31af31b8c8c28054c5f977bab5b050c44e2029ab3248713'
)

prepare() {
  cd "$_pkgsrc"
  git rm -r external/ghc-filesystem
  git rm -r external/nlohmann
  git rm -r external/pybind11
  git rm -r test/Catch2
  git submodule update --init --depth=1

  cd external/oxen-logging
  git submodule update --init --depth=1
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DBUILD_LIBLOKINET=OFF
    -DDOWNLOAD_SODIUM=OFF
    -DFORCE_OXENC_SUBMODULE=OFF
    -DFORCE_OXENMQ_SUBMODULE=OFF
    -DLOKINET_VERSIONTAG=release
    -DNATIVE_BUILD=OFF
    -DOXENMQ_INSTALL_CPPZMQ=OFF
    -DOXEN_LOGGING_FMT_HEADER_ONLY=ON
    -DOXEN_LOGGING_FORCE_SUBMODULES=ON
    -DOXEN_LOGGING_SPDLOG_HEADER_ONLY=ON
    -DSUBMODULE_CHECK=OFF
    -DUSE_AVX2=OFF
    -DWITH_PEERSTATS_BACKEND=OFF
    -DWITH_SETCAP=OFF
    -DWITH_SYSTEMD=ON
    -DWITH_TESTS=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "lokinet.service" "$pkgdir/usr/lib/systemd/system/lokinet.service"
  install -Dm644 "lokinet-vpn@.service" "$pkgdir/usr/lib/systemd/system/lokinet-vpn@.service"
  install -Dm644 "lokinet-resume.service" "$pkgdir/usr/lib/systemd/system/lokinet-resume.service"
  install -Dm644 "lokinet.sysusers" "$pkgdir/usr/lib/sysusers.d/lokinet.conf"
  install -Dm644 "lokinet.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lokinet.conf"

  mkdir -pm750 "$pkgdir/usr/share/polkit-1/rules.d"
  install -Dm644 "lokinet.rules" "$pkgdir/usr/share/polkit-1/rules.d/lokinet.rules"

  mkdir -pm750 "$pkgdir/etc/loki"

  install -Dm644 "$_pkgsrc"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # unwanted
  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/lib/cmake"
  rm -r "$pkgdir/usr/lib/pkgconfig"
  rm "$pkgdir/usr/lib"/*.so
}
