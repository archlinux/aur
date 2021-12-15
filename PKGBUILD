# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
# Contributor: sixpindin <sixpindin@gmail.com>
pkgname=omnisharp-roslyn
pkgver=1.38.0
pkgrel=1
pkgdesc="OmniSharp server (STDIO) based on Roslyn workspaces"
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk' 'mono' 'mono-msbuild')
source=("https://github.com/OmniSharp/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b5afb1781b8d191e64d3e15604691a22cb4c21d6af755122b23d19f4f509c3b')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # /etc/os-release doesn't exist inside the build chroot, use
    # /usr/lib/os-release instead
    sed -i 's|/etc/os-release|/usr/lib/os-release|' scripts/platform.cake

    # normally the build sets the version from git, we don't have a git repo so
    # just override it manually
    sed -i "s/0.0.1-local/$pkgver/" scripts/common.cake
    sed -i "s/0.0.1.0/${pkgver%.*}.0.0/" scripts/common.cake

    # only built STDIO
    sed -i 's/"OmniSharp.Stdio.Driver",/"OmniSharp.Stdio.Driver"/;/OmniSharp.Http.Driver/d' build.json

    # only build x86_64
    sed -i '/linux-arm64/d' build.cake
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./build.sh --target PublishNet6Builds --configuration Release
}

package() {
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname-$pkgver/artifacts/publish/OmniSharp.Stdio.Driver/linux-x64/net6.0" "$pkgdir/usr/lib/$pkgname"

    install -d "$pkgdir/usr/share/licences/$pkgname"
    mv "$pkgdir/usr/lib/$pkgname/license.md" "$pkgdir/usr/share/licences/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "../lib/$pkgname/OmniSharp" "$pkgdir/usr/bin/omnisharp"
}
