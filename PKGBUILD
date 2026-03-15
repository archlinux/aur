# Maintainer: yobson <aur@yobson.xyz>
_pkgname=GPU-T
pkgname=${_pkgname,,}-git
pkgdesc='GPU-T is a modern desktop utility built with .NET and Avalonia UI designed to provide detailed information about your video card and GPU'
pkgver=0.1.2.r3.gf047522
pkgrel=1
arch=('x86_64')
url="https://github.com/lseurttyuu/${_pkgname}"
license=('MIT')
makedepends=('git' 'dotnet-host' 'dotnet-sdk-9.0')
depends=('dotnet-runtime-9.0' 'vulkan-tools' 'clinfo' 'mesa' 'mesa-utils' 'libva-utils' 'pciutils' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('rocm-opencl-runtime: OpenCL platform for clinfo to get details for AMD GPUs'
    'rocm-hip-runtime: HIP support detection for AMD GPUs'
    'intel-compute-runtime: OpenCL platform for clinfo to get details for Intel GPUs'
    'opencl-nvidia: OpenCL platform for clinfo to get details for NVIDIA GPUs')
source=("git+$url.git"
    "gpu-t.desktop")
sha256sums=('SKIP'
    'ca8bc029dac44cd957b2f72d2acbb7381317968d0cde8ddbc6f0a677a05a63b5')
provides=('gpu-t')
conflicts=('gpu-t')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    export DOTNET_NOLOGO=1

    dotnet restore
}

build() {
    cd "$srcdir/$_pkgname"
    dotnet build ${_pkgname}.csproj --configuration Release --no-restore
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/gpu-t.desktop" "$pkgdir/usr/share/applications/gpu-t.desktop"
    install -Dm644 "Assets/app_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/gpu-t.png"

    cd ./bin/Release/net9.0
    install -Dm755 GPU-T $pkgdir/usr/lib/$_pkgname/$_pkgname
    cp *.dll *.json "$pkgdir/usr/lib/$_pkgname/"
    install -d "$pkgdir/usr/lib/$_pkgname/runtimes/linux-x64/native"
    cp -r ./runtimes/linux-x64/native/* "$pkgdir/usr/lib/$_pkgname/runtimes/linux-x64/native/"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/GPU-T" "$pkgdir/usr/bin/gpu-t"
}

post_install() {
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
