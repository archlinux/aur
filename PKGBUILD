#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Pilot.
# Maintainer: Sabu Siyad <hello@ssiyad.com>

readonly _pkgname="pilot"

pkgname="frappe-pilot-git"
pkgver=0.1.0.r979.g7f3d9af
pkgrel=1
pkgdesc="CLI with built-in admin UI to manage Frappe deployments. Successor to Bench."
arch=("any")
url="https://github.com/frappe/${_pkgname}/"
license=("AGPL-3.0-only")
# git is also a makedepend (VCS source); namcap flags the redundancy either way.
makedepends=("git" "npm")
depends=("git" "nodejs" "python" "rsync" "uv" "valkey")
# One of the two database servers is required; there is no way to express
# alternative dependencies in a PKGBUILD. nginx is only needed for production
# deploys (bench setup production); development runs without it.
optdepends=("mariadb: Site database (either MariaDB or PostgreSQL is required)"
    "postgresql: Site database (either MariaDB or PostgreSQL is required)"
    "nginx: Reverse proxy for production deployments")
provides=("frappe-pilot" "bench")
conflicts=("frappe-pilot" "frappe-bench")
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/frappe/${_pkgname}.git#branch=main"
    "bench-wrapper.sh")
sha512sums=("SKIP"
    "de3b13e36a5cfd41371e041a1cc9a2e507638ed65501a0d0159e3a4c8be5153d30ff4f11721a28765f94c3dc5c297c7cd43d225107b50d1c18c89b8c3cc00cac")

pkgver()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    # The only upstream tag is the rolling "latest-build", so derive the
    # version from the static pyproject version plus the commit count.
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build()
{
    cd "${srcdir}"/"${_pkgname}"/admin/frontend/ || exit 1
    npm ci
    npm run build
}

package()
{
    local _sharedir="${pkgdir}/usr/share/frappe-pilot"

    # Install the tree pilot runs from. admin/frontend is omitted on purpose:
    # without its package.json pilot treats this as a non-source install and
    # serves the prebuilt dist instead of attempting npm rebuilds.
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    mkdir -p "${_sharedir}"/admin/
    cp -r pilot "${_sharedir}"/
    cp -r admin/backend "${_sharedir}"/admin/
    install -m644 admin/__init__.py "${_sharedir}"/admin/
    install -m644 pyproject.toml "${_sharedir}"/
    install -m755 bench "${_sharedir}"/
    install -Dm644 registry/apps_v2.json "${_sharedir}"/registry/apps_v2.json
    find "${_sharedir}" -type d -name "__pycache__" -exec rm -rf {} +
    find "${_sharedir}" -type d -exec chmod 755 {} +
    find "${_sharedir}" -type f -exec chmod 644 {} +
    chmod 755 "${_sharedir}"/bench

    # Resync trigger for the wrapper's per-user copy.
    printf "%s-%s\n" "${pkgver}" "${pkgrel}" > "${_sharedir}"/.pkgver

    # Pilot needs its install directory writable (benches, admin venv), so
    # /usr/bin/bench keeps a per-user copy in sync and runs from there.
    install -Dm755 "${srcdir}"/bench-wrapper.sh "${pkgdir}"/usr/bin/bench

    # Install the documentation.
    install -Dm644 README.md SPEC.md -t "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
