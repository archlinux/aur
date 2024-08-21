# Maintainer: AsamK <asamk@gmx.de>
pkgname=sequoia-octopus-librnp
pkgver=1.10.0
pkgrel=1
pkgdesc='A Sequoia-based OpenPGP Backend for Thunderbird'
url="https://gitlab.com/sequoia-pgp/${pkgname}"
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/sequoia-pgp/${pkgname}/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz"
        "${pkgname}.hook")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL2')
makedepends=('cargo' 'clang' 'libgit2')
install="${pkgname}.install"
depends=('thunderbird')
sha256sums=('ba3ec47bd109814f70b14c32c4764777a4675617c11b7e03dbb473f05ba4df1a'
            'aa2bda370a1e9b4a880e275291caac486db65095c34d013561d6127777589709')

prepare () {
  cd "$srcdir/$pkgname-v$pkgver"
#  sed -i 's/^const CLAIMED_RNP_VERSION: \[u32; 3\] = \[.*\];$/const CLAIMED_RNP_VERSION: [u32; 3] = [0, 16, 3];/' src/version.rs
  sed -i '/libgit2-sys = /d' Cargo.toml
  sed -i 's/#git2 = { version = "=0.12" }/git2 = { version = "0.19" }/' Cargo.toml
  cargo update
}

build () {
  cd "$srcdir/$pkgname-v$pkgver"

  cargo build --locked --release --target-dir target
}

# Improve when https://bugzilla.mozilla.org/show_bug.cgi?id=1698540 is done
package() {
  cd "$srcdir/$pkgname-v$pkgver"

  install -Dm755 target/release/libsequoia_octopus_librnp.so "${pkgdir}/usr/lib/libsequoia_octopus_librnp.so"
  install -Dm644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
