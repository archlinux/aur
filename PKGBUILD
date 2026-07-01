# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=komi-store-bin
_pkgname=Komi-Store
_orgi_name=github-store
pkgver=1.9.2
pkgrel=1
pkgdesc="A free, open-source app store for GitHub releases — browse, discover, and install apps with one click. Powered by Kotlin and Compose Multiplatform for Android & Desktop.(Prebuilt version)"
arch=('x86_64')
url="https://www.github-store.org/"
_ghurl="https://github.com/kurikomi-labs/komi-store"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'java-runtime>=21'
    'libxrender'
    'libx11'
    'libxext'
    'libglvnd'
    'libxi'
    'libxtst'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "${pkgname%-bin}.sh"
)
sha256sums=('fd2f2ab8974a7497d7a644087075eb6728e858d737b8cd81ab1f68c21323a0d2'
            'b76d13cfeadef3a08745465c31ad8047d0039a1759d56af45953c8e507d34365')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/bin/${_orgi_name}-launcher.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${pkgname%-bin}/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}
