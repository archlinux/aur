# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=dbt-snowflake
pkgver=1.3.0
pkgrel=3
pkgdesc="All of the code enabling dbt to work with Snowflake"
url="https://github.com/dbt-labs/dbt-snowflake"
provides=('dbt')
arch=('any')
license=('Apache')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python')
sha256sums=('8f6e5a7e10c6d783cea073c92760118b0fac5fb1af92cd008a016fae8938a3c1')

package() {
    cd "${pkgname}-${pkgver}"

    _pkgshare="${pkgdir}/usr/share"
    _pkgbin="${pkgdir}/usr/bin"
    _venv="${_pkgshare}/${pkgname}"
    _app="dbt"

    # Create virtualenv
    mkdir -p "${_pkgshare}"
    python -m venv "${_venv}"

    # Install package in virtualenv
    "${_venv}/bin/pip" install .

    # Remove unnecessary stuff
    find "${_venv}/bin" -iname 'activate*' | xargs rm
    find "${_venv}/lib/" -name '*.egg-info' | xargs rm -r
    rm -r "${_venv}/share" "${_venv}/include"
    rm "${_venv}/lib64" 

    # Fix shebangs
    sed -e "s|${pkgdir}||g" -i "${_venv}/bin/"*

    # Link dbt binary
    mkdir -p "${_pkgbin}"
    ln -s "/usr/share/${pkgname}/bin/${_app}" \
    "${_pkgbin}/${_app}"
}
