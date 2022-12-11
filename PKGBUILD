# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=22.10.3
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
sha512sums=('f00a4099e9dfbaa6ab541bec1c65ce312a078c8ea3199a17b315e687ed19e9c36c8b2faa8a482534b9c46d0940ef38943b1f3a1ec4a1da039664ea1248597dc0'
            '29f87553f9fbbf4b789dfd92e3cebb3912346af038a448d0270975a7bbc19461254045fc3f8929cc05cee5902772ee4760220c091ace1c2a5e25193b00d1e318'
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
