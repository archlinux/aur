#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=pk_web
pkgname=${_pkgname}-git
pkgver=0.3.3
pkgrel=1
pkgdesc="Web UI for plakar backup tool"
arch=(any)
url="https://spn109.fr/pk_web"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=("python" "python-flask" "python-pyaml" "python-pytz" "gunicorn" "plakar>=1.0.4" "plakar_cleaner-git>=0.2.5")
optdepends=()
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://codeberg.org/spn109/${_pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1

}

package()
{

    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    cp -R ./* "${pkgdir}/usr/share/${_pkgname}/"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/app.py"
    cat <<'eof' > ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
[Unit]
Description=Plakar Web UI service
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
SetLoginEnvironment=True
WorkingDirectory=/usr/share/pk_web
ExecStart=/usr/bin/gunicorn app:app

[Install]
WantedBy=multi-user.target
eof
}
