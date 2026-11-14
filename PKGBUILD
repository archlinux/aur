# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
# Released by the srv release flow (infra docs/runbooks/release-flow.md): the tag v$pkgver of the
# canonical forge repository is the source, so this recipe and the crates.io crate (cksk) are built
# from the same commit.
pkgname=cksk
pkgver=0.2.0
pkgrel=1
pkgdesc="Server-monitor boards for a clck kiosk display"
arch=('x86_64')
# !lto: ureq pulls rustls/ring C+asm objects; under makepkg's global lto option
# those objects mislink (undefined ring_core_* symbols) -- same class as cfetch's
# sqlite3 case. The crate's own release profile already sets opt-level.
options=('!lto')
url="https://git.corbet.ch/corbet-fsl/cksk"
license=('LicenseRef-FSL-1.1-ALv2')
depends=()
makedepends=('cargo' 'git')
provides=('cksk')
conflicts=('cksk-bin')
replaces=('nixwatch-bin' 'nixwatch')
source=("$pkgname::git+https://git.corbet.ch/corbet-fsl/cksk.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --frozen --bin cksk
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/cksk "$pkgdir/usr/bin/cksk"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
