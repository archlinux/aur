# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=22.10.2
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
sha512sums=('e2dcdd0a07fc50c4059e3254b179de73474ab53298c29a7234eb14335bfb83cb1b2e9e7a53787caf1a95929876e083d3684be162a5a5f8b14325446eef5c9a5c'
            '1a56663103cbf3534ede0c39978da18307f3c5b4da4889af2715df3f7b04952d0037ec5b1aa3244bc1956e78aa9ea62181133cfa2040ba406be52baeefe95968'
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
