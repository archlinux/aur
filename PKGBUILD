# Maintainer: Fleny <fleny113@outlook.com>
# Contributor: Grifonice99 <grifonice99@gmail.com>

pkgname=hexus-git
pkgver=0.5.0.r0.2c02e62
pkgrel=1
pkgdesc="A modern, cross-platform process manager"
arch=(any)
license=('MIT')
url='https://github.com/Fleny113/Hexus'
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0' 'aspnet-targeting-pack-10.0')
source=("git+https://github.com/Fleny113/Hexus.git")
sha512sums=('SKIP')

_reponame=Hexus

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_reponame"
    dotnet publish Hexus -p:ContinuousIntegrationBuild=true -p:Deterministic=true
}

package() {
    install -Dm644 "$srcdir/$_reponame/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/lib/${pkgname%-git}"

    cp -dr --no-preserve=ownership "$srcdir/$_reponame/artifacts/publish/Hexus/release/"* "$pkgdir/usr/lib/${pkgname%-git}/"

    install -Dm755 \
        "$srcdir/$_reponame/artifacts/publish/Hexus/release/hexus" \
        "$pkgdir/usr/lib/${pkgname%-git}/hexus"

    install -Dm755 \
        "$srcdir/$_reponame/artifacts/publish/Hexus/release/hexusd" \
        "$pkgdir/usr/lib/${pkgname%-git}/hexusd"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/${pkgname%-git}/hexus" "$pkgdir/usr/bin/hexus"
    ln -s "/usr/lib/${pkgname%-git}/hexusd" "$pkgdir/usr/bin/hexusd"
}
