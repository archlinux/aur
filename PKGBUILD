# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=hub-git
pkgver=v2.3.0.pre10.r12.g5e811d3b
pkgrel=1
pkgdesc="cli interface for Github"
url="https://hub.github.com"
arch=('x86_64' 'i686')
license=('MIT')
conflicts=('hub')
provides=('hub')
depends=('git')
makedepends=('go' 'groff' 'ruby-bundler')
source=("git+https://github.com/github/hub.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make all man-pages
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  install -Dm755 bin/hub "$pkgdir/usr/bin/hub"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-git/}/LICENSE"
  install -Dm644 etc/hub.bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/hub"
  install -Dm644 etc/hub.zsh_completion "$pkgdir/usr/share/zsh/site-functions/_hub"
  for manpage in share/man/man1/hub.1 share/man/man1/hub-*.1; do
    install -Dm644 $manpage "$pkgdir/usr/share/man/man1/$(basename $manpage)"
  done
}
