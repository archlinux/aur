# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=0.0.5.r0.g54c0473
pkgrel=1
pkgdesc='A simple music player'
arch=('x86_64')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname%-git}")
depends=('electron')
makedepends=('git' 'nodejs' 'yarn')
source=("$pkgname-git::git+$url#branch=main" moosync moosync.desktop)
sha256sums=('SKIP' 'e24c5f462072ff450c74ef6af0671d3e0cafc426735932b487d00a03b46acc8f' 'fe482568ab2cde3025477e9197f15a615ed81531a2fbf7b1a2f2f47645afa282')

_get_tag() {
  _tag=$(git tag --list | grep '^v' | grep -v alpha | tail -n1)
  echo "Selected git tag: $_tag" >&2
}

prepare() {
  cd "${pkgname}-git"
  _get_tag
  git reset --hard "$_tag"
}

pkgver() {
  cd "${pkgname}-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}-git"
    yarn install && yarn electron:build --dir
}

package() {
    cd "${pkgname}-git"


    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r dist_electron/linux-unpacked/resources/* "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "build/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "build/icons/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"

    cd ../
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
}
