# Maintainer: MojArch

pkgname=git-credential-manager
pkgver=3.0.1
pkgrel=1
pkgdesc="A secure Git credential helper built on .NET"
arch=('x86_64')
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
depends=('krb5' 'zlib' 'libsecret')
makedepends=('dotnet-sdk-10.0' 'clang' 'gcc' 'git' 'dpkg' 'fontconfig')
checkdepends=('git')
conflicts=(git-credential-manager-bin)
options=(!strip !debug)

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
    '1e7c2cb1b16fb5f0f09598e194b7421327e46bdc3aa59a59b8ca83926121653015bdbaa11cc9edead5dc8a814ca95db709d99a563ea8463c07ee9d49f096c2f9'
)

build() {
    cd "${pkgname}-${pkgver}"

    export DOTNET_CLI_HOME="${srcdir}/.dotnet"
    export HOME="${srcdir}/.home"
    export DOTNET_NOLOGO=1
    export DOTNET_CLI_TELEMETRY_OPTOUT=1

    mkdir -p "$DOTNET_CLI_HOME" "$HOME"

    local rid='linux-x64'

    # Build the Linux distribution, not the solution.
    # This runs the upstream publish, package and archive steps.
    dotnet build build/linux \
        --configuration Release \
        --runtime "$rid" \
        -p:Version="$pkgver" \
        -p:NuGetAudit=false
}

package() {
    cd "${pkgname}-${pkgver}"

    local publish_dir="out/publish/git-credential-manager/release_linux-x64"

    if [[ ! -d "$publish_dir" ]]; then
        error "Published output directory not found: $publish_dir"
        error "Available publish directories:"
        find out/publish -maxdepth 3 -type d -print 2>/dev/null || true
        return 1
    fi

    if [[ ! -f "$publish_dir/git-credential-manager" ]]; then
        error "Expected executable not found in $publish_dir"
        find "$publish_dir" -maxdepth 2 -type f -print
        return 1
    fi

    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Install the complete published payload, including any required
    # companion files produced by the distribution build.
    cp -a "$publish_dir/." "$pkgdir/usr/lib/$pkgname/"

    chmod 755 "$pkgdir/usr/lib/$pkgname/git-credential-manager"

    ln -s "/usr/lib/$pkgname/git-credential-manager" \
        "$pkgdir/usr/bin/git-credential-manager"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
