# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-emdbg
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
epoch=
pkgdesc="Tools for debugging and profiling ARM Cortex-M devices as found on the PX4 Autopilot FMU boards"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_pydeps=(
    pyserial
    graphviz
    pygdbmi
    pyelftools
    rpyc
    rich
    # AUR
    cmsis-svd
    arm-gdb
    pymodm
    pyvis
    yoctopuce
    telnetlib-313-and-up
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-setuptools-git-versioning
)
checkdepends=()
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('aa211dbb3ae75e890a9dc82e3c3ae49e595aee5b576f7d8f5575209442c0ea1d')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -e 's|setuptools-git-versioning<2|setuptools-git-versioning|g' -i pyproject.toml
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
