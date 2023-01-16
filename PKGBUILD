# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task
_pkgname=task
pkgver=3.20.0
pkgrel=1
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=('any')
url="https://github.com/go-task/task"
license=('MIT')
replaces=('gotask-taskfile')
conflicts=('gotask-taskfile')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa66f82b54de5d9f41389dc31dbf0c00c84d5bc4ecd2499b4ae34c55b6d9b08c')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  sed -i 's/complete -F _task task/complete -F _task go-task/' completion/bash/task.bash
  sed -i 's/set GO_TASK_PROGNAME task/set GO_TASK_PROGNAME go-task/' completion/fish/task.fish
  sed -i 's/#compdef task/#compdef go-task/' completion/zsh/_task
  sed -i 's/cmd=(task)/cmd=(go-task)/' completion/zsh/_task
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o bin ./cmd/task
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 bin/task "${pkgdir}/usr/bin/go-task"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 completion/bash/task.bash "$pkgdir/usr/share/bash-completion/completions/go-task"
  install -Dm644 completion/fish/task.fish "$pkgdir/usr/share/fish/vendor_completions.d/go-task.fish"
  install -Dm644 completion/zsh/_task "$pkgdir/usr/share/zsh/site-functions/_go-task"
}
