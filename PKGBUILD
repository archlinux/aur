# Maintainer:
# Contributor: DeepChirp <deepchirp@archlinuxcn.org>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

pkgname=losslesscut
_name=no.mifi.losslesscut
pkgver=3.70.2
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing"
arch=('any')
url="https://losslesscut.app/"
license=('GPL-2.0-only')
_electron=electron42
depends=('bash' "${_electron}" 'ffmpeg')
makedepends=('git' 'npm' 'yarn')
source=("${pkgname}::git+https://github.com/mifi/lossless-cut.git?signed#tag=v${pkgver}"
        "${pkgname}.sh")
sha256sums=('0e64ce8ba69b5597e8bf81207e2fc81fe7362365bd14d88f8da3ea6588711cc7'
            'd346f7a04c70af53c1b6c71d5213c1f7f491444209a23e4e947a5b93ec5596a0')
validpgpkeys=('1DB3130F9B5EEF992F2742C125AB36E3E81CBC26') # Mikael Finstad <finstaden@gmail.com>

prepare() {
    cd "${pkgname}"
    sed -i "s|process.resourcesPath|\"/usr/lib/${pkgname}\"|g" \
        src/main/i18nCommon.ts \
        src/main/ffmpeg.ts
    sed -i "s|/app/bin/run.sh|${pkgname}|" "${_name}.desktop"
    sed -i "s|@ELECTRON@|${_electron}|" "${srcdir}/${pkgname}.sh"

    mkdir -p ffmpeg/linux-x64/lib
    ln -sf /usr/bin/{ffmpeg,ffprobe} -t ffmpeg/linux-x64/lib
    for file in $(pacman -Flq ffmpeg | grep 'usr/lib/lib.*so$'); do
        ln -sf "/${file}" -t ffmpeg/linux-x64/lib
    done
}

build() {
    cd "${pkgname}"
    yarn install --immutable
    yarn run build
    yarn run electron-builder --linux dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/locales ffmpeg/linux-x64/lib/* -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 src/renderer/src/icon.svg "${pkgdir}/usr/share/pixmaps/${_name}.svg"
    install -Dm644 "${_name}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_name}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}
