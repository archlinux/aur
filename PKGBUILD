# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/zellij-no-mouse-resize
pkgname=zellij-no-mouse-resize
pkgver=0.44.3
pkgrel=1
pkgdesc=Zellij\ with\ advanced_mouse_actions\ also\ gating\ pane\ mouse\ resize
arch=(x86_64 )
url=https://zellij.dev
license=(MIT )
depends=(curl libcurl.so glibc libgcc libgcc_s.so zlib libz.so )
makedepends=(cargo )
checkdepends=()
optdepends=()
options=(\!lto )
provides=(zellij )
conflicts=(zellij zellij-bin zellij-git )
validpgpkeys=()

source=(0001-gate-mouse-resize-behind-advanced-actions.patch zellij-no-mouse-resize-0.44.3.tar.gz::https://github.com/zellij-org/zellij/archive/refs/tags/v0.44.3.tar.gz )
sha256sums=('08d7a88e5f0546a86f76077a8b10e808e0d6ea1ad3f5355b4ba81d587b7c622e'
            '33ae61fc802b59462fed49b424893596d3aa819646bdce53d5602f714c1264fe')

_source_dir=zellij-0.44.3
_binary_source_path=target/release/zellij
_install_bin_path=/usr/bin/zellij
_run_check=false
_patch_files=(0001-gate-mouse-resize-behind-advanced-actions.patch )
_cargo_fetch_args=()
_cargo_build_args=(--release --frozen )
_cargo_check_args=(--frozen )
_doc_files=(GOVERNANCE.md README.md )
_license_files=(LICENSE.md )


prepare() {
    cd "${srcdir}/${_source_dir}"

    local patch_file
    for patch_file in "${_patch_files[@]}"; do
        patch -Np1 -i "${srcdir}/${patch_file}"
    done

    if [ "${#_cargo_fetch_args[@]}" -gt 0 ]; then
        cargo fetch "${_cargo_fetch_args[@]}"
    else
        local target
        target=$(rustc -vV | sed -n 's/^host: //p')
        cargo fetch --locked --target "${target}"
    fi
}

build() {
    cd "${srcdir}/${_source_dir}"

    if [ "${#_cargo_build_args[@]}" -gt 0 ]; then
        cargo build "${_cargo_build_args[@]}"
    else
        cargo build --release --frozen
    fi
}

check() {
    [ "${_run_check}" = true ] || return 0

    cd "${srcdir}/${_source_dir}"
    if [ "${#_cargo_check_args[@]}" -gt 0 ]; then
        cargo test "${_cargo_check_args[@]}"
    else
        cargo test --frozen
    fi
}

package() {
    cd "${srcdir}/${_source_dir}"

    install -Dm755 "${_binary_source_path}" "${pkgdir}${_install_bin_path}"

    local doc_file
    local doc_source
    for doc_file in "${_doc_files[@]}"; do
        doc_source=""
        if [ -f "${doc_file}" ]; then
            doc_source="${doc_file}"
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
        if [ -f "${license_file}" ]; then
            license_source="${license_file}"
        elif [ -f "${srcdir}/${license_file}" ]; then
            license_source="${srcdir}/${license_file}"
        else
            continue
        fi

        install -Dm644 "${license_source}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
    done
}
