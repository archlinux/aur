# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=opentelemetry-python-contrib
pkgver=0.53b1
pkgrel=1
arch=("any")
_url="https://github.com/open-telemetry/${pkgbase}"
license=("Apache-2.0")
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("${pkgbase}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0c94256ad072eac2133edba6c58b83bbb68fbea54007ecf985e894486cf07ada18e56f8c40831c8cf4085cac2f98dfb1c5f773ce052ba5a0d50038fedfdc4f0f')

# run './geninfo.sh' to generate following variables
pkgname=(
    "python-"
)
_pkgdescs=(
)
_urls=(
)
_depends=(
)
_optdepends=(
)

build() {
    for ((i=0; i<${#pkgname[@]}; i++)); do
        _pkgname="${pkgname[i]#*-}"
        _dirname=$(echo "${_urls[i]}" | sed -e "s|^${_url}/tree/main/||g" -e "s|${_pkgname}$||g")
        python -m build --wheel --no-isolation "${pkgbase}-${pkgver}/${_dirname}${_pkgname}"
    done
}

main() {
    for ((i=0; i<${#pkgname[@]}; i++)); do
        _pkgname="${pkgname[i]#*-}"
        _dirname=$(echo "${_urls[i]}" | sed -e "s|^${_url}/tree/main/||g" -e "s|${_pkgname}$||g")
        eval "package_python-${_pkgname}() {
            pkgdesc=\"${_pkgdescs[i]}\"
            url=\"${_urls[i]}\"
            depends=(${_depends[i]})
            optdepends=(${_optdepends[i]})

            cd \"${pkgbase}-${pkgver}/${_dirname}${_pkgname}\"
            python -m installer --destdir=\"\${pkgdir}\" dist/*.whl
            if [[ -f README.rst ]]; then
                install -Dm644 README.rst \"\${pkgdir}/usr/share/doc/python-${_pkgname}/README.rst\"
            fi
            if [[ -f CHANGELOG.md ]]; then
                install -Dm644 CHANGELOG.md \"\${pkgdir}/usr/share/doc/python-${_pkgname}/CHANGELOG.md\"
            fi
        }"
    done
}

main
