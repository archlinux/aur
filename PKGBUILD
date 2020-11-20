# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=shiromino-git
pkgver=r305.dc57453
pkgrel=1
pkgdesc="Diverse and challenging puzzle/action game with stylistic roots in the arcade."
arch=('x86_64' 'i686')
url="https://github.com/FelicityVi/shiromino"
makedepends=('pkgconf' 'git' 'cmake')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'libvorbis' 'sqlite')
license=('MIT')
source=("git+https://github.com/shiromino/shiromino.git" shiromino.ini)
sha512sums=('SKIP' '780d5783d5efe832b06c544909b7478504beca74642694047a5ae5f505fe4a9f9f1b1f902eef6de5d857cfa564d03f8a68219cdeccda813ef9d2640f6219d50b')
conflicts=("shiromino")
backup=('usr/share/shiromino/shiromino.ini')
provides=("shiromino")

pkgver() {
  cd "$srcdir/shiromino"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/shiromino"
  cmake -B build -S . && cmake --build build -j$(nproc)
}

package() {
  install -d "$pkgdir/usr/share/"{shiromino{,/assets},licenses/$pkgname}
  cd "$srcdir/shiromino"
  install -Dm755 "build/shiromino" "$pkgdir/usr/bin/shiromino-game"
  cp "${startdir}/shiromino.ini" "$pkgdir/usr/share/shiromino/"
  for f in assets/audio assets/font assets/image; do
    cp -r "$f" "$pkgdir/usr/share/shiromino/assets/"
  done
  cat > shiromino << EOF
#!/bin/sh
shiromino-game --configuration-file /usr/share/shiromino/shiromino.ini
EOF
  install -Dm755 "shiromino" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE-src "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-assets "$pkgdir/usr/share/licenses/$pkgname/"
}

