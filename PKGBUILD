# Maintainer: "UnCO" Lin <trash__box <_[at]_> 163.com>
# Contributor: spider-mario <spidermario <_[at]_> free.fr>
# Contributor: Johannes Krampf <mail <_[at]_> johkra.de>

pkgname=cobra-svn
_pkgname=cobra
pkgver=3091
pkgrel=1
epoch=2
pkgdesc="Clean and expressive language for .NET and Mono"
arch=('i686' 'x86_64')
url="http://cobra-language.com/"
license=('custom:MIT')
depends=(mono)
conflicts=('cobra')
provides=('cobra')
install=cobra.install
source=("${_pkgname}::svn+http://cobra-language.com/svn/cobra/trunk"
        install.patch)

pkgver() {
  cd ${_pkgname}
  svnversion
}

prepare() {
  cd ${_pkgname}
  sed -i "s/\(Cobra-svn-\)[0-9]\+/\1${pkgver}/" "$startdir"/cobra.install
  patch -p1 < "$srcdir"/install.patch

  cd Source
  echo "$pkgdir"/opt/cobra > install-directory.text
  sed -i "s|\(\$(MSBuildExtensionsPath)\)|${pkgdir}/\1|" Cobra.MSBuild/Targets/Cobra.targets
}

package() {
  cd ${_pkgname}/Source

  yes | bin/install-from-workspace

  cd "$pkgdir"

  sed -i "s|$pkgdir||" opt/cobra/bin/cobra
  sed -i "s|$pkgdir/||" usr/lib/mono/xbuild/Cobra/Cobra.targets

  install --directory usr/bin
  ln -s /opt/cobra/bin/cobra usr/bin/cobra

  install --directory usr/share/licenses/$pkgname
  cp "$srcdir"/${_pkgname}/License.text usr/share/licenses/$pkgname/
}
sha512sums=('SKIP'
            '44a62b5c1a4ec7f506a258d6922f2cc9c8bed6eacdccf17f5aa5d74403c7d6587e96e07b5ffd542d4e6f0a7e811fb2ed52f1c75c7619b8d825518b09c1cd24ca')
