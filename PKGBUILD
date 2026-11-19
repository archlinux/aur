# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-pytcp
pkgname=(
    python-pytcp
    python-pmd-net-addr
    python-pmd-net-proto
    python-pmd-pytcp
)
pkgver=3.0.8
pkgrel=1
epoch=
pkgdesc="The TCP/IP stack written in Python"
arch=('any')
url="https://github.com/ccie18643/PyTCP"
license=('GPL-3.0-or-later')
groups=()
_pydeps=(
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    python-click
    python-parameterized
)
optdepends=()
replaces=()
backup=()
options=()
# install=
changelog=
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('b6960f3f8d327575782ea84f22aaee02168be4b658c67ecebfa577d948866ca5')
#validpgpkeys=()

prepare(){
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgbase}"

    for _pkg in net_addr net_proto pytcp; do
        ( cd "packages/${_pkg}" && python -m build --wheel --no-isolation ) || return
    done
}

check() {
    cd "${srcdir}/${pkgbase}"

    local _py="${srcdir}/${pkgbase}/packages/net_addr:${srcdir}/${pkgbase}/packages/net_proto:${srcdir}/${pkgbase}/packages/pytcp:${srcdir}/${pkgbase}"

    local -a _tests=()
    while IFS= read -r -d '' _f; do
        _tests+=("$_f")
    done < <(find \
        packages/net_addr/net_addr/tests/unit \
        packages/net_proto/net_proto/tests/unit \
        packages/pytcp/pytcp/tests/unit \
        -name 'test__*.py' \
        ! -name 'test__lazy_click.py' \
        ! -name 'test__lib__proto_enum.py' \
        -print0)

    PYTHONPATH="${_py}" python tests_runner.py "${_tests[@]}"
}

package_python-pytcp() {
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends+=(
        python-pmd-net-addr
        python-pmd-net-proto
        python-pmd-pytcp
    )
}

package_python-pmd-net-addr() {
    pkgdesc="An alternative to Python's standard-library ipaddress module — originally built for the PyTCP stack, fully usable on its own"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends+=(
        python-click
    )

    cd "${srcdir}/${pkgbase}/packages/net_addr/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-pmd-net-proto() {
    pkgdesc="The network-protocol packet parse/assemble layer of the PyTCP stack — Ethernet through TCP/UDP — fully usable on its own"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends+=(
        python-pmd-net-addr
    )

    cd "${srcdir}/${pkgbase}/packages/net_proto/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-pmd-pytcp() {
    pkgdesc="Pure-Python, zero-dependency TCP/IP stack — Ethernet through RFC 9293 TCP — running in user space on a TAP/TUN interface as a daemon (the supported mode), with a Berkeley-sockets API and a 1:1 stdlib-socket drop-in"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends+=(
        python-pmd-net-addr
        python-pmd-net-proto
    )

    cd "${srcdir}/${pkgbase}/packages/pytcp"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

