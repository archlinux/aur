# Maintainer: ripping1903 <ripping1903 at proton dot me>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jörg Horchler <joerg at horchler dot xyz>

pkgname=go-task-bin
_pkgname=go-task
pkgver=3.37.2
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

sha256sums_x86_64=('c547c7af258fa49d99198fc94141152592af106ae603fa38703c4bb274ba0826')
sha256sums_i686=('a50cbdc9b78fb89c1e22bbc1bf11c857b363264717abeb8c2f85cf7da57c2b2b')
sha256sums_armv7h=('62d8a7e6d34dabdfa002ed895b757bba53d4455062b34e1069b339e0e417509b')
sha256sums_aarch64=('19205b4d09ccc089d6d68f43e1728b54d8db90c9921faa40b0fd703b9cbd9d85')

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
