# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: James An <james@jamesan.ca>

pkgname=git-subrepo-git
_pkgname=${pkgname%-git}
pkgver=0.4.3.r1.g2f68596
pkgrel=2
pkgdesc='Git Submodule Alternative'
arch=('any')
url="https://github.com/ingydotnet/$_pkgname"
license=('GPL')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+$url.git")
md5sums=('SKIP')
depends=(git)

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  make compgen
}

check() {
  cd "$_pkgname"

  make test
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -d -m 0755 "$pkgdir"/usr/share/bash-completion/completions
  install -C -m 0644 share/completion.bash "$pkgdir"/usr/share/bash-completion/completions/git-subrepo

  install -d -m 0755 "$pkgdir"/usr/share/zsh/site-functions
  install -C -m 0644 share/zsh-completion/_git-subrepo "$pkgdir"/usr/share/zsh/site-functions/_git-subrepo
}
