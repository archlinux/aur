# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gpu-t
pkgver=0.1.3
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
  'opengl-driver: packaged openGL driver'
  'vulkan-driver: packaged Vulkan driver'
  'opencl-driver: packaged OpenCL driver'
)
source=("GPU-T-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4353dd15c28e6d01f9ff8f58d728b32c3ba3e2d0103fd6f965fc7525d9159a3')

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

  dotnet publish \
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
  install -Dm755 builddir/GPU-T -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 builddir/*.{dll,json} -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 builddir/*.so -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 Assets/app_icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "SharunAppImage/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/GPU-T" "$pkgdir/usr/bin/"
}
