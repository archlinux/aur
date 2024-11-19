# Maintainer:  CloverGit <clovergit@hotmail.com>

pkgname=image2display
pkgver=1.1.2.0.r0.g47c212a
pkgrel=1
pkgdesc='A cross-platform image and font data processing tool for generating data usable by microcontrollers'
arch=('x86_64' 'aarch64')
license=('MIT')
url='https://github.com/chenxuuu/image2display'

_dotnet_os=linux
_dotnet_arch=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "x64" || ([[ "${CARCH}" == 'aarch64' ]] && echo -n "arm64"))

depends=(
  'skia-sharp'
  'dotnet-runtime'
)

makedepends=(
  'gendesk'
  'dotnet-sdk'
  'imagemagick'
)

options=(
  '!strip'
)

source=(
  "${pkgname}::git+https://github.com/chenxuuu/image2display.git"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd ${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --exec "$pkgname" \
    --icon "$pkgname" \
    --name 'Image2Display' \
    --categories "Development"
}

build() {
  cd ${srcdir}/${pkgname}/Image2Display

  rm -rf ${srcdir}/build
  dotnet publish \
    -p:PublishSingleFile=true \
    -p:UseAppHost=true \
    --runtime ${_dotnet_os}-${_dotnet_arch} \
    --configuration Release \
    --self-contained false \
    --artifacts-path ${srcdir}/build

  for _size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
    mkdir -p ${srcdir}/icons/${_size}/apps
    magick "Image2Display/Assets/logo.png" -resize ${_size} "${srcdir}/icons/${_size}/apps/${pkgname}.png"
  done
}

package() {
  cd ${srcdir}

  install -Dm755 "${srcdir}/build/publish/Image2Display/release_${_dotnet_os}-${_dotnet_arch}/Image2Display" \
    -T "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/build/publish/Image2Display/release_${_dotnet_os}-${_dotnet_arch}/libHarfBuzzSharp.so" \
    -t "${pkgdir}/usr/lib"
#  install -Dm755 "${srcdir}/build/publish/Image2Display/release_${_dotnet_os}-${_dotnet_arch}/libSkiaSharp.so" \
#    -t "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "${srcdir}/icons/${_size}/apps/${pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
  done
}
# vim: set sw=2 ts=2 et:
