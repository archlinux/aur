# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=optivorbis-git
pkgver=0.3.2.r140.g1d70cf3d
pkgrel=2
pkgdesc="Application for lossless, format-preserving, two-pass optimization and repair of Vorbis data"
arch=('i686' 'x86_64')
url="https://optivorbis.github.io/OptiVorbis/"
license=('AGPL-3.0-or-later' 'BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("optivorbis=$pkgver")
conflicts=('optivorbis')
source=("git+https://github.com/OptiVorbis/OptiVorbis.git")
sha256sums=('SKIP')


prepare() {
  cd "OptiVorbis"

  if [ ! -f "Cargo.lock" ]; then
    cargo generate-lockfile \
      --manifest-path "packages/optivorbis_cli/Cargo.toml"
  fi
  cargo fetch \
    --locked \
    --target host-tuple \
    --manifest-path "packages/optivorbis_cli/Cargo.toml"
}

pkgver() {
  cd "OptiVorbis"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "OptiVorbis"

  #cargo test \
  #  --frozen \
  #  --manifest-path "packages/optivorbis_cli/Cargo.toml"
}

package() {
  cd "OptiVorbis"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "packages/optivorbis_cli"

  install -Dm644 "LICENSE.BSD-3-Clause" -t "$pkgdir/usr/share/licenses/optivorbis"
}
