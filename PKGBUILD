# Maintainer: Abraham Toriz <categulario at gmail dot com>
# Maintainer: kedap <kedap at protonmail dot com>
pkgname=tiempo
_reponame=tiempo-rs
pkgver=1.5.2
pkgrel=1
pkgdesc="A command line time tracker application"
arch=('i686' 'x86_64')
url="https://gitlab.com/categulario/tiempo-rs"
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
makedepends=('cargo' 'git' 'python-sphinx' 'python-tomlkit' 'gzip' 'make')
provides=('tiempo')
conflicts=('tiempo-git' 'tiempo-bin')
source=("https://gitlab.com/categulario/$_reponame/-/archive/v$pkgver/$pkgname-rs-v$pkgver.tar.gz")
sha256sums=('776f85b8857f4cca3ac2cd932960b873dddf809d4a8b23a2fd02ac3d9ee7f971')

build() {
  cd "$_reponame-v$pkgver"
  cargo build --release --locked
  cd docs
  make man
  gzip build/man/tiempo.1
}

package() {
  cd "$_reponame-v$pkgver"
  install -Dm755 target/release/t "${pkgdir}"/usr/bin/t

  install -Dm644 README.md "$pkgdir"/usr/share/doc/tiempo/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md

  install -Dm644 completions/bash/tiempo-autocomplete.bash "${pkgdir}/usr/share/bash-completion/completions/tiempo.bash"

  install -Dm644 docs/build/man/tiempo.1.gz "$pkgdir"/usr/share/man/man1/tiempo.1.gz
}
