# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=22.12.1
pkgrel=1
pkgdesc='The default Wallpapers for Ubuntu'
arch=('any')
url='https://launchpad.net/ubuntu-wallpapers'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/main'
license=('custom')
makedepends=('python-distutils-extra' 'python-setuptools')

# https://packages.ubuntu.com/source/ubuntu-wallpapers
# http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers/
source=(
  "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
  "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}-0ubuntu1.debian.tar.xz"
  'setuptools-bugfix.patch'
)
sha512sums=('cc2b1d2db963c2657d863c95eaa49afb92a1dd38da59ac8b1dba931af7ca1f8b1402db1bf8ad7034749846283ff94129012e57f15f457a0afb8d4ef95ce2aaed'
            '3d38de8183838c405ff222361c48ce698581ab3852fc3816b2c972b24420dc1f744b0b2617ae728cc59534eba4729a40b0a7b8c4611fc125fbd69faf95a927fc'
            '4d562ef7ccc6add6d966c111ed8f93b5c020a2be57bc468b427768521e64533536fb8b968a5430979f5d36f2de34bc82fb9ee3adca42f0194bb0d95c757cfe70')

prepare() {
  cd "${pkgname}-${pkgver}"
  # The setup.py script reads the package version from debian/*
  ln -sfv ../debian .
  # Patch setuptools to work around new behavior in setuptools
  # Eventually this can be removed, whenever Ubuntu/Debian package maintainers
  # Stumble on this and fix it upstream.
  patch --forward --strip=1 --input="${srcdir}/setuptools-bugfix.patch"
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dvm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
