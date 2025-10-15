# Maintainer: Donien <donien.96@hotmail.com>

pkgname="pulp-cli"
pkgver="0.36.1"
pkgrel=1
epoch=0
pkgdesc="Command line interface to talk to the Pulp 3 REST API"
arch=(
    "any"
)
url="https://github.com/pulp/pulp-cli"
license=("GPL-2.0-or-later")
groups=()
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"

    "python-tomli-w"
    "python-schema"
    "python-multidict"
    "python-requests"
    "python-click"

    "python-pulp-glue"
)
depends=(
    "python"
    "python-tomli-w"
    "python-schema"
    "python-multidict"

    "python-packaging"
    "python-yaml"
    "python-requests"
    "python-click"

    "python-pulp-glue"
)
optdepends=(
    "python-pygments"
)
provides=(
    "pulp-cli"
    "python-pulp-cli"
)
conflicts=()
replaces=()
backup=()
options=()
changelog="pulp-cli.changelog"
source=(
    "https://github.com/pulp/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "091b86adcdcfe3e8eb67ac7d3c1dd98a02d1429440d8016de50ec930f7e48225"
)


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Allow for higher version of setuptools - pulp-cli
    sed -i '/requires =.*setuptools/s/<[0-9]\+//' pyproject.toml

    # Allow for higher version of setuptools - pulp-glue
    sed -i '/requires =.*setuptools/s/<[0-9]\+//' pulp-glue/pyproject.toml
}


build() {
    # Build pulp-cli
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel \
        --no-isolation \
        #--skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for shell_path in \
            bash:/usr/share/bash-completion/completions/pulp \
            fish:/usr/share/fish/completions/pulp.fish \
            zsh:/usr/share/zsh/site-functions/_pulp
    do
        shell="${shell_path%%:*}"
        path="${shell_path#*:}"
        dir="${path%/*}"

        install -m 755 -d "${pkgdir}${dir}"

        PYTHONPATH="${pkgdir}/usr/lib/python3.13/site-packages/" \
        _PULP_COMPLETE="${shell}_source" \
        python -c \
        "import sys; sys.argv = ['pulp']; from pulp_cli import main; sys.exit(main())" \
        > "${pkgdir}${path}"
    done

}
