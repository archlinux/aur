# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg@horchler.xyz>

pkgname=go-task-bin
_pkgname=go-task
pkgver=3.25.0
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

sha256sums_x86_64=('ebdd759e6ad8a09a21378764587ae8adbf0088f2aedfa6072f6df0fde71d17fd')
sha256sums_i686=('71fad73fc513c9726266a25ae7ac4dc3f13716f9395e3e26444852f7fe5b92b1')
sha256sums_armv7h=('650535ad58e540d0a21055a8d05355384f480abf6104beded0e9dc595822efb7')
sha256sums_aarch64=('708db601e8ef20de7aa4bcf068dd1b602a8aad87a9feb8f8abb5df2d2ca558bc')

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
