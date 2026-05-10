# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Anna <morganamilo@gmail.com>

pkgname=superproductivity
_name=super-productivity
pkgver=18.5.0
pkgrel=1
pkgdesc="An advanced todo list app with timeboxing and time tracking capabilities"
arch=('x86_64')
url="https://super-productivity.com"
license=('MIT')
_electron=electron41
depends=('bash' "${_electron}" 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++')
makedepends=('nvm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/super-productivity/super-productivity/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('51ab22a9d91fd2dc18545e84f37b7c93fe7b9e3cdb0e9bdcb0458bd159d055b1'
            'a8945d93cacbe189b538da601b3f6ace0588c3b126236e763e8f2010005513bb'
            'f9ca69e16223b3dcfa0d8ae9dbbff231255482d85f0d72ddcc5033dac890741e')

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm

    cd "${_name}-${pkgver}"
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
    nvm install
}

build() {
    _ensure_local_nvm

    cd "${_name}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install
    npm run build
    npx electron-builder --linux --dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${_name}-${pkgver}"
    install -Dm644 .tmp/app-builds/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r .tmp/app-builds/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
