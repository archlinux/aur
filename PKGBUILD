# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>
pkgname=gemini-cli-git
_pkgname=gemini-cli
epoch=1
pkgver=r3249.gc0b766ad7
pkgrel=1
pkgdesc="An open-source AI agent that brings the power of Gemini directly into your terminal (git version)"
arch=('any')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("google-gemini-cli" "gemini-cli")
conflicts=("google-gemini-cli" "gemini-cli" "google-gemini-cli-git")
replaces=("google-gemini-cli-git")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  npm install
}

package() {
  cd "$srcdir/$_pkgname"
  npm pack --silent
  local tarball=$(find . -maxdepth 1 -name "*.tgz")
  npm install -g "$tarball" --prefix "$pkgdir/usr" --omit=dev
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
