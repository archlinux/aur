# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tdns-git
_pkgname=tdns
pkgver=v0.5.2.r0.4f226fe
pkgrel=1

pkgdesc="A powerful, lightweight CLI to manage Technitium DNS server via HTTP API endpoint"
arch=('x86_64')
url='https://github.com/mbevc1/tdns'
license=('MPL-2.0')
makedepends=('make' 'coreutils' 'go' 'upx')
provides=('tdns')
conflicts=('tdns')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
        git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  make clean # Explicitly clean the build dir as it doesn't clean properly on rebuilds
  make build
}

package() {
  cd $srcdir/$_pkgname

  install -Dm 755 tdns -t $pkgdir/usr/bin/
  install -Dm 644 LICENSE -T $pkgdir/usr/share/licenses/$_pkgname/LICENSE

  ./tdns completion bash 2> /dev/null > tdns.bash
  install -Dm 644 tdns.bash -T $pkgdir/usr/share/bash-completion/completions/tdns

  ./tdns completion zsh 2> /dev/null > tdns.zsh
  install -Dm 644 tdns.zsh -T $pkgdir/usr/share/zsh/site-functions/_tdns

  ./tdns completion fish 2> /dev/null > tdns.fish
  install -Dm 644 tdns.fish -t $pkgdir/usr/share/fish/vendor_completions.d/
}
