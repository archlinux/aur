# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=dbt-snowflake
pkgver=1.5.1
pkgrel=1
pkgdesc="All of the code enabling dbt to work with Snowflake"
url="https://github.com/dbt-labs/dbt-snowflake"
provides=('dbt')
arch=('any')
license=('Apache')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python')
sha256sums=('4bf925212138ea3b302627204dcc6b3263e54f03582e46b79fc89d787e900060')

package() {
    cd "${pkgname}-${pkgver}"

    _pkgshare="${pkgdir}/usr/share"
    _pkgbin="${pkgdir}/usr/bin"
    _venv="${_pkgshare}/${pkgname}"
    _app="dbt"

    # Create virtualenv
    mkdir -p "${_pkgshare}"
    python -m venv "${_venv}"

    # Install python wheel
    export XDG_CACHE_HOME="${srcdir}/cache"
    "${_venv}/bin/pip" install wheel

    # Install package in virtualenv
    "${_venv}/bin/pip" install .

    # Remove unnecessary stuff
    find "${_venv}/bin" -iname 'activate*' | xargs rm
    find "${_venv}/lib/" -name '*.dist-info' | xargs rm -r
    rm -r "${_venv}/share" "${_venv}/include"
    rm "${_venv}/lib64"

    # Fix shebangs
    sed -e "s|${pkgdir}||g" -i "${_venv}/bin/"*

    # Link dbt binary
    mkdir -p "${_pkgbin}"
    ln -s "/usr/share/${pkgname}/bin/${_app}" \
    "${_pkgbin}/${_app}"
}
