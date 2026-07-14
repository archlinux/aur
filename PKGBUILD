# Maintainer: vtajaros
pkgname=asoiaf-terminal-banners-git
pkgver=r1.1a2b3c4
pkgrel=1
pkgdesc="A Song of Ice and Fire / Game of Thrones Terminal Banners - Random ANSI banners for your terminal"
arch=('any')
url="https://github.com/vtajaros/asoiaf-terminal-banners"
license=('MIT')
depends=('bash')
makedepends=('git' 'chafa' 'jq')
provides=("asoiaf-terminal-banners")
conflicts=("asoiaf-terminal-banners")
source=("git+https://github.com/vtajaros/asoiaf-terminal-banners.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./scripts/generate_banners.sh
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  # Install the pre-rendered text banners
  install -dm755 "$pkgdir/usr/share/asoiaf-terminal-banners/banners"
  install -m644 out/*.txt "$pkgdir/usr/share/asoiaf-terminal-banners/banners/"
  
  # Install dispatcher script to share directory
  install -dm755 "$pkgdir/usr/share/asoiaf-terminal-banners"
  install -m755 scripts/archgot "$pkgdir/usr/share/asoiaf-terminal-banners/archgot"
  
  # Install executable command to /usr/bin/archgot
  install -dm755 "$pkgdir/usr/bin"
  install -m755 scripts/archgot "$pkgdir/usr/bin/archgot"
}
