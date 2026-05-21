# Maintainer: Zish Contributors <https://github.com/yourusername/zish>
pkgname=zish-git
_pkgname=zish
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="A blazing-fast, fully customizable Linux shell written in Rust"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/strayfodanator/zish" # Altere para a URL oficial do seu repositório Git
license=('MIT')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo' 'git')
provides=('zish')
conflicts=('zish')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Evita o pipeline gotcha usando um if statement para testar tags
  if git describe --tags &>/dev/null; then
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  # Instala o binário compilado no diretório global do sistema
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
