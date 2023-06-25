# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=simple_backup-git
_pkgname=simple_backup
pkgdesc='Simple backup script that uses rsync to copy files'
pkgver=4.1.2.r0.ge3a9702
pkgrel=1
url="https://github.com/Fuxino/${_pkgname}"
install=simple_backup.install
arch=('any')
license=('GPL3')
makedepends=('git'
             'python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
depends=('python>=3.10'
         'rsync'
         'python-dotenv')
optdepends=('python-systemd: use systemd log'
            'python-dbus: for desktop notifications'
            'python-paramiko: for remote backup through ssh')
conflicts=('simple_backup')
provides=('simple_backup')
source=(git+${url}.git?signed#branch=master)
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('SKIP')

pkgver() 
{  
    cd ${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C ${srcdir}/${_pkgname} clean -dfx
}

build()
{
    cd ${srcdir}/${_pkgname}
    python -m build --wheel --no-isolation
}

package()
{
    cd ${srcdir}/${_pkgname}
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 ${_pkgname}/${_pkgname}.conf ${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.conf
    install -Dm644 man/${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
}
