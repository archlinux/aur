# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=nnn-git
pkgver=2.1.r1.g9e974be
pkgrel=1
pkgdesc='A lightweight terminal file browser'
arch=(x86_64)
url='https://github.com/jarun/nnn'
license=(BSD)
depends=('bash')
makedepends=(git)
provides=(nnn)
conflicts=(nnn)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd nnn
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  sed -i 's/install: all/install:/' nnn/Makefile
}

build() {
  cd nnn
  make
}

package() {
  cd nnn
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 scripts/auto-completion/fish/nnn.fish "$pkgdir"/usr/share/fish/vendor_completions.d/nnn.fish
  install -Dm644 scripts/auto-completion/bash/nnn-completion.bash "$pkgdir"/usr/share/bash-completion/completions/nnn
  install -Dm644 scripts/auto-completion/zsh/_nnn "$pkgdir"/usr/share/zsh/site-functions/_nnn

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
