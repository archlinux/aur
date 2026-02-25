# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gpu-t
pkgver=0.1.2
pkgrel=1
pkgdesc="A lightweight GPU-Z clone for Linux"
arch=('x86_64')
url="https://github.com/lseurttyuu/GPU-T"
license=('MIT')
depends=(
  'clinfo'
  'dotnet-runtime-9.0'
  'libva-utils'
  'mesa-utils'
  'pciutils'
  'vulkan-tools'
)
makedepends=('dotnet-sdk-9.0')
optdepends=(
  'opengl-driver: packaged openGL driver'
  'vulkan-driver: packaged Vulkan driver'
  'opencl-driver: packaged OpenCL driver'
)
source=("GPU-T-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('14f8ffe1b93e0ebdd5359ff6839609a415a21a6c2ff9773d720fba8d3b2cead7'
            '5a8cdec32ca4fbff3fa2a2529aa2965917e573ef03c3c73028d7094050046f45')

build() {
  cd "GPU-T-$pkgver"

  # disable dotnet telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_NOLOGO=1

  dotnet build \
    --configuration Release \
    --output builddir \
    -p:DebugSymbols=false \
    -p:DebugType=none
}

package() {
  cd "GPU-T-$pkgver"
  install -Dm755 builddir/GPU-T -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 builddir/*.{dll,json} -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 builddir/runtimes/linux-x64/native/*.so -t \
    "$pkgdir/usr/lib/$pkgname/runtimes/linux-x64/native/"
  install -Dm644 Assets/app_icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/GPU-T" "$pkgdir/usr/bin/"
}
