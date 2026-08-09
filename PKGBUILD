# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex-git
pkgver=1.9.3
pkgrel=1
pkgdesc='MoneyManagerEx is an easy-to-use personal finance suite. This package will always point to the newest commit.'
arch=('x86_64')
url='http://www.moneymanagerex.org/'
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3' 'webkit2gtk-4.1')
makedepends=('appstream' 'cmake' 'fakeroot' 'file' 'gawk' 'gcc' 'gettext' 'git' 'jq' 'lsb-release' 'make' 'pkg-config' 'rapidjson')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=('git+https://github.com/moneymanagerex/moneymanagerex.git'
        '8363.patch')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/moneymanagerex"

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/moneymanagerex"

  # TODO Workaround needed for wxWidgets 3.2. See https://github.com/moneymanagerex/moneymanagerex/issues/8363
  git apply "${srcdir}/8363.patch"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/moneymanagerex"

  # Disable all warnings when building by using Parameter '-w'
  cmake -DCMAKE_BUILD_TYPE=None -Wno-dev -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -w" .

  cmake --build .
}

package() {
  cd "${srcdir}/moneymanagerex"

  make DESTDIR="${pkgdir}" install

  # TODO Workaround for https://github.com/moneymanagerex/moneymanagerex/issues/7699
  cd "${pkgdir}/"
  rm -rf usr/include/fmt/
  rm -rf usr/lib/cmake/fmt/
  rm -f usr/lib/pkgconfig/fmt.pc
}

