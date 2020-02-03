# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Sid Karunaratne <sid at karunaratne dot net>
pkgname=weevely
_pkgname=weevely3
pkgver=4.0.1
pkgrel=1
pkgdesc="a stealth PHP web shell that provides a telnet-like console"
arch=('any')
url="https://github.com/epinna/weevely3"
license=('GPL3')
depends=(python python-dateutil python-mako python-prettytable python-pyopenssl python-yaml python-pysocks)
source=("https://github.com/epinna/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('79d09044960a461e9ff3d92a0517904af61ef50cc8018127aa4de60016af114a')

build() {
  cd ${_pkgname}-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
    cd ${_pkgname}-${pkgver}
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -D -m644 weevely.1 -t "${pkgdir}/usr/share/man/man1/"
    cp -a --no-preserve=ownership "bd/" "core/" "modules/" "utils/" "weevely.py" "${pkgdir}/opt/${pkgname}"
    cat > "${pkgdir}/usr/bin/weevely" << EOF
#!/bin/sh
cd /opt/${pkgname}
python weevely.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/weevely"

}
