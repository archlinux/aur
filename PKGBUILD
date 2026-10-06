# Maintainer: Blaadick <123119046+Blaadick@users.noreply.github.com>

_repoowner="Sapryx"
_reponame="Nexora"
pkgname="nexora"
pkgdesc="Open-source cross-platform desktop audio player"
license=("GPL-3.0-or-later")
pkgver="0.2.8"
pkgrel=1
arch=("x86_64")
depends=("vlc")
makedepends=("dotnet-sdk" "clang" "zlib")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/$pkgver.tar.gz"
    "nexora"
    "nexora.desktop"
)
sha512sums=('192db7ef351a6fba3649018c7db7b8fdee67d33be60824185a2c6c1a6ae97445029bf4d97f2d4275f4aa28dcea75f90f25b64be3b5b5f92042e2e9bfc72308cf'
            'e7df54e12a9ec7bbcb4e9278f773e66c8d045634cb57fed46defd308ea2bc63c015b93c9aa8095b3e54eca318f31eab849482058a60928e9ebce38a57f4e7bcc'
            '53cec80965a1d32f5c89b81d6d3b434f44fbe7b7b544a04331a99e1f26f4847af4c4f6cd1ac43f355a9b5d9f5aca51186889995b0c1578cce62999261c6bf49d')
url="https://github.com/$_repoowner/$_reponame"

build() {
    cd "$_reponame-$pkgver"
    dotnet publish src/Nexora -c Release -r linux-x64 --self-contained true -p:PublishAot=true
}

package() {
    install -Dm755 "nexora" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "nexora.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd "$_reponame-$pkgver"
    install -Dm755 "src/Nexora/bin/Release/net10.0/linux-x64/publish/Nexora" "$pkgdir/usr/lib/$pkgname/Nexora"
    for file in src/Nexora/bin/Release/net10.0/linux-x64/publish/*.so; do
        install -Dm644 "$file" "$pkgdir/usr/lib/$pkgname/"
    done
}
