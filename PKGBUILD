# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Anna <morganamilo@gmail.com>

pkgname=superproductivity
_name=super-productivity
pkgver=11.0.3
pkgrel=1
pkgdesc="An advanced todo list app with timeboxing and time tracking capabilities"
arch=('x86_64')
url="https://super-productivity.com"
license=('MIT')
_electron=electron33
depends=('bash' "${_electron}" 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/super-productivity/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('d5d837af6d81b3b169ae5185a26566c7ffbf8a2c41c0057699cbaaac5d56e6c2'
            'a8945d93cacbe189b538da601b3f6ace0588c3b126236e763e8f2010005513bb'
            'f9ca69e16223b3dcfa0d8ae9dbbff231255482d85f0d72ddcc5033dac890741e')

prepare() {
    cd "${_name}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install

    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
}

build() {
    cd "${_name}-${pkgver}"
    npm run build
    npx electron-builder --linux --dir \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${_name}-${pkgver}"
    install -Dm644 app-builds/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r app-builds/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
