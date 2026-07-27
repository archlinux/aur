# Maintainer: czyt <czytcn@gmail.com>
pkgname=nowledge-mem-bin
pkgver=0.10.43
pkgrel=1
pkgdesc="你的智能体、AI 助手、代码工具，共享一套记忆"
arch=('x86_64')
url="https://mem.nowledge.co"
license=('Proprietary')
options=(!debug !strip)
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('zstd')
optdepends=('gnome-keyring: for credential storage'
            'xdg-utils: for opening links and nowledgemem:// URLs')
provides=("nowledge-mem=${pkgver}" "nmem-cli=${pkgver}")
conflicts=('nowledge-mem' 'nmem-cli')
source_x86_64=("nowledge-mem-${pkgver}.deb::https://download-mem.nowledge.co/app/${pkgver}/x86_64-unknown-linux-gnu.deb")
sha256sums_x86_64=('1876828a73d12f05be167f5f084888c0affb400e94b719c6dc1624a58be5e18c')

package() {
    # Extract deb package
    local _debfile="nowledge-mem-${pkgver}.deb"
    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"

    # Extract bundled Python runtime (required for backend and CLI)
    local _up_dir="${pkgdir}/usr/lib/Nowledge Mem/_up_"
    local _runtime_archive="${_up_dir}/python-runtime.tar.zst"
    if [ -f "${_runtime_archive}" ]; then
        tar --zstd -xf "${_runtime_archive}" -C "${_up_dir}"
        if [ -f "${_up_dir}/runtime-version.txt" ]; then
            cp "${_up_dir}/runtime-version.txt" "${_up_dir}/python-standalone/.runtime-version"
        fi
        rm -f "${_runtime_archive}"
    fi

    # Install CLI wrappers exposed by the upstream Linux package.
    local _install_path="${_up_dir}/python-standalone"
    if [ -d "${_install_path}/python" ] && [ -f "${_install_path}/app/src/nowledge_graph_server/ncli.py" ]; then
        install -dm755 "${pkgdir}/usr/bin"

        cat > "${pkgdir}/usr/bin/nmem" << 'EOF'
#!/bin/bash
PYTHON_STANDALONE="/usr/lib/Nowledge Mem/_up_/python-standalone"
PYTHON="$PYTHON_STANDALONE/python/bin/python3"
NCLI="$PYTHON_STANDALONE/app/src/nowledge_graph_server/ncli.py"
export PYTHONPATH="$PYTHON_STANDALONE/app/src:$PYTHONPATH"
exec "$PYTHON" -m nowledge_graph_server.ncli "$@"
EOF
        chmod 755 "${pkgdir}/usr/bin/nmem"

        if compgen -G "${_install_path}/python/lib/python*/site-packages/browse_now/cli.py" > /dev/null; then
            cat > "${pkgdir}/usr/bin/browse-now" << 'EOF'
#!/bin/bash
PYTHON_STANDALONE="/usr/lib/Nowledge Mem/_up_/python-standalone"
PYTHON="$PYTHON_STANDALONE/python/bin/python3"
export PYTHONPATH="$PYTHON_STANDALONE/app/src:$PYTHONPATH"
exec "$PYTHON" -c "from browse_now.cli import main; main()" "$@"
EOF
            chmod 755 "${pkgdir}/usr/bin/browse-now"
        fi
    fi
}
