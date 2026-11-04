# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen3.8 Flash Next.
# Desktop GUI is WPF and Windows-only; on Linux the upstream ships the CLI only.
# This package builds the CLI from source, framework-dependent on the system .NET runtime.
pkgname=discimagestudio
pkgver=1.4.0
pkgrel=1
pkgdesc='Disc Image Studio CLI: generate and burn visible image-mapped CD, DVD and BD-R discs (Linux CLI, GUI is Windows-only)'
arch=('x86_64')
url='https://github.com/JiaFeiMiao-K-Cat/DiscImageStudio'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime>=10')
makedepends=('dotnet-sdk>=10')
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('895e3d4c1ffe4b1a1b9627a058b7ddc8b6b77a1510cfb78f37b0ff337554b2a7')

build() {
    cd "DiscImageStudio-$pkgver"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1 DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export NUGET_PACKAGES="$srcdir/.nuget"

    # framework-dependent: rides on the system dotnet-runtime (Arch policy, no bundled runtime)
    # UseAppHost=false: no native launcher; a wrapper script calls `dotnet` instead,
    # which keeps the managed payload out of /usr/bin (namcap: no ELF under /usr/share)
    dotnet publish src/DiscImageStudio.Cli -c Release -r linux-x64 --self-contained false \
        -p:PublishSingleFile=false -p:UseAppHost=false -o publish
}

check() {
    cd "DiscImageStudio-$pkgver"

    # DVD engine regression suite built into the CLI
    /usr/bin/dotnet "$srcdir/DiscImageStudio-$pkgver/publish/disc-image-studio.dll" selftest
}

package() {
    cd "DiscImageStudio-$pkgver"

    install -Dm644 publish/disc-image-studio.dll "$pkgdir/usr/share/discimagestudio/disc-image-studio.dll"
    install -Dm644 publish/disc-image-studio.deps.json "$pkgdir/usr/share/discimagestudio/disc-image-studio.deps.json"
    install -Dm644 publish/disc-image-studio.runtimeconfig.json "$pkgdir/usr/share/discimagestudio/disc-image-studio.runtimeconfig.json"
    install -Dm644 publish/*.dll "$pkgdir/usr/share/discimagestudio/"

    cat >disc-image-studio <<'EOF'
#!/bin/sh
exec dotnet /usr/share/discimagestudio/disc-image-studio.dll "$@"
EOF
    install -Dm755 disc-image-studio "$pkgdir/usr/bin/disc-image-studio"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
