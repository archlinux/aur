# Maintainer: libjared <4498312-libjared@users.noreply.gitlab.com>
# Maintainer: YTJVDCM <50657624+YTJVDCM@users.noreply.github.com>
pkgname=vrc-get
pkgver=1.6.1
pkgrel=1
pkgdesc="Open Source command line client of VRChat Package Manager"
arch=('x86_64')
url="https://github.com/anatawa12/vrc-get"
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(cargo dotnet-sdk)
# most rust projects that link with native libs can't use lto
options=(!lto)
_submodule_LiteDB_url="https://github.com/anatawa12/LiteDB"
_submodule_LiteDB_commit='7e7ceac241aceb60369e955374ff1353e4b4a22c'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "LiteDB-for-$pkgver.tar.gz::${_submodule_LiteDB_url}/archive/${_submodule_LiteDB_commit}.tar.gz")
noextract=("LiteDB-for-$pkgver.tar.gz")
sha256sums=('814f1af23261799ceda4f301cfd062b4e1c05b66464389b2de18865ecf4e3bbb'
            '75a6444ff08e18fcebdcc61f8a121216927dcb75004f7b658642031b0f7b83d7')

prepare() {
  tar -xf ./LiteDB-for-$pkgver.tar.gz -C ./$pkgname-$pkgver/vrc-get-litedb/dotnet/LiteDB --strip-components=1
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
