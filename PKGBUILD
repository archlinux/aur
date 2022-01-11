# Maintainer: Krzysztof Saczuk <zakku@zakku.eu>
# Contributor: Maxim Baz <cerebro@maximbaz.com>
pkgname=cerebro-git
_pkgname=cerebro
pkgver=v0.4.0.r4.gb2039c2
pkgrel=2
pkgdesc='Open-source productivity booster with a brain.'
arch=('x86_64')
url='https://cerebroapp.com/'
license=('MIT')
conflicts=('cerebro')
depends=('nss' 'gtk3')
makedepends=('gendesk' 'python2' 'git' 'npm' 'yarn')
provides=('cerebro')
source=(
    'cerebro.desktop'
    'git+https://github.com/cerebroapp/cerebro.git'
)
sha256sums=(
    '3f6cf397952372f1bdf144b61dc02c977a127b04d52166947173aadf94cf3274'
    'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  yarn && cd ./app && yarn && cd ../
  yarn run build --linux --dir
}

package() {
    cd "${srcdir}"

    echo "Creating desktop entry file.."
    install -D "${srcdir}/cerebro.desktop" "${pkgdir}/usr/share/applications/cerebro.desktop"

    echo "Coping icons..."
    install -D "${srcdir}/${_pkgname}/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    for size in 16 32 48 128 256 512 1024; do
        install -D "${srcdir}/${_pkgname}/build/icons/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done

    echo "Coping build..."
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -rf "${srcdir}/${_pkgname}/release/linux-unpacked/." "${pkgdir}/opt/${_pkgname}"

    echo "Copying licenses..."
    for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
        install -D "${pkgdir}/opt/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgdir}/${license}"
        rm "${pkgdir}/opt/${_pkgname}/${license}"
    done

    echo "Linking binary file"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
