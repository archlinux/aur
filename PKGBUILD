# Maintainer: bgme <i@bgme.me>

pkgname=zdns-git
pkgdesc='A command-line utility that provides high-speed DNS lookups.'
pkgver=1.0.0.364.84665d1
pkgrel=1
url='https://github.com/zmap/zdns'
arch=('x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=('zdns')
source=(${pkgname}::git+https://github.com/zmap/zdns.git#branch=main)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" \
    "$(git tag -l | cut -d- -f1 | sort -V -r | head -n1 | cut -dv -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make

  for i in zsh bash fish; do
    ./zdns completion $i >zdns.$i
  done
}

package() {
  cd ${pkgname}

  install -Dm 755 zdns "${pkgdir}/usr/bin/zdns"

  install -Dm 644 zdns.zsh "${pkgdir}/usr/share/zsh/site-functions/_zdns"
  install -Dm 644 zdns.bash "${pkgdir}/usr/share/bash-completion/completions/zdns"
  install -Dm 644 zdns.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zdns.fish"
}
