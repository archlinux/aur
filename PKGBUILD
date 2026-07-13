# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=Cirq
_packages=(
    python-cirq-aqt
    python-cirq-core
    python-cirq-google
    python-cirq-ionq
    python-cirq-pasqal
    python-cirq-web
)
pkgname=(
    python-cirq
    ${_packages[@]}
)
pkgver=1.7.0
pkgrel=1
arch=(any)
url=https://github.com/quantumlib/Cirq
license=(Apache-2.0)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    ipython
    poppler
    python-attrs
    python-duet
    python-google-api-core
    python-grpcio
    python-matplotlib
    python-networkx
    python-numpy
    python-opt_einsum
    python-pandas
    python-ply
    python-protobuf
    python-proto-plus
    python-pylatex
    python-pytest
    python-pytest-asyncio
    python-quimb
    python-requests
    python-scipy
    python-sortedcontainers
    python-sympy
    python-typedunits
    python-typing_extensions
    python-tqdm
    texlive-binextra
    texlive-latex
    texlive-latexextra
    texlive-mathscience
    texlive-pictures
)
source=($_name::git+https://github.com/quantumlib/Cirq#tag=v$pkgver)
b2sums=('a7c141cb9b528db5344311aba97054767def5710402e9a8e347246a953b8542f525878b4a82a3acb0429fd273a9b7284ba00a89ece286731b231735ea6b728b5')

build() {
    cd $_name
    python -m build --wheel --no-isolation
    for _package in ${_packages[@]}; do
        cd $srcdir/$_name/${_package:7} # remove "python-"
        python -m build --wheel --no-isolation
    done
}

check() {
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    for _package in ${_packages[@]}; do
        python -m installer --destdir="$srcdir"/test_dir $_name/${_package:7}/dist/*.whl
    done

    # Tests are included in the source code directories
    for _package in ${_packages[@]}; do
        cd "$srcdir/$_name/${_package:7}"
        echo "Testing $PWD"
        echo "Running: pytest -v $_package"
        PYTHONPATH="$srcdir/test_dir/usr/lib/python$python_version/site-packages" \
        pytest -o addopts="" -k "not test_json_test_data_coverage and not test_json_and_repr_data"
    done
}

package_python-cirq() {
    pkgdesc="A framework for creating, editing, and invoking Noisy Intermediate Scale Quantum (NISQ) circuits"
    depends=(${_packages[@]})
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-aqt() {
    pkgdesc="Cirq module to support Alpine Quantum Technologies GmbH quantum computers"
    depends+=(python-requests)
    cd $_name/cirq-aqt
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-core() {
    depends+=(
        python-attrs
        python-duet
        python-matplotlib
        python-networkx
        python-numpy
        python-pandas
        python-scipy
        python-sympy
        python-tqdm
    )
    cd $_name/cirq-core
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-google() {
    pkgdesc="Cirq module to support Google's quantum hardware"
    depends+=(
        python-google-api-core
        python-grpcio
        python-protobuf
        python-proto-plus
        python-typedunits
    )
    cd $_name/cirq-google
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-ionq() {
    pkgdesc="Cirq module to support IonQ Inc. quantum computers"
    depends+=(python-requests)
    cd $_name/cirq-ionq
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-pasqal() {
    pkgdesc="Cirq module to support Pasqal quantum computers"
    depends+=(python-requests)
    cd $_name/cirq-pasqal
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-cirq-web() {
    pkgdesc="Cirq module to support browser-based 3D visualization tools"
    cd $_name/cirq-web
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
