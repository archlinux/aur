# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="0.6.4"
pkgrel=1
pkgdesc='The design doc tool made for developers'
url='http://vitiral.github.io/artifact/'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/vitiral/artifact/archive/v${pkgver}.tar.gz"
)
sha512sums=(
 'a10f013f77e27412242da5895ab427cadc0cee13b3de67fdb87f211e8ad4390f89ba8315c479a733e52330b37a9989b94b04af88c1ccb44ace4eb75eb49f7d96'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'glibc'
 'gcc-libs'
)
# Currently, this package needs serde_derive v0.9.9, which needs nightly rust.
# A big big warning will be displayed when rustup is not used.
# We currently cannot depend on rust-nightly, because community/rustup
# does not provide rust-nightly
makedepends=(
 'rust'
 'cargo'
)

build() {
 pushd "artifact-${pkgver}"
 if [[ $(command -v rustup) ]]; then
   rustup run nightly cargo build --release
 else
   echo "WARNING: It seems like you are not running rustup.\nKeep in mind that `artifact` needs a recent version of rust nightly!"
   echo "Currently, this package needs serde_derive v0.9.9, which needs nightly rust."
   echo "We currently cannot depend on rust-nightly, because community/rustup"
   echo "does not `provide` rust-nightly, while it can actually provide it"
   cargo build --release
 fi
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/artifact-${pkgver}/target/release/art" "$pkgdir/usr/bin/"
}
