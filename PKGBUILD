# Maintainer: Fleny <fleny113@outlook.com>
# Contributor: Grifonice99 <grifonice99@gmail.com>

pkgname=hexus-git
pkgver=0.5.0.r2.e3ac116
pkgrel=2
pkgdesc="A modern, cross-platform process manager"
arch=('x86_64')
license=('MIT')
url='https://github.com/Fleny113/Hexus'
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0' 'aspnet-targeting-pack-10.0')
source=("git+https://github.com/Fleny113/Hexus.git")
sha512sums=('SKIP')
provides=('hexus')
conflicts=('hexus')

_reponame=Hexus

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_reponame"
    dotnet publish Hexus -p:ContinuousIntegrationBuild=true
}

package() {
    install -Dm644 "$srcdir/$_reponame/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

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
