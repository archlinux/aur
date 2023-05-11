# PKGBUILD

# Maintainer: Daniele Fucini <dfucini@gmail.com>

pkgname=simple_backup
pkgver=3.2.2.r0.g8b9087c
pkgrel=1
pkgdesc='Simple backup script that uses rsync to copy files'
arch=('any')
url="https://github.com/Fuxino/simple_backup.git"
license=('GPL3')
makedepends=('git'
             'python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
depends=('python'
         'rsync'
         'python-dotenv')
optdepends=('python-systemd: use systemd log')
install=${pkgname}.install
source=(git+https://github.com/Fuxino/${pkgname}.git)
sha256sums=('SKIP')

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
