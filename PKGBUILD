# Maintainer: Taxin <your-email at example dot com>
pkgname=tmc-cli-rust-bin
_pkgname=tmc-cli-rust
pkgver=1.2.0
pkgrel=1
pkgdesc='Command line client for TestMyCode and MOOC.fi (download, test and submit exercises) - prebuilt binary'
arch=('x86_64')
url='https://github.com/rage/tmc-cli-rust'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
optdepends=('jdk-openjdk: Java exercises'
            'python: Python exercises'
            'bash-completion: bash completions')
provides=("$_pkgname=$pkgver" 'tmc')
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname-$pkgver::https://download.mooc.fi/tmc-cli-rust/tmc-cli-rust-x86_64-unknown-linux-gnu-v$pkgver"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/rage/tmc-cli-rust/v$pkgver/LICENSE")
noextract=("$_pkgname-$pkgver")
sha256sums=('a6225aed1ed65db46cdac7d5617a0413d09458237177a0d2db9878b0e488f9bb'
            '5f8dce79b1343567cfae3e8bfdf7f7e0ecca14107fd4748951d6b5808efb4b24')

package() {
  install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/tmc"

  # generate completions with a throwaway HOME so nothing touches the real one
  export HOME="$srcdir/fakehome" XDG_CONFIG_HOME="$srcdir/fakehome/.config" XDG_DATA_HOME="$srcdir/fakehome/.local/share"
  mkdir -p "$HOME"
  "$pkgdir/usr/bin/tmc" generate-completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tmc"
  "$pkgdir/usr/bin/tmc" generate-completions zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tmc"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
