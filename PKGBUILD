# Maintainer: yobson <aur@yobson.xyz>
_pkgname=GPU-T
pkgname=${_pkgname,,}-git
pkgdesc='GPU-T is a modern desktop utility built with .NET and Avalonia UI designed to provide detailed information about your video card and GPU'
pkgver=0.2.1.r10.g9b2f14e
pkgrel=1
arch=('x86_64')
url="https://github.com/lseurttyuu/${_pkgname}"
license=('MIT')
makedepends=('git' 'dotnet-host' 'dotnet-sdk-10.0' 'clang' 'zlib')
depends=('dotnet-runtime-10.0' 'vulkan-tools' 'clinfo' 'mesa' 'mesa-utils' 'libva-utils' 'pciutils' 'hicolor-icon-theme')
optdepends=('rocm-opencl-runtime: OpenCL platform for clinfo to get details for AMD GPUs'
    'rocm-hip-runtime: HIP support detection for AMD GPUs'
    'intel-compute-runtime: OpenCL platform for clinfo to get details for Intel GPUs'
    'opencl-nvidia: OpenCL platform for clinfo to get details for NVIDIA GPUs')
source=("git+$url.git")
sha256sums=('SKIP')
provides=('gpu-t')
conflicts=('gpu-t')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_NOLOGO=1
    export NUGET_PACKAGES="$srcdir/nuget"

    dotnet restore --runtime linux-x64
}

build() {
    cd "$srcdir/$_pkgname"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_NOLOGO=1
    export NUGET_PACKAGES="$srcdir/nuget"

    # this should use --no-restore too but there is a bug
    # in the current arch version of dotnet 10 https://github.com/dotnet/sdk/issues/51766
    # it's fixed in 10.0.200+ but arch is currently on 10.0.110
    dotnet publish Nvapi/GPU-T.Nvapi.csproj --configuration Release \
        --runtime linux-x64 \
        --output ./publish_output \
        -p:DebugSymbols=false \
        -p:DebugType=None

    dotnet publish ${_pkgname}.csproj --configuration Release --no-restore \
        --runtime linux-x64 \
        --no-self-contained \
        --output ./publish_output \
        -p:DebugSymbols=false \
        -p:DebugType=None \
        -p:PublishDocumentationFiles=false \
        -p:SatelliteResourceLanguages="en"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "SharunAppImage/gpu-t.desktop" "$pkgdir/usr/share/applications/gpu-t.desktop"
    install -Dm644 "Assets/app_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/gpu_t.png"

    install -Dm755 publish_output/GPU-T $pkgdir/usr/lib/$_pkgname/$_pkgname
    install -Dm755 publish_output/GPU-T.Nvapi $pkgdir/usr/lib/$_pkgname/$_pkgname.Nvapi
    install -Dm644 publish_output/*.{dll,json} -t "$pkgdir/usr/lib/$_pkgname/"
    install -Dm755 publish_output/*.so -t "$pkgdir/usr/lib/$_pkgname/"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/GPU-T" "$pkgdir/usr/bin/GPU-T"
}
