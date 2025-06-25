# Maintainer: Audrey <aud.sins@gmail.com>
pkgname=gemini-cli-git
_pkgname=gemini-cli
pkgver=early.raccess.103.g4b5ca6bc
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal (git version)"
arch=('x86_64')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
depends=('nodejs>=18' 'python')
makedepends=('npm' 'git')
source=("git+https://github.com/google-gemini/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  npm install
}

package() {
  cd "${_pkgname}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local install_dir="$pkgdir/usr/lib/${_pkgname}"
  install -d "$install_dir"

  cp -r bundle package.json "$install_dir/"
  cd "$install_dir"

  npm install --omit=dev --ignore-scripts

  install -d "$pkgdir/usr/bin"
  ln -s "../lib/${_pkgname}/bundle/gemini.js" "$pkgdir/usr/bin/gemini"

  find "$pkgdir" -type d -empty -delete
}
