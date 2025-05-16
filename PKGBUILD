# Maintainer: Mark <mark@hegreberg.io>
# Contributor: oscarcl <oscar.cowderylack@gmail.com>
# Contributor: sixpindin <sixpindin@gmail.com>
pkgname=omnisharp-roslyn
pkgver=1.39.13
pkgrel=2
pkgdesc="OmniSharp server (STDIO) based on Roslyn workspaces"
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('dotnet-sdk')
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('b023c314b920647567dd113afc170b940fa4fb94f8357857600c7dc2de25c354')

prepare() {
    cd "$srcdir/$pkgname"

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

	# force a newer version of MSBUILD to patch a vulnerability
	#sed -i 's|<MSBuildPackageVersion>17.3.2</MSBuildPackageVersion>|<MSBuildPackageVersion>17.8.294</MSBuildPackageVersion>|' Directory.Packages.props 

	#ignore vulnerability warning as the patched version does not work on omnisharp
	#sed -i 's|</NoWarn>|;NU1903</NoWarn>|' build/Settings.props
	sed -i '\|</Project>|i\
  <ItemGroup>\
    <NuGetAuditSuppress Include="https://github.com/advisories/GHSA-h4j7-5rxr-p4wc"/>\
  </ItemGroup>' build/Settings.props

    # use arch-packaged .NET version rather than forcing this version
    rm global.json

    # use absolute path to global dotnet exe
    sed -i "s|? \"dotnet\"|? \"$(command -v dotnet)\"|" scripts/common.cake

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
