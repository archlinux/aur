pkgname=buzz-git
pkgver=2.0.0.r0.2d78504
pkgrel=1
pkgdesc="A simple system tray application for notifying about unseen e-mail"
arch=('i686' 'x86_64')
url="https://github.com/jonhoo/buzz"
license=('MIT' 'Apache')
depends=('libappindicator-gtk3' 'gtk3' 'notification-daemon' 'llvm' 'clang' 'faenza-icon-theme' 'oxygen-icons')
makedepends=('git' 'rust')
source=("${pkgname}::git+https://github.com/jonhoo/buzz")
md5sums=('SKIP')
options=('!lto') #Linking fails otherwise due to assembly from ring crate, apparently

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep -E '^v([0-9]+\.)*[0-9]+$' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  local ver=$(echo $tag | sed "s/v\(.*\)/\1/")
  echo "$ver.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  echo $(pwd)

  install -D "target/release/buzz" "${pkgdir}/usr/bin/buzz"

  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/doc/${pkgname}/LICENSE-MIT"
}
