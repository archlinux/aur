# Maintainer: Wolf Yuan <me at wolf-yuan dot dev>

pkgname=neiro-git
_pkgname=neiro
pkgver=0.1.0.r0.g9a3148e
pkgrel=1
pkgdesc="Laptop speaker enhancement for PipeWire, using the laptop's own Dolby DAX3 tuning"
arch=('x86_64')
url='https://gitlab.com/wolf-yuan/neiro'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'libpipewire'
  'pipewire'
  'pipewire-audio'
  'wireplumber'
)
makedepends=(
  'cargo'
  'clang'
  'git'
)
checkdepends=('ffmpeg')
optdepends=(
  'ffmpeg: play the bundled samples and your own music in the A/B tuner'
  '7zip: unpack ASUS and Framework driver downloads for neiro import'
  'innoextract: unpack Lenovo driver downloads for neiro import'
  'msitools: unpack Microsoft Surface driver downloads for neiro import'
  'unzip: unpack Samsung driver downloads for neiro import'
)
provides=("$_pkgname=${pkgver}")
conflicts=("$_pkgname")
install=neiro.install
source=(
  "$_pkgname::git+$url.git"
  'neiro.service'
)
sha256sums=('SKIP'
            'c5803193eafe16c331ac282cf6111c2eef547b81f70575057dfc049678a9a4b0')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/neiro.service"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/docs/" docs/*.md
}
