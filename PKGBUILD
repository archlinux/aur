# Maintainer: Calixte Pernot - <cpernot at praksys dot net>
# Maintainer: Louis Dupraz - <louis at gottagofast dot fr>

pkgname=ariane-git
_pkgname=ariane
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast initramfs/UKI generator with encryption and secure boot support"
arch=(x86_64)
url='https://gitlab.com/cpernot/ariane'
license=('GPL-3.0-only')
depends=("kmod" "util-linux-libs" "zstd" "libarchive")
makedepends=("rust" "cargo" "git" "pkg-config" "clang")
optdepends=(
  'sbctl: Secure Boot signing support'
  )

provides=(initramfs)
conflicts=(ariane)

source=("$_pkgname::git+$url")
sha256sums=("SKIP")

prepare() {
  # Ariane
  cd "$_pkgname"
  cargo fetch --manifest-path Cargo.toml

  # ariane-init
  cd init/
  cargo fetch --manifest-path Cargo.toml
  
  cd ../alpm_hooks/script/
  cargo fetch --manifest-path Cargo.toml
}

build() {
  # Ariane
  cd "$_pkgname"
  export CARGO_TARGET_DIR=target
  echo "Building ariane"
  cargo build --frozen --release --all-features --manifest-path Cargo.toml

  # ariane-init
  cd init/
  echo "Building ariane-init"
  cargo build --frozen --release --manifest-path Cargo.toml

  cd ../alpm_hooks/script/
  echo "Builing ALPM Hook helper"
  cargo build --frozen --release --manifest-path Cargo.toml
}

package() {
  cd "$_pkgname"
  install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0755 "init/target/release/$_pkgname-init" "$pkgdir/usr/lib/$_pkgname/$_pkgname-init"
  install -Dm0755 "alpm_hooks/script/target/release/ariane_helper" "$pkgdir/usr/share/libalpm/scripts/ariane_helper"
  install -Dm0644 "alpm_hooks/hooks/60-ariane-remove.hook" "$pkgdir/usr/share/libalpm/hooks/60-ariane-remove.hook"
  install -Dm0644 "alpm_hooks/hooks/90-ariane-install.hook" "$pkgdir/usr/share/libalpm/hooks/90-ariane-install.hook"

  install -Dm0644 "ariane_build.h" "$pkgdir/usr/include/ariane/builder.h"
  install -Dm0644 "init/ariane_init.h" "$pkgdir/usr/include/ariane/init.h"

  mkdir -p "$pkgdir/etc/ariane.d/"
}
