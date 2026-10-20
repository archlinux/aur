# Maintainer: zzttzz
# Native x86_64 Fcitx 5 package for the Chengyin full-pinyin input method (PREVIEW).
#
# Built from the tagged source archive, never a binary drop: makepkg rebuilds
# the module from source. The full lexicon ships with the package, and the module
# compiles its installed location in as the default, so a new user gets the full
# vocabulary without configuring a path.
#
# The version comes from the repository's single version source (version.json).
# Arch needs a pacman-legal pkgver, which the upstream tag is not: a hyphen is the
# pkgver/pkgrel separator and cannot appear inside pkgver. The dot form is the same
# version text with a legal separator, and vercmp keeps it monotonic (and orders
# every preview before a later plain 0.1.0).
pkgname=fcitx5-chengyin
pkgver=0.1.0.preview37
pkgrel=1
pkgdesc="Chengyin IME (preview) - Fcitx 5 full-pinyin input method with a bundled lexicon"
arch=('x86_64')
url="https://github.com/zzttzzmyswy/chengyin-ime"
# Code is GPL-3.0-or-later; the bundled lexicon is built from Apache-2.0 (Rime
# pinyin-simp) and MIT (jieba, THUOCL, phrase-pinyin-data) sources.
license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT')
# Runtime links come from the built module: libFcitx5{Core,Config,Utils} belongs
# to fcitx5, libstdc++/libgcc_s to gcc-libs, and libc/libm to glibc. The Rust
# core is linked statically, so no separate chengyin shared library is required.
depends=('fcitx5' 'gcc-libs' 'glibc')
# python is used in prepare() to re-derive pkgver from the single version source.
# glib2 (gio) builds the D-Bus end-to-end test client; dbus supplies the private
# session bus that test runs on.
makedepends=('cargo' 'cmake' 'python' 'glib2')
checkdepends=('dbus')
options=('!debug')
# Source is the release tag, so what is built is exactly what was published as
# v${pkgver/.preview/-preview}. The tag archive is reproducible: repeated downloads
# were byte-identical, so the checksum is verifiable rather than a one-off capture.
_tag="v${pkgver/.preview/-preview}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/zzttzzmyswy/chengyin-ime/archive/refs/tags/$_tag.tar.gz")
sha256sums=('55ff3721e92f62325ff8eed6ef90be5e0b550ed6a0a162404ea110b9388ed3b0')

prepare() {
  cd "$srcdir/chengyin-ime-${_tag#v}"
  # pkgver is derived from the repository's single version source, never typed
  # here as a second copy. Re-derive it from the fetched tree and refuse to
  # proceed if the two disagree, so a stale pkgver cannot ship a mislabelled
  # package.
  local expected
  expected=$(python3 scripts/version.py --print arch-pkgver) || return 1
  if [[ "$pkgver" != "$expected" ]]; then
    printf 'PKGBUILD failure: pkgver=%s but version.json derives %s\n' "$pkgver" "$expected" >&2
    return 1
  fi
}

build() {
  cd "$srcdir/chengyin-ime-${_tag#v}"
  # The workspace has no external crates; --locked proves Cargo.lock is honoured
  # and the build never reaches the network.
  cargo build --release -p chengyin-ffi --locked
  cmake -S platforms/fcitx5 -B build/fcitx5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCHENGYIN_PACKAGED_DATA=ON \
    -DCHENGYIN_DEBIAN_README=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build/fcitx5 -j "$(nproc)"
}

check() {
  cd "$srcdir/chengyin-ime-${_tag#v}"
  # Rebuild with tests and run them against the same sources makepkg packaged.
  cmake -S platforms/fcitx5 -B build/fcitx5-test \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCHENGYIN_PACKAGED_DATA=ON \
    -DCHENGYIN_DEBIAN_README=OFF
  cmake --build build/fcitx5-test -j "$(nproc)"
  ctest --test-dir build/fcitx5-test --output-on-failure
}

package() {
  cd "$srcdir/chengyin-ime-${_tag#v}"
  DESTDIR="$pkgdir" cmake --install build/fcitx5
  # Package-owned documentation: the lexicon's own provenance record already
  # landed with the data, so only the module's readme and the code license remain.
  install -Dm644 packaging/arch/README.arch "$pkgdir/usr/share/doc/$pkgname/README.arch"
  # Arch requires the licence texts that carry a copyright holder (MIT) under
  # /usr/share/licenses/<pkgname>/; GPL and Apache-2.0 are common licences and need
  # no copy, but the Apache text is kept next to the others since it ships anyway.
  local source
  for source in jieba thuocl phrase-pinyin-data rime-pinyin-simp; do
    install -Dm644 "$pkgdir/usr/share/chengyin/licenses/LICENSE.$source" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$source"
  done
}
