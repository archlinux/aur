# Maintainer:

pkgname=imageglass
_name=ImageGlass
pkgver=10.0.6.906
pkgrel=1
pkgdesc="A fast, open-source, modern image viewer for 90+ formats"
arch=('x86_64')
url="https://imageglass.org"
license=('GPL-3.0-only')
depends=('dotnet-runtime=10.0' 'fontconfig' 'glibc' 'libgomp' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk=10.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/d2phap/ImageGlass/archive/${pkgver}.tar.gz")
sha256sums=('e9d8f4e5134c5ba39ee90030da6be7ae9b84af9d34c69b3640a652c98dab7e08')

build() {
    cd "${_name}-${pkgver}/source"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:Platform=x64
        -p:PublishAot=false
        -p:PublishReadyToRun=true
        -p:PublishSingleFile=false
        -p:PublishTrimmed=false
        -p:SelfContained=false
    )
    dotnet publish "${publish_args[@]}" ImageGlass.Linux/ImageGlass.Linux.csproj
}

package() {
    cd "${_name}-${pkgver}/source"
    install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
    cp -r build "${pkgdir}/usr/lib/${pkgname}"
    cp -r __assets/__app/* "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/ImageGlass" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 __assets/linux/flatpak/io.github.d2phap.imageglass.svg -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 __assets/linux/flatpak/io.github.d2phap.imageglass.desktop -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}" -type f \( -iname '*.dbg' -o -iname '*.pdb' \) -delete
}
