# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task-bin
_pkgname=go-task
pkgver=3.14.1
pkgrel=2
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/go-task/task"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "gotask-taskfile-bin")
replaces=('gotask-taskfile-bin')

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_386.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm64.tar.gz")

sha256sums_x86_64=('46de158c611dfa6c8dc1dad4af4943a79c816949b4b2aae0ce7cc7e43f846f19')
sha256sums_i686=('f10c0f9f7f7058976f76bed86307ab160a367a02f77ee93c98f5576e74bf11ab')
sha256sums_armv7h=('72dc62b896120b63b6db8924396a646036aed5e15e69ba9b3ab84dcb8fcb154e')
sha256sums_aarch64=('513432dfe8de83ad020ce7fdafd42835b0ba21fcb78545f2d21a7e49d8137932')

noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  sed -i 's/GO_TASK_PROGNAME=task/GO_TASK_PROGNAME=go-task/' completion/bash/task.bash
  sed -i 's/set GO_TASK_PROGNAME task/set GO_TASK_PROGNAME go-task/' completion/fish/task.fish
  sed -i 's/#compdef task/#compdef go-task/' completion/zsh/_task
  sed -i 's/cmd=(task)/cmd=(go-task)/' completion/zsh/_task
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 task "${pkgdir}/usr/bin/go-task"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 completion/bash/task.bash "$pkgdir/usr/share/bash-completion/completions/go-task"
  install -Dm644 completion/fish/task.fish "$pkgdir/usr/share/fish/vendor_completions.d/go-task.fish"
  install -Dm644 completion/zsh/_task "$pkgdir/usr/share/zsh/site-functions/_go-task"
}
