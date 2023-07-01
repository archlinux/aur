# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task-bin
_pkgname=go-task
pkgver=3.27.1
pkgrel=1
pkgdesc="Task runner & Make alternative that runs taskfiles (Installs as go-task to avoid conflict with taskwarrior)"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/go-task/task"
license=(MIT)
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_386.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/task_linux_arm64.tar.gz")

sha256sums_x86_64=('02f00bd62ef0cf149304c61dfaa1a1a5f36e3c56f1fbb11940c58050347af5de')
sha256sums_i686=('abed8dac32377a4a1bcd0bbfdfae76bf1b3558dee9f9126bdb5685fd08ac56fa')
sha256sums_armv7h=('7ae9315efd5b439acd543b4af9b27ea89b8ee4fa3777938b39aabb16011c4465')
sha256sums_aarch64=('ccef4d60dd3d8870d6b7c7a41d5aa5aaba391ecb2dac3ed3e7eeb866dc5219ec')

noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  sed -i 's/complete -F _task task/complete -F _task go-task/' completion/bash/task.bash
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
