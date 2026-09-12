# Maintainer: Martin Dünkelmann <nc-duenkekl3 at netcologne.de>

pkgname=moneymanagerex-git
pkgver=1.9.4
pkgrel=2
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
              '8363.patch'
              '8534.patch::https://github.com/moneymanagerex/moneymanagerex/pull/8534.patch')
sha512sums=('SKIP'
            '3860255020f9c39f3c80b9c9d5c9f6ee3cf5e1844a37a27031a135d07fe5b392dcf0a4ba38077d5ae20bf1d3c7c01fd10c77f86a79484a0620558fb5b6e412bf'
            '778ff06fdc473d5e71da27cea9895953cc4187a00fe1ce2ae0b59a444fdf893f10d3440d83ed420123217b55dd03552d6c5b32b088b9f4de828b0a3def5ebecb')

pkgver() {
  cd "${srcdir}/moneymanagerex"

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/moneymanagerex"

  # TODO Workaround needed for wxWidgets 3.2. See https://github.com/moneymanagerex/moneymanagerex/issues/8363
  git apply "${srcdir}/8363.patch"

  # TODO Workaround needed for AppStream 1.2.0. See https://github.com/moneymanagerex/moneymanagerex/pull/8534
  patch -p1 -i "${srcdir}/8534.patch"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/moneymanagerex"

  # Disable all warnings when building by using Parameter '-w'
  cmake -DCMAKE_BUILD_TYPE=None -Wno-author -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -w" .

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
