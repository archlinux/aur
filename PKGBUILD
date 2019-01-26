# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='macreg'
pkgname="${_pkgbase}-git"
pkgver=r89.ac3050c
pkgrel=1
pkgdesc='Micro web service to allow local users to register MAC addresses'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=(
    'python'
    'python-peewee'
    'python-peeweeplus'
    'python-flask'
    'python-httpam'
    'uwsgi-plugin-python'
    'python-pymysql')
makedepends=('git' 'python')
provides=("python-${_pkgbase}" "${_pkgbase}")
conflicts=("python-${_pkgbase}" "${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgbase}"

    # Install python back end.
    pushd "backend" || exit 1
    python setup.py install --root "${pkgdir}" --optimize=1
    local SYSUSERS="${pkgdir}/usr/lib/sysusers.d"
    install -m 755 -d "${SYSUSERS}"
    install -m 644 -t "${SYSUSERS}" macreg.conf
    local UWSGI="${pkgdir}/etc/uwsgi"
    install -m 755 -d "${UWSGI}"
    install -m 644 -t "${UWSGI}" macreg.ini
    install -Dm 755 macregctl "${pkgdir}/usr/bin/macregctl"
    popd || exit 1

    # Install HML front end.
    local FRONTEND="${pkgdir}/usr/share/webapps/macreg"
    install -m 755 -d "${FRONTEND}"
    pushd "frontend" || exit 1
    install -m 644 -t "${FRONTEND}" ./*
}
