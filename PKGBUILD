# Maintainer: jayache80

pkgname=subtitleedit-cli-git
_gitname=subtitleedit-cli
pkgver=43.e80c64d
pkgrel=1
pkgdesc='Subtitle Edit CLI (without System.Drawing)'
arch=('any')
url='https://www.nikse.dk/SubtitleEdit'
license=('GPL3')
depends=('dotnet-runtime-8.0')
optdepends=('tesseract: OCR support'
            'ffmpeg: Waveform extraction')
makedepends=('git'
             'dotnet-sdk-8.0')
source=(git+"https://github.com/SubtitleEdit/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    _commits=$(git rev-list --count HEAD)
    _7sha=$(git rev-parse --short HEAD)
    printf "%s.%s\n" "${_commits}" "${_7sha}"
}

build() {
    cd "${srcdir}/${_gitname}"
    dotnet build --configuration Release SeCli.sln
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm755 "src/se-cli/bin/Release/net8.0/seconv" "${pkgdir}/opt/${_gitname}/seconv"
    install -Dm644 "src/se-cli/bin/Release/net8.0/seconv.dll" "${pkgdir}/opt/${_gitname}/seconv.dll"
    install -Dm644 "src/se-cli/bin/Release/net8.0/seconv.runtimeconfig.json" "${pkgdir}/opt/${_gitname}/seconv.runtimeconfig.json"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_gitname}/seconv" "${pkgdir}/usr/bin/seconv"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
