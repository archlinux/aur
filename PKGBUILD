# Maintainer: Kodi Craft <kodi at kdcf dot me>
#

_pkgname=drophost
pkgname=${_pkgname}-git
pkgbase=drophost-git
pkgver=r2.89ae21b
pkgrel=1
makedepends=('rust' 'cargo' 'python' 'git')
arch=('any')
pkgdesc="A simple drop-in /etc/hosts generator"
source=("$pkgname::git+https://github.com/KodiCraft/drophost.git")
url="https://github.com/KodiCraft/drophost.git"
license=('MIT')
sha256sums=('SKIP')
conflicts=('drophost')
provides=('drophost')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  return 0
}

package() {
  cd "$srcdir/$pkgname"
  
  git submodule update --init --recursive

  # User may not be using rustup, so always succeed
  rustup override set nightly || true
  cargo install \
    --locked \
    --path . \
    --root="$pkgdir/usr"

  rm "$pkgdir/usr/.crates.toml" "$pkgdir/usr/.crates2.json"

  mkdir -p "$pkgdir/etc/systemd/system/" 
  cp "./drophost.service" "$pkgdir/etc/systemd/system/"
  chmod 1711 "$pkgdir/etc/systemd/system/drophost.service"
}
