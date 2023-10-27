#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for ERPNext.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _version_frappe="v15.0.1"

pkgname="erpnext"
pkgver="14.45.3"
pkgrel="1"
pkgdesc="Free and open source Enterprise Resource Planning (ERP)."
arch=("x86_64")
url="https://github.com/frappe/${pkgname}"
license=("GPL3")
depends=("frappe-bench" "libmaxminddb" "mariadb" "nodejs" "python" "python-pycups" "wkhtmltopdf")
makedepends=("npm" "python-build" "python-installer" "python-virtualenv" "tmux")
optdepends=("apache: HTTP server"
    "certbot: Creates SSL certificates."
    "nginx: HTTP server"
    "redisearch: Faster database reading.")
install="${pkgname}.install"
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles")
sha512sums=("5b1efc9ab5fd720c621b0461a0eeec9d1a4f9431448f07155f0f89f4e933850cdc1fcc9b65d13ef3bf7f1ef368f1c73480d2d01be9549e65597f5c56500b6b92"
    "70baf45505c3cd21886fd7c820b528c655c5fa8c382f7991092ea14846eb42f43a8899232610f2dc213ea6a3cc6ead43130c083de676ecd4c93caca9283aa36e"
    "d8614473bd72404bec058981d2c9c3a91ed08b931539236a5d22209e5fdc6dc044ea719c8ed336bd8e64a49508cd290a5431bf339b87b0331bd9ede1d055e8ce"
    "661ca81b73544884c3024ec2c5fad689101c72f7467cf7720934bdded67eecdb666096365c4f8abe20c2fd13a1a5c831a990490872024fe3093e35459be8d47b")

build()
{
    cd "${srcdir}"/ || exit 1
    bench init --frappe-branch "${_version_frappe}" "${pkgname}"
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    bench get --branch v"${pkgver}" --resolve-deps "${pkgname}" "${url}.git"
    bench new-site --db-name "${pkgname}" --set-default "${pkgname}"
    bench --site "${pkgname}" install-app "${pkgname}"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/lib/sysusers.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/
    install -Dm755 "${srcdir}"/"${pkgname}".sh "${pkgdir}"/usr/bin/"${pkgname}"
    install -Dm644 "${srcdir}"/"${pkgname}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
    install -Dm644 "${srcdir}"/"${pkgname}".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/"${pkgname}".conf

    ## Edit paths which were written during the build process. Configuration files are going to be altered as well as .pyc.
    declare -r _files=$(grep -lr "${srcdir}"/"${pkgname}/" "${pkgdir}"/usr/share/webapps/"${pkgname}"/)
    echo "${_files}" | xargs sed -i "s|${srcdir}/${pkgname}/|/usr/share/webapps/${pkgname}/|g"

    ## Rebuild the software since their contents were manipulated.
    rm -r "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/
    python -m venv "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/
    "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/bin/python -m pip install wheel

    for _path in "${pkgdir}/usr/share/webapps/${pkgname}/apps/frappe/" "${pkgdir}/usr/share/webapps/${pkgname}/apps/erpnext/"; do
        "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/bin/python -m pip install -e "${_path}"
        cd "${_path}" || exit 1
        yarn install
        yarn --check-files
    done

    cd "${pkgdir}"/usr/share/webapps/"${pkgname}"/ || exit 1
    bench build --hard-link --production
    bench build --app "${pkgname}" --hard-link --production

    ## Edit the paths for Python modules.
    echo "/usr/share/webapps/${pkgname}/apps/erpnext/" > "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/lib/python3.11/site-packages/erpnext.pth
    echo "/usr/share/webapps/${pkgname}/apps/frappe/" > "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/lib/python3.11/site-packages/frappe.pth

    ## Correct symlinks.
    rm "${pkgdir}"/usr/share/webapps/"${pkgname}"/apps/erpnext/erpnext/public/node_modules
    ln -s /usr/share/webapps/"${pkgname}"/apps/erpnext/node_modules/ "${pkgdir}"/usr/share/webapps/"${pkgname}"/apps/erpnext/erpnext/public/node_modules

    rm "${pkgdir}"/usr/share/webapps/"${pkgname}"/apps/frappe/frappe/public/node_modules
    ln -s /usr/share/webapps/"${pkgname}"/apps/frappe/node_modules/ "${pkgdir}"/usr/share/webapps/"${pkgname}"/apps/frappe/frappe/public/node_modules

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
