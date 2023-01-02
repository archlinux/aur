_name=webcord
pkgname=${_name}-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron API."
arch=('x86_64' 'aarch64' 'armv7h')
_repo='SpacingBat3/WebCord'
url="https://github.com/${_repo}"
license=('MIT')
_name="${pkgname%-*}"
provides=("${_name}")
conflicts=("${_name}")
options=('!emptydirs')

_get_source() {
    local archive="webcord-${pkgver}-1.$1.rpm"
    echo "${archive}::${url}/releases/download/v${pkgver}/${archive}"
}

source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE")
source_x86_64=("$(_get_source x86_64)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source armv7hl)")

sha256sums=('7e8ddf98c883358508999fe6c1296b44353e624f8a4f7b6754fcfcc9aafa4456')
sha256sums_x86_64=('c5db73918a914bab6b00bb7f79d8e1fc41c008be5345d5ef7d9330168294f888')
sha256sums_aarch64=('39acef53e4e6ea5f5243a0d567153a4ccad0833aea25832fb590f1e624b4d753')
sha256sums_armv7h=('492e3169a54fbadd54dc165d083870b761fd3a9b28a6cbc9242175984b802a02')

noextract=(
    "${source_x86_64[0]%%::*}"
    "${source_aarch64[0]%%::*}"
    "${source_armv7h[0]%%::*}"
)

package() {
    local sname="source_${CARCH}"
    bsdtar -xf "${!sname[0]%%::*}" \
        -C "${pkgdir}" \
        --exclude="usr/lib/.build-id" \
        --exclude="usr/bin" \
        --exclude="usr/share/doc"

    local bin="${pkgdir}/usr/bin"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${bin}" "${licenses}"

    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
    install -Dm644 "${source[0]%%::*}" "${licenses}/LICENSE"
}
