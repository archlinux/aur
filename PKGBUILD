# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=shiromino-git
pkgver=r48.ab921e7
pkgrel=1
pkgdesc="Diverse and challenging puzzle/action game with stylistic roots in the arcade."
arch=('x86_64' 'i686')
url="https://github.com/FelicityVi/shiromino"
makedepends=('pkgconf' 'git')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
license=('MIT')
source=("git+https://github.com/FelicityVi/shiromino.git")
sha256sums=('SKIP')
conflicts=("shiromino")

pkgver() {
  cd "$srcdir/shiromino"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/shiromino"
  make || return
}

package() {
  install -d "$pkgdir/usr/share/"{shiromino,doc,licenses/$pkgname}
  cd "$srcdir/shiromino"
  install -Dm755 "bin/game" "$pkgdir/usr/bin/shiromino-game"
  echo "HOME_PATH /usr/share/shiromino" >> game.cfg
  for f in audio gfx game.cfg; do
    cp -r "$f" "$pkgdir/usr/share/shiromino"
  done
  cat > shiromino << EOF
#!/bin/sh
shiromino-game /usr/share/shiromino/game.cfg
EOF
  install -Dm755 "shiromino" -t "$pkgdir/usr/bin/"
  cp -r "docs" "$pkgdir/usr/share/doc/shiromino"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

