# Maintainer: Fleny <fleny113@outlook.com>
# Contributor: Grifonice99 <grifonice99@gmail.com>

pkgname=hexus
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern, cross-platform process manager"
arch=('x86_64')
license=('MIT')
url='https://github.com/Fleny113/Hexus'
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0' 'aspnet-targeting-pack-10.0')
source=("git+https://github.com/Fleny113/Hexus.git#tag=$pkgver")
sha512sums=('2d07246d111cd6d9a6da2309596887f4ca52f78c4cb0a412c2f9c9ee146cfa53b297b22384657c2ffbeb276a232000e9ccfb801663daf8fd84d2c9759aa9ed5f')
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
