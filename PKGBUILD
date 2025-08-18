#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=quam_facere
pkgname=${_pkgname}-git
pkgver=0.2.1
pkgrel=2
pkgdesc="A comprehensive web-based system for managing IT procedures, operations, and team workflows"
arch=(any)
url="https://spn109.fr/qf"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=("python" "python-flask" "python-pyaml" "python-flask-login" "python-flask-migrate" "python-flask-sqlalchemy" "python-sqlalchemy" "python-pygments" "python-werkzeug" "python-pymupdf" "gunicorn")
optdepends=()
makedepends=('git' "python-pip")
conflicts=("$_pkgname")
replaces=()
backup=("etc/quam_facere/config.yaml")
install=install
source=("${pkgname}::git+https://codeberg.org/spn109/Quam_Facere.git#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1
}

package()
{
    PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps mdutils 
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps pymupdf-fonts

    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mkdir -p "${pkgdir}/etc/${_pkgname}/"
    mkdir -p "${pkgdir}/var/lib/${_pkgname}/"
    cp -R ./qf "${pkgdir}/usr/share/${_pkgname}/"
    cp config.yaml "${pkgdir}/etc/${_pkgname}/"
    cp gunicorn.conf.py "${pkgdir}/usr/share/${_pkgname}/"
    key=$(cat /dev/urandom | head -n 1 |tr -dc '[:alnum:]' |cut -c -32)
    sed -i -e "s/test_quam_facere/${key}/g" "${pkgdir}/etc/${_pkgname}/config.yaml"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/qf/main.py"
    cat <<'eof' > ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
[Unit]
Description=Quam Facere service
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=qf
SetLoginEnvironment=True
WorkingDirectory=/usr/share/quam_facere/
ExecStart=/usr/bin/gunicorn qf:app

[Install]
WantedBy=multi-user.target
eof
}
