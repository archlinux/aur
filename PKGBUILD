# Maintainer: Fleny <fleny113@outlook.com>
# Contributor: Grifonice99 <grifonice99@gmail.com>

pkgname=hexus
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern, cross-platform process manager"
arch=('x86_64')
license=('MIT')
url='https://github.com/Fleny113/Hexus'
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0' 'aspnet-targeting-pack-10.0')
source=("git+https://github.com/Fleny113/Hexus.git#tag=$pkgver")
sha512sums=('bddf93df662021caaf1eb96670c68f76d0b61062e1209f71154c042f65cb32c0f8c6f7358a743b809254526c5a0e37b33d5f1f0b8824a73f3407463268095d17')
conflicts=('hexus')

_reponame=Hexus

build() {
    cd "$srcdir/$_reponame"
    dotnet publish Hexus -p:ContinuousIntegrationBuild=true
}

package() {
    install -Dm644 "$srcdir/$_reponame/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    install -d "$pkgdir/usr/lib/${pkgname}"

    cp -dr --no-preserve=ownership "$srcdir/$_reponame/artifacts/publish/Hexus/release/"* "$pkgdir/usr/lib/${pkgname}/"

    install -Dm755 \
        "$srcdir/$_reponame/artifacts/publish/Hexus/release/hexus" \
        "$pkgdir/usr/lib/${pkgname}/hexus"

    install -Dm755 \
        "$srcdir/$_reponame/artifacts/publish/Hexus/release/hexusd" \
        "$pkgdir/usr/lib/${pkgname}/hexusd"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/${pkgname}/hexus" "$pkgdir/usr/bin/hexus"
    ln -s "/usr/lib/${pkgname}/hexusd" "$pkgdir/usr/bin/hexusd"
}
