# Maintainer: MYT1 <MYT1 @ QQ COM>
pkgname=bilibili-linux-git
_pkgname=bilibili-linux
pkgver=20241228.a5b5b6d
_electronversion=33
_nodeversion=23
pkgrel=1
pkgdesc="这是哔哩哔哩 Linux版"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/msojocs/bilibili-linux"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
    "ffmpeg"
)
makedepends=(
    'wget'
    'perl-image-exiftool'
    'asar'
    'unzip'
    'p7zip'
    'curl'
    'npm'
    'nvm'
    'pnpm'
)
source=(
    "git+$url.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Commit date + short rev
    echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${_pkgname}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${_pkgname}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/\"electronVersion\": \"[^\"]*\"/\"electronVersion\": \"${SYSTEM_ELECTRON_VERSION}\"/g" conf/build.json
    NODE_ENV=development    pnpm install
    sh tools/update-bilibili
    sh tools/fix-other.sh
    sh tools/area-unlimit.sh
    mv tmp/bili/resources/* app
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/app/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/app/extensions" "${pkgdir}/usr/lib/${_pkgname}"
    mv ${srcdir}/${_pkgname}/res/${_pkgname//-linux/}.desktop ${srcdir}/${_pkgname}/res/${_pkgname}.desktop
    sed '6s/.*/Exec=bilibili-linux %u/g' -i ${srcdir}/${_pkgname}/res/${_pkgname}.desktop
    sed '9s/.*/Icon=bilibili-linux/g' -i ${srcdir}/${_pkgname}/res/${_pkgname}.desktop
    install -Dm644 "${srcdir}/${_pkgname}/res/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${_pkgname}/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644  "${srcdir}/${_pkgname}/license" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
