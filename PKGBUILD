# Maintainer: jayache80

pkgname=subtitleedit-cli-git
_gitname=subtitleedit-cli
pkgver=61.540b0fd
pkgrel=1
pkgdesc='Subtitle Edit CLI (without System.Drawing)'
arch=('any')
url='https://www.nikse.dk/SubtitleEdit'
license=('LGPL')
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
    mkdir -p "${pkgdir}/opt/${_gitname}"
    cp -r src/se-cli/bin/Release/net8.0/* "${pkgdir}/opt/${_gitname}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_gitname}/seconv" "${pkgdir}/usr/bin/seconv"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
