# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task
_pkgname=task
pkgver=3.14.0
pkgrel=1
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=('any')
url="https://github.com/go-task/task"
license=('MIT')
replaces=('gotask-taskfile')
conflicts=('gotask-taskfile')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6d4036566ba94ad6217c064435ae275f26b504918259ee068c4e663276689d20')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's/GO_TASK_PROGNAME=task/GO_TASK_PROGNAME=go-task/' completion/bash/task.bash
  sed -i 's/set GO_TASK_PROGNAME task/set GO_TASK_PROGNAME go-task/' completion/fish/task.fish
}

build() {
  cd "$_pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -v -o bin ./...
}

check() {
  cd "$_pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"


  install -Dm755 bin/task "${pkgdir}/usr/bin/go-task"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 completion/bash/task.bash "$pkgdir/usr/share/bash-completion/completions/go-task"
  install -Dm644 completion/fish/task.fish "$pkgdir/usr/share/fish/vendor_completions.d/go-task.fish"
}
