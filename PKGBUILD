# Maintainer: envolution
# Contributor: Donald Carr <sirspudd at gmail dot com>

pkgname=clang17-bin
pkgver=17.0.6
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
options=(!debug)
license=('Apache-2.0-with-LLVM-Exception')
source=(
        "${pkgname}-${pkgver}.tar.xz::https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/clang+llvm-${pkgver}-x86_64-linux-gnu-ubuntu-22.04.tar.xz"
)
sha512sums=('675328267d98d64fee680d2cdb0bfb0a7d870e7ae8bf6983202ed400996cc1d691b116ec9055eba20218271bb6beeb49f14562b0eb0b75816319daa11e59920e')
install=clang.install

_prefix_path="/opt/clang17"
_install_dir="${pkgver}-official"
_pkgdir="clang+llvm-${pkgver}-x86_64-linux-gnu-ubuntu-22.04"

_prepare_install_script() {
	cp ${startdir}/.clang.install ${startdir}/clang.install
	sed -i "s,CLANG_PREFIX,${_prefix_path},g" ${startdir}/clang.install
	sed -i "s,CLANG_VERSION,${_install_dir},g" ${startdir}/clang.install
}

package() {
    _prepare_install_script
    local install_path="${pkgdir}/${_prefix_path}/${_install_dir}"
    mkdir -p ${install_path}
    mv ${_pkgdir}/* ${install_path}
    rm $install_path/lib/*.a
    local tools=("clang" "clang++" "clangd" "clang-format" "clang-tidy" \
                 "llvm-ar" "llvm-nm" "llvm-objdump" "llvm-cov")
    local version="17"
    local src_dir="/opt/clang17/latest/bin"
    local lib_path="/opt/clang17/latest/lib"
    local dest_dir="${pkgdir}/usr/bin"

    # Ensure destination directory exists
    mkdir -p "$dest_dir"

    # Create versioned wrappers
    for tool in "${tools[@]}"; do
        wrapper_path="${dest_dir}/${tool}-${version}"
        cat << EOF > "$wrapper_path"
#!/bin/bash
export LD_LIBRARY_PATH="${lib_path}:\$LD_LIBRARY_PATH"
exec ${src_dir}/${tool} "\$@"
EOF
        chmod 755 "$wrapper_path"
    done
}
