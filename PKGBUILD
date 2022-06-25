# Maintainer: kedap <kedap.dev@protonmail.com>

pkgname=apmpkg-git-dev
_pkgname=apmpkg
pkgver=106.34c9bb6
pkgrel=5
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD de la rama develop"
arch=('any')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'wget' 'fakeroot' 'ruby-bundler')
makedepends=('git' 'cargo')
conflicts=('apmpkg' 'apmpkg-dev')
source=("git+https://github.com/kedap/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git checkout develop >/dev/null
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  git checkout develop
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"
  git checkout develop
  install -Dm 755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  mkdir -p ${pkgdir}/etc/apmpkg/iiabc
  cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
  mkdir -p ${pkgdir}/etc/apmpkg/paquetes
  install -Dm 644 "man/${_pkgname}.1" -t ${pkgdir}/usr/share/man/man1
  install -Dm 644 "man/${_pkgname}-en.1" -t ${pkgdir}/usr/share/man/man1
  install -Dm 644 "completions/_${pkgname}" -t ${pkgdir}/usr/share/zsh/site-functions/
  install -Dm 644 "completions/${pkgname}.bash-completion" -t ${pkgdir}/usr/share/bash-completion/completions/
  install -Dm 644 "completions/${pkgname}.fish" -t ${pkgdir}/usr/share/fish/vendor_completions.d/
}
