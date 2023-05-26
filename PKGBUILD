# PKGBUILD

# Maintainer: Daniele Fucini <dfucini@gmail.com>

pkgname=simple_backup
pkgver=3.2.5.r0.g7684bc4
pkgrel=2
pkgdesc='Simple backup script that uses rsync to copy files'
arch=('any')
url="https://github.com/Fuxino/${pkgname}"
license=('GPL3')
makedepends=('git'
             'python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
depends=('python'
         'rsync'
         'python-dotenv')
optdepends=('python-systemd: use systemd log'
            'python-dbus: for desktop notifications')
install=simple_backup.install
source=(git+${url}.git?signed#branch=master)
sha256sums=('SKIP')
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')

pkgver() 
{  
   cd ${pkgname}
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
   git -C ${srcdir}/${pkgname} clean -dfx
}

build()
{
   cd ${srcdir}/${pkgname}
   python -m build --wheel --no-isolation
}

package()
{
   cd ${srcdir}/${pkgname}
   python -m installer --destdir=${pkgdir} dist/*.whl
   install -Dm644 ${srcdir}/${pkgname}/${pkgname}.conf ${pkgdir}/etc/${pkgname}/${pkgname}.conf
}
