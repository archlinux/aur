# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
# Contributor: sixpindin <sixpindin@gmail.com>
pkgname=omnisharp-roslyn
pkgver=1.39.7
pkgrel=2
pkgdesc="OmniSharp server (STDIO) based on Roslyn workspaces"
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('dotnet-sdk')
source=(
    "https://github.com/OmniSharp/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/OmniSharp/$pkgname/commit/87b61078e86230cac3fca6e64d894ee092776a1c.patch"
)
sha256sums=('1e5b73e393e62d75e789bae7a19bcdb57548f8966647c533fb8243a42fba0373'
            'da3730a4022c5c50cd8b3575f13603eac6cfd4b81c2591583c33ca6d29e673b8')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

    # normally the build sets the version from git, we don't have a git repo so
    # just override it manually
    sed -i "s/0.0.1-local/$pkgver/" scripts/common.cake
    sed -i "s/0.0.1.0/${pkgver%.*}.0.0/" scripts/common.cake

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

    export DOTNET_NOLOGO=1

    dotnet tool restore
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    dotnet cake --target PublishNet6Builds --configuration Release --exclusive --use-global-dotnet-sdk
}

package() {
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname-$pkgver/artifacts/publish/OmniSharp.Stdio.Driver/linux-x64/net6.0" "$pkgdir/usr/lib/$pkgname"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    mv "$pkgdir/usr/lib/$pkgname/license.md" "$pkgdir/usr/share/licenses/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "../lib/$pkgname/OmniSharp" "$pkgdir/usr/bin/OmniSharp"
    # for compat
    ln -s "../lib/$pkgname/OmniSharp" "$pkgdir/usr/bin/omnisharp"
}
