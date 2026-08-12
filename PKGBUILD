# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/antigravity-tools-bin
pkgname=antigravity-tools-bin
pkgver=4.5.5
pkgrel=1
pkgdesc=Professional\ Antigravity\ Account\ Manager\ \&\ Switcher
arch=(x86_64 )
url=https://github.com/lbjlaq/Antigravity-Manager
license=(custom:CC-BY-NC-SA-4.0 )
depends=(gtk3 webkit2gtk-4.1 libappindicator-gtk3 openssl )
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(antigravity-tools )
conflicts=(antigravity-tools )
validpgpkeys=()

source=(LICENSE )
sha256sums=('6f0afc78b16f446941c6201dcc0a53e1d19dcb96b9fc2ccb497b1bf029aa3512')
sha256sums_x86_64=('86a25a1574f836843d226deea2cf24059735a0b093b2eed6d16426c941d42277')
source_x86_64=(antigravity-tools-bin-4.5.5-x86_64.deb::https://github.com/lbjlaq/Antigravity-Manager/releases/download/v4.5.5/Antigravity.Tools_4.5.5_amd64.deb )

_deb_source_file=antigravity-tools-bin-4.5.5-x86_64.deb
_deb_relocate_usr_local=true
_service_file=''
_service_install_path=''
_doc_files=()
_license_files=(LICENSE )


prepare() {
    rm -rf "${srcdir}/_deb_extract" "${srcdir}/_deb_root"
    mkdir -p "${srcdir}/_deb_extract" "${srcdir}/_deb_root"

    bsdtar -xf "${srcdir}/${_deb_source_file}" -C "${srcdir}/_deb_extract"

    local data_archives=("${srcdir}/_deb_extract"/data.tar.*)
    [ -e "${data_archives[0]}" ] || {
        echo "Missing data.tar.* inside Debian package" >&2
        return 1
    }

    bsdtar -xf "${data_archives[0]}" -C "${srcdir}/_deb_root"
}

package() {
    install -d "${pkgdir}"
    cp -a "${srcdir}/_deb_root/." "${pkgdir}/"

    if [ "${_deb_relocate_usr_local}" = true ] && [ -d "${pkgdir}/usr/local" ]; then
        install -d "${pkgdir}/usr"
        cp -a "${pkgdir}/usr/local/." "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    local doc_file
    for doc_file in "${_doc_files[@]}"; do
        [ -f "${srcdir}/${doc_file}" ] || continue
        install -Dm644 "${srcdir}/${doc_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${doc_file}")"
    done

    local license_file
    for license_file in "${_license_files[@]}"; do
        [ -f "${srcdir}/${license_file}" ] || continue
        install -Dm644 "${srcdir}/${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
    done

    if [ -n "${_service_file}" ] && [ -f "${srcdir}/${_service_file}" ]; then
        install -Dm644 "${srcdir}/${_service_file}" "${pkgdir}${_service_install_path}"
    fi
}
