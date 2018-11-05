# Maintainer: Martin Fracker, Jr. <martin.frackerjr@gmail.com>

pkgname=onivim-git
pkgver=0.3.7.beta2.r28.gc64f92926
pkgrel=1
pkgdesc="Modern modal editing, powered by Neovim"
arch=(x86_64)
conflicts=("oni")
provides=("oni")
url="https://github.com/onivim/oni"
license=("MIT")
depends=("neovim" "nodejs-lts-carbon" "gconf" "libxss")
makedepends=("tar" "rsync")
source=("$pkgname::git+https://github.com/onivim/oni.git"
        "LICENSE::https://raw.githubusercontent.com/onivim/oni/master/LICENSE"
        "oni.desktop"
        "icons.tar.gz")
sha256sums=("SKIP"
            "a446f219aabe3667850444bbd5f11b7e931889b4d5dbf3bc074fe00f25f1124c"
            "ca73ce42a92eb87f2a65fb37db6dd84b428c1492fb7f1c7c831cda3deca72295"
            "9b09686c82ac5670ece59608288ab2124ee3147d404b77ac58c6ba332a6a148a")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  dir="$srcdir/$pkgname"

  yarn --cwd $dir install || echo "If you are using nvm, run 'nvm use system'"
  yarn --cwd $dir run build
  yarn --cwd $dir run pack --dir

  rsync -r "$dir/dist/linux-unpacked/" "$pkgdir/opt/$pkgname"
  install -Dm644 oni.desktop $pkgdir/usr/share/applications/oni.desktop

  ln -s /opt/$pkgname/oni $pkgdir/usr/bin/oni
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 icons/$i.png $pkgdir/usr/share/icons/hicolor/$i/apps/oni.png
  done
}
# vim:set ts=2 sw=2 et:
