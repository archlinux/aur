# Maintainer: aisuneko icecat <iceneko@protonmail.ch>

pkgbase=fyn
pkgname=("$pkgbase" "python-$pkgbase"{,-build})
pkgver=0.10.12
pkgrel=1
pkgdesc='extremely fast Python package installer and resolver - fork of uv'
arch=('x86_64')
url="https://github.com/duriantaco/fyn"
license=('MIT' 'Apache-2.0')
depends=(
  'bzip2'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'cmake'
  'git'
  'maturin'
  'python-installer'
  'xz'
)
options=(!lto)
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgbase"
  # https://github.com/duriantaco/fyn/issues/5
  if [ -d crates/fyn-build/python/uv_build ]; then mv crates/fyn-build/python/uv_build crates/fyn-build/python/fyn_build; fi
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p completions
}

build() {
  cd "$pkgbase"
  local tripple="$(rustc --print host-tuple)"

  maturin build --locked --release --target "$tripple" --strip --compatibility linux
  maturin build --locked --release --target "$tripple" --strip --compatibility linux -m crates/fyn-build/Cargo.toml
  local compgen="target/$tripple/release/fyn --generate-shell-completion"
  $compgen bash > "completions/$pkgbase"
  $compgen elvish > "completions/$pkgbase.elv"
  $compgen fish > "completions/$pkgbase.fish"
  $compgen zsh > "completions/_$pkgbase"
}

check() {
  cd "$pkgbase"

  local tripple="$(rustc --print host-tuple)"
  local _target="target/$tripple/release/fyn"
  $_target -V | grep -F "$pkgname $pkgver"
}

_package_common() {
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-*
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_fyn() {
  depends=(
    gcc-libs
    glibc
    bzip2
  )

  cd "$pkgbase"
  _package_common
  local _target="target/$(rustc --print host-tuple)/release/fyn"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_target"
  install -Dm0755 -t "$pkgdir/usr/bin/" "${_target}x"
  install -Dm 644 "completions/$pkgbase" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgbase.elv" -t "$pkgdir/usr/share/elvish/lib/"
  install -Dm 644 "completions/$pkgbase.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgbase" -t "$pkgdir/usr/share/zsh/site-functions/"
}

package_python-fyn() {
  pkgdesc+=' - Python wrapper'
  depends=(
    python
  )

  cd "$pkgbase"
  _package_common
  depends=(python "$pkgbase=$pkgver")
  python -m installer -d "$pkgdir" target/wheels/fyn-$pkgver-*.whl
  rm -rf "$pkgdir/usr/bin"
}

package_python-fyn-build() {
  pkgdesc+=' - Python build backend'
  depends=(
    bzip2
    gcc-libs
    glibc
    python
    xz
  )
  groups=(python-build-backend)

  cd "$pkgbase"
  _package_common
  python -m installer -d "$pkgdir" target/wheels/fyn_build-$pkgver-*.whl
}

# vim: ts=2 sw=2 et:

