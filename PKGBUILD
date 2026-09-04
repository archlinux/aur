# Maintainer: pynappo <pynappo at proton dot me>
_pkgname=ddinfo-tools
_dotnet_version=10.0
pkgname=${_pkgname}-git
pkgver=0.13.7.1.r60.g0ef2c8a
pkgrel=1
pkgdesc='Cross-platform Devil Daggers modding tools, practice tools, and custom leaderboards client'
arch=('x86_64')
url='devildaggers.info'
license=('MIT')
makedepends=("dotnet-sdk-${_dotnet_version}" 'git')
depends=("dotnet-runtime-${_dotnet_version}" 'gtk3')
source=("git+https://github.com/NoahStolk/ddinfo-tools.git")
options=("!strip" "!debug")
sha256sums=("SKIP")

build() {
    cd "${_pkgname}/scripts"
    args=(
        -p:PublishProtocol=FileSystem
        -p:TargetFramework=net$_dotnet_version
        -p:RuntimeIdentifier=linux-x64
        -p:Platform=x64
        -p:Configuration=Release
        -p:PublishDir=release-linux-x64
    )

    dotnet publish ../src/DevilDaggersInfo.Tools/DevilDaggersInfo.Tools.csproj "${args[@]}"
}

pkgver() {
    cd "${_pkgname}"
    # tags/git commit hybrid, with the 'v' prefix cut off
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    cd "${_pkgname}"
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    cp -r src/artifacts/bin/DevilDaggersInfo.Tools/release_linux-x64/* "$pkgdir/usr/lib/$_pkgname/"

    chmod 755 "$pkgdir/usr/lib/$_pkgname/ddinfo-tools"
    find "$pkgdir/usr/lib/$_pkgname" -type f -name "*.so*" -exec chmod 755 {} +

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/ddinfo-tools" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
