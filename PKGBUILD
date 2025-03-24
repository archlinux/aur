# Maintainer: LJ <aur.lj at munally.com>

pkgname=verso-git
_pkgname=verso
pkgver=20250324.052031.d567c169
pkgrel=1
pkgdesc="A web browser that plays old world blues to build new world hope"
arch=('x86_64')
url="https://github.com/versotile-org/$_pkgname"
license=('MIT' 'Apache-2.0')
makedepends=('cargo')
#source=("git+$url#tag=$pkgver")
source=("git+$url")
b2sums=(
    'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  git -c "core.abbrev=8" show -s "--format=%cd-%h" "--date=format:%Y%m%d-%H%M%S" | tr - .
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
    cargo build --release --package verso
}

package() {
    install -Dm755 "$_pkgname/target/release/${_pkgname}view" "$pkgdir/opt/$_pkgname/bin/${_pkgname}view"
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/opt/$_pkgname/bin/$_pkgname"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/$_pkgname/resources"
    cp -r "$_pkgname/resources/"* "$pkgdir/opt/$_pkgname/resources"
    
    ln -s "$pkgdir/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname/icons/icon256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.versotile.verso.png"
    install -Dm644 "$_pkgname/org.versotile.verso.desktop" "$pkgdir/usr/share/applications/verso.desktop"
    sed -i 's/Exec=verso/Exec=bin\/verso/' "$pkgdir/usr/share/applications/verso.desktop"
    echo "Path=/opt/$_pkgname" >> "$pkgdir/usr/share/applications/verso.desktop"
}
