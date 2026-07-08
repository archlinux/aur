# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/wlroots0.20-vmwgfx
pkgname=wlroots0.20-vmwgfx
pkgver=0.20.2
pkgrel=1
pkgdesc=Modular\ Wayland\ compositor\ library\ with\ a\ vmwgfx\ compatibility\ patch
arch=(x86_64 )
url=https://gitlab.freedesktop.org/wlroots/wlroots
license=(MIT )
depends=(glibc libdisplay-info.so libdrm libglvnd libinput liblcms2.so libliftoff.so libpixman-1.so libseat.so libudev.so libvulkan.so libwayland-client.so libwayland-server.so libxcb libxkbcommon.so wayland-protocols opengl-driver xcb-util-errors xcb-util-renderutil xcb-util-wm )
makedepends=(git glslang meson ninja systemd vulkan-headers xorg-xwayland )
checkdepends=()
optdepends=(xorg-xwayland:\ Xwayland\ support vulkan-validation-layers:\ validation\ layers\ for\ the\ experimental\ vulkan\ renderer\ backend )
options=()
provides=(libwlroots-0.20.so wlroots0.20 )
conflicts=(wlroots0.20 )
validpgpkeys=(34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A 4100929B33EEB0FD1DB852797BC79407090047CA )

source=(0001-vmwgfx-disable-dmabuf-import-check-after-close-failure.patch wlroots0.20-vmwgfx::git+https://gitlab.freedesktop.org/wlroots/wlroots.git#tag=0.20.2\?signed )
sha256sums=('04e162eeef30b990a64b29e55fe1145d762d3621b3ed59ed4e9828fd142f3647'
            '6c8595da579a8df74bc307294c2485e90f5379b84390381f500da33ff3f276d2')

_source_dir=wlroots0.20-vmwgfx
_build_dir=build
_run_check=false
_patch_files=(0001-vmwgfx-disable-dmabuf-import-check-after-close-failure.patch )
_meson_options=()
_check_args=()
_doc_files=()
_license_files=(LICENSE )


prepare() {
    local patch_file

    cd "${srcdir}/${_source_dir}"

    for patch_file in "${_patch_files[@]}"; do
        patch -Np1 -i "${srcdir}/${patch_file}"
    done
}

build() {
    cd "${srcdir}"
    arch-meson "${srcdir}/${_source_dir}" "${srcdir}/${_build_dir}" "${_meson_options[@]}"
    meson compile -C "${srcdir}/${_build_dir}"
}

check() {
    [ "${_run_check}" = true ] || return 0
    meson test -C "${srcdir}/${_build_dir}" "${_check_args[@]}"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "${srcdir}/${_build_dir}"

    local doc_file
    local doc_source
    for doc_file in "${_doc_files[@]}"; do
        doc_source=""
        if [ -f "${srcdir}/${_source_dir}/${doc_file}" ]; then
            doc_source="${srcdir}/${_source_dir}/${doc_file}"
        elif [ -f "${srcdir}/${doc_file}" ]; then
            doc_source="${srcdir}/${doc_file}"
        else
            continue
        fi

        install -Dm644 "${doc_source}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${doc_file}")"
    done

    local license_file
    local license_source
    for license_file in "${_license_files[@]}"; do
        license_source=""
        if [ -f "${srcdir}/${_source_dir}/${license_file}" ]; then
            license_source="${srcdir}/${_source_dir}/${license_file}"
        elif [ -f "${srcdir}/${license_file}" ]; then
            license_source="${srcdir}/${license_file}"
        else
            continue
        fi

        install -Dm644 "${license_source}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
    done
}
