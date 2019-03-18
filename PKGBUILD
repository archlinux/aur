# Maintainer: Martin Fracker, Jr. <martin.frackerjr@gmail.com>

pkgname=onivim-git
_reponame=oni
pkgver=0.3.7.beta2.r46.g50d89d1a5
pkgrel=2
pkgdesc="Modern modal editing, powered by Neovim"
arch=(x86_64)
conflicts=("oni")
provides=("oni")
url="https://github.com/onivim/oni"
license=("MIT")
depends=("neovim" "nodejs>=8.15.1" "gconf" "libxss")
makedepends=("tar" "rsync" "yarn" "npm")
source=("git+https://github.com/onivim/$_reponame.git"
        "LICENSE::https://raw.githubusercontent.com/onivim/oni/master/LICENSE"
        "oni.desktop"
        "icons.tar.gz")
sha256sums=("SKIP"
            "a446f219aabe3667850444bbd5f11b7e931889b4d5dbf3bc074fe00f25f1124c"
            "ca73ce42a92eb87f2a65fb37db6dd84b428c1492fb7f1c7c831cda3deca72295"
            "9b09686c82ac5670ece59608288ab2124ee3147d404b77ac58c6ba332a6a148a")

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  repo="$srcdir/$_reponame"

  yarn --cwd $repo install || { echo "HINT: If you are using nvm, run 'nvm use system'"; exit 1; }
  yarn --cwd $repo run build
  yarn --cwd $repo run pack --dir

  rsync -r "$repo/dist/linux-unpacked/" "$pkgdir/opt/$pkgname"
  install -Dm644 oni.desktop $pkgdir/usr/share/applications/oni.desktop

  ln -s /opt/$pkgname/oni $pkgdir/usr/bin/oni
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 icons/$i.png $pkgdir/usr/share/icons/hicolor/$i/apps/oni.png
  done
}
# vim:set ts=2 sw=2 et:
