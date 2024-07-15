# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
# Contributor: sixpindin <sixpindin@gmail.com>
pkgname=omnisharp-roslyn
pkgver=1.39.11
pkgrel=2
pkgdesc="OmniSharp server (STDIO) based on Roslyn workspaces"
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('dotnet-sdk')
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('868f12bea3d929ce79453cf2bf5430f0d0b5e2bd46d4328ac02c10f1dd357787')

prepare() {
    cd "$srcdir/$pkgname"

    # only built STDIO
    sed -i 's/"OmniSharp.Stdio.Driver",/"OmniSharp.Stdio.Driver"/;/OmniSharp.Http.Driver/d' build.json

    # only build x86_64-gnu
    sed -i '/linux-arm64/d;/linux-musl/d;' build.cake

    # don't set RuntimeFrameworkVersion, just build against the version we are using
    # this is needed since otherwise we will use a crossgen compiler version built
    # against an older .NET 6 that does not have OpenSSL 3 support
    sed -i '/RuntimeFrameworkVersion/d;' build.cake
    sed -i '/RuntimeFrameworkVersion/d;' src/OmniSharp.Stdio.Driver/OmniSharp.Stdio.Driver.csproj

    # use arch-packaged .NET version rather than forcing this version
    rm global.json

    # use absolute path to global dotnet exe
    sed -i "s|? \"dotnet\"|? \"$(command -v dotnet)\"|" scripts/common.cake

    # https://github.com/advisories/GHSA-hh2w-p6rv-4g7w
    sed -i "/System.Text.Json/s/8.0.0/8.0.4/" Directory.Packages.props

    export DOTNET_NOLOGO=1

    dotnet tool restore
}

build() {
    cd "$srcdir/$pkgname"

    dotnet cake --target PublishNet6Builds --configuration Release --exclusive --use-global-dotnet-sdk
}

package() {
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/artifacts/publish/OmniSharp.Stdio.Driver/linux-x64/net6.0" "$pkgdir/usr/lib/$pkgname"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    mv "$pkgdir/usr/lib/$pkgname/license.md" "$pkgdir/usr/share/licenses/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "../lib/$pkgname/OmniSharp" "$pkgdir/usr/bin/OmniSharp"
    # for compat
    ln -s "../lib/$pkgname/OmniSharp" "$pkgdir/usr/bin/omnisharp"
}
