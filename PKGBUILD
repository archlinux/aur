# Maintainer: debpalash <4178343+debpalash@users.noreply.github.com>
pkgname=sshbox-git
_pkgname=sshbox
pkgver=r4.c7000a5
pkgrel=1
pkgdesc='Tiny SSH/SFTP CLI for remote deploy and training workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/debpalash/sshbox'
license=('MIT')
makedepends=('git' 'go')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd "$_pkgname"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -o sshbox .
}

package() {
  cd "$_pkgname"
  install -Dm755 sshbox "$pkgdir/usr/bin/sshbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
