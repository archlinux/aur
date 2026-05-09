# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gpu-t
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight GPU-Z clone for Linux"
arch=('x86_64')
url="https://github.com/lseurttyuu/GPU-T"
license=('MIT')
depends=(
  'clinfo'
  'dotnet-runtime-9.0'
  'fontconfig'
  'libva-utils'
  'mesa-utils'
  'pciutils'
  'vulkan-tools'
)
makedepends=(
  'desktop-file-utils'
  'dotnet-sdk-9.0'
)
optdepends=(
  'opencl-driver: packaged OpenCL driver'
  'opengl-driver: packaged openGL driver'
  'vulkan-driver: packaged Vulkan driver'
)
source=("GPU-T-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fc168d8fefe68f7ed5477e0156bba3c474e9c185225611df99c5fe69476842d')

prepare() {
  cd "GPU-T-$pkgver"
  desktop-file-edit --set-icon="$pkgname" "SharunAppImage/$pkgname.desktop"
}

build() {
  cd "GPU-T-$pkgver"

  # disable dotnet telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_NOLOGO=1

  dotnet publish Nvapi/GPU-T.Nvapi.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --output builddir \
    -p:DebugSymbols=false \
    -p:DebugType=None

  dotnet publish GPU-T.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --no-self-contained \
    --output builddir \
    -p:DebugSymbols=false \
    -p:DebugType=None \
    -p:PublishDocumentationFiles=false \
    -p:SatelliteResourceLanguages="en"
}

package() {
  cd "GPU-T-$pkgver"
  install -Dm755 builddir/{GPU-T,GPU-T.Nvapi} -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 builddir/*.{dll,json} -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 builddir/*.so -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 Assets/app_icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "SharunAppImage/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/GPU-T" "$pkgdir/usr/bin/"
}
