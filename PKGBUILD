# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/dumate-bin
pkgname=dumate-bin
pkgver=1.0.92
pkgrel=1
pkgdesc=Baidu\ DuMate\ desktop\ AI\ client
arch=(x86_64 )
url=https://www.dumate.cn/
license=(custom:baidu-dumate )
depends=(alsa-lib at-spi2-core cairo dbus expat gcc-libs glib2 glibc gtk3 libcups libnotify libsecret libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxss libxtst mesa nspr nss pango systemd-libs util-linux-libs xdg-utils )
makedepends=()
checkdepends=()
optdepends=(libappindicator-gtk3:\ system\ tray\ indicator\ support )
options=(\!strip )
provides=(dumate qianfan-desktop-app )
conflicts=(dumate qianfan-desktop-app )
validpgpkeys=()
install=dumate-bin.install
source=()
sha256sums_x86_64=('72995d729193a83f5d227c9d812ebdeeb27adaec9f49f288b3342cc7269774de')
source_x86_64=(dumate-bin-1.0.92-x86_64.deb::https://dumate-app-public.cdn.bcebos.com/release-info/linux-artifacts/Dumate-linux-amd64-latest.deb )

_deb_relocate_usr_local=false
_install_bin_path=/usr/bin/dumate
_binary_source_path=/opt/DuMate/qianfan-desktop-app
_service_file=''
_service_install_path=''
_doc_files=()
_license_files=()


prepare() {
    local _deb_source_file
    case "$CARCH" in
        x86_64) _deb_source_file=dumate-bin-1.0.92-x86_64.deb ;;
        *)
            echo "Unsupported architecture: $CARCH" >&2
            return 1
            ;;
    esac

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

    if [ -n "${_install_bin_path}" ] && [ -n "${_binary_source_path}" ]; then
        install -d "$(dirname "${pkgdir}${_install_bin_path}")"
        ln -sf "${_binary_source_path}" "${pkgdir}${_install_bin_path}"
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
