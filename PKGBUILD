# Maintainer: Leonid LEdnev <leonidledn at gmail dit com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=aardwolf
pkgname="python-$_name"
pkgver=0.2.14
pkgrel=1
pkgdesc="Asynchronous RDP/VNC client in Python (headless)"
url="https://github.com/skelsec/$_name"
arch=('x86_64')
license=('MIT')
depends=(
  'python>=3.11'
  'python-unicrypto>=0.0.11'
  'python-asyauth>=0.0.16'
	'python-asysocks>=0.2.9'
  'python-tqdm'
  'python-colorama'
  'python-asn1crypto'
	'python-asn1tools'
  'python-pyperclip>=1.8.2'
	'python-arc4>=0.3.0'
  'python-pillow>=9.0.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
	'python-setuptools>=62.4'
  'python-setuptools-rust>=1.5.2'
  'rust'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('7322f50aeaf084677c40f2e54bfa87e23c2c0206428d42377d91f1b3c03a92ed2bbd984d27d336b7039de4c4b115567bc45a4894aac1f3c90657ad201cc93db9')
options=(!lto)

prepare() {
  cd "$_name/$_name/utils/rlers"
  git clean -dfx
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
