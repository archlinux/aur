#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for ERPNext.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly version_frappe="v14.26.3"

pkgname="erpnext"
pkgver="14.17.4"
pkgrel="1"
pkgdesc="Free and open source Enterprise Resource Planning (ERP)."
arch=("x86_64")
url="https://github.com/frappe/${pkgname}"
license=("GPL3")
depends=("frappe-bench" "nodejs" "python")
makedepends=("python-build" "python-installer")
options=("!strip") # TODO
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles")
sha512sums=("7fb7154bc8542eab411492949cbfe38b7755f5b1a41f410cfab89865ee53d0ac26bc52e77295648c95f7c0c376c377dcbea543f74b525a265bc71d362f9cb68d"
    "36dc36633ff2a370df694562eafb9280acbae12620b33b7ce186f761e2f608afa4a1ef7963707828ab2bc847ae33aba1797f2b872e3e15edd27815d4a4bacc9b"
    "d8614473bd72404bec058981d2c9c3a91ed08b931539236a5d22209e5fdc6dc044ea719c8ed336bd8e64a49508cd290a5431bf339b87b0331bd9ede1d055e8ce"
    "4543b6d2629fd818093c9abdeb95e40660a30debc4b40896aa2df1f51a096bc2e167d72c44b089c30002e8eeecdb5291d1a967d61f629357004c2019e1c3c8e8")

build()
{
    cd "${srcdir}"/ || exit 1
    bench init --frappe-branch "${version_frappe}" "${pkgname}"
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

    ## Edit paths. Configuration files are altered as well as .pyc.
    declare -r files=$(grep -lr "${srcdir}"/"${pkgname}/" "${pkgdir}"/usr/share/webapps/"${pkgname}"/)
    echo "${files}" | xargs sed -i "s|${srcdir}/${pkgname}/|/usr/share/webapps/${pkgname}/|g"

    ## Rebuild the software since their contents were manipulated.
    rm -r "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/
    python -m venv "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/
    "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/bin/python -m pip install --force-reinstall -q wheel

    for path in "${pkgdir}/usr/share/webapps/${pkgname}/apps/frappe/" "${pkgdir}/usr/share/webapps/${pkgname}/apps/erpnext/"; do
        "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/bin/python -m pip install --force-reinstall -qe "${path}"
        cd "${path}" || exit 1
        yarn install
        yarn --check-files
    done

    cd "${pkgdir}"/usr/share/webapps/"${pkgname}"/ || exit 1
    bench build --hard-link --production
    bench build --app "${pkgname}" --hard-link --production

    # Edit the paths.
    echo "/usr/share/webapps/${pkgname}/apps/erpnext/" > "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/lib/python3.10/site-packages/erpnext.pth
    echo "/usr/share/webapps/${pkgname}/apps/frappe/" > "${pkgdir}"/usr/share/webapps/"${pkgname}"/env/lib/python3.10/site-packages/frappe.pth

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
