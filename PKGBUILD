# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=Scarab
pkgname=scarab
pkgver=1.14.0.0
pkgrel=1
pkgdesc="Hollow Knight mod manager"
arch=(x86_64 i686)
url="https://github.com/fifty-six/Scarab"
license=('GPL')

depends=(dotnet-runtime)
makedepends=(dotnet-sdk)
conflicts=(scarab-bin)
options=(!strip)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/fifty-six/Scarab/archive/v$pkgver.tar.gz"
        "scarab.desktop")
sha1sums=("2b969d0cb1104c02644abaa5884916c0f2656026"
          "8ff187bcb309790529ef723de39ba1b9fc0a449d")

build() {
    cd "$_pkgname-$pkgver"
    dotnet build --configuration Release Scarab.sln
    dotnet publish --configuration Release --output publish/ Scarab.sln
}

package() {
    cd "$_pkgname-$pkgver"
    rm -R publish/runtimes/{osx,win*,linux-arm*,linux-musl*}

    install -D -o root -m 755 -d "$pkgdir/usr/bin"
    install -D -o root -m 755 -d "$pkgdir/usr/lib"

    cp -R publish/ "$pkgdir/usr/lib/scarab"
    ln -s /usr/lib/scarab/Scarab "$pkgdir/usr/bin/scarab"

    install -Dm 644 Scarab/Assets/omegamaggotprime.ico "$pkgdir/usr/share/icons/scarab.ico"
    install -Dm 644 "$srcdir/scarab.desktop" "$pkgdir/usr/share/applications/scarab.desktop"
}
