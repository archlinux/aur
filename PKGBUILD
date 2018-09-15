# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='macreg'
pkgname="python-${_pkgbase}-git"
pkgver=latest
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-peewee' 'python-peeweeplus' 'python-flask' 'python-httpam' 'uwsgi-plugin-python')
makedepends=('git' 'python')
provides=("python-${_pkgbase}")
conflicts=("python-${_pkgbase}")
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
    cd "backend"
    python setup.py install --root "${pkgdir}" --optimize=1
    local SYSUSERS="${pkgdir}/usr/lib/sysusers.d"
    install -m 755 -d "${SYSUSERS}"
    install -m 644 -t "${SYSUSERS}" macreg.conf
    local UWSGI="${pkgdir}/etc/uwsgi"
    install -m 755 -d "${UWSGI}"
    install -m 644 -t "${UWSGI}" macreg.ini
    cd ..

    # Install HML front end.
    local FRONTEND="${pkgdir}/usr/share/webapps/macreg"
    install -m 755 -d "${FRONTEND}"
    cd "frontend"
    install -m 644 -t "${FRONTEND}" ./*
}
