# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Saren Arterius <saren at wtako dot com>
# Contributor: Felix Yan

pkgname=rclone-git
pkgver=1.50.0.r83.g4537d9b5c
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="http://rclone.org/"
license=(MIT)
depends=(glibc)
makedepends=(git python pandoc go-pie)
source=("git+https://github.com/rclone/rclone.git")
conflicts=(rclone)
provides=(rclone)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  sed -i "1s/python$/&2/" bin/make_manual.py

  mkdir -p .gopath/src/github.com/rclone
  ln -sf "$PWD" .gopath/src/github.com/rclone/rclone
  export GOPATH="$PWD/.gopath"

  go get github.com/rclone/rclone
}

build() {
  cd "${pkgname%-git}/.gopath/src/github.com/rclone/rclone"

  PATH="$GOPATH/bin:$PATH" make TAG=v$pkgver rclone rclone.1 MANUAL.html MANUAL.txt

  ./rclone genautocomplete bash rclone.bash_completion
  ./rclone genautocomplete zsh rclone.zsh_completion
}

check() {
  cd "${pkgname%-git}/.gopath/src/github.com/rclone/rclone"
  make TAG=v$pkgver test || warning "Tests failed"
}

package() {
  cd "${pkgname%-git}/.gopath/src/github.com/rclone/rclone"
  make TAG=v$pkgver DESTDIR="$pkgdir" install

  install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
  install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -t "$pkgdir"/usr/share/doc/$pkgname -m644 MANUAL.html MANUAL.txt
}
