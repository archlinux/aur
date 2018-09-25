# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgbase=qpmx
pkgname=(qpmx qpmx-gitsource qpmx-qpmsource)
group=qpmx-full
pkgver=1.6.0
pkgrel=2
pkgdesc="A frontend for qpm, to provide source and build caching"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/$pkgname"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer')
makedepends=('qt5-tools' 'git')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/$pkgname.git#tag=$pkgver"
        "$pkgname.rule"
        "plugin.rule")
sha256sums=('SKIP'
            '13f2e499671cb094ff244946b733a8e6898152fe60c77cb93bef1e1a19ffbd0e'
            'a7f6099680d692285332ae7db3cf1414f4d664ceccb701d45ac73ecaa08a65dc')

git_submod_rm() {
  submod=$1

  mv $submod $submod.tmp
  git submodule deinit -f -- $submod
  rm -rf .git/modules/$submod
  git rm -f $submod
}

prepare() {
  mkdir -p build

  cd "$_pkgfqn"

  git_submod_rm submodules/qpmx-sample-package

  git submodule update --init --recursive
}

build() {
  cd build

  qmake "PREFIX=/usr" "INSTALL_PLUGINS=$(qmake -query QT_INSTALL_PLUGINS)" "../$_pkgfqn/"
  make qmake_all
  make
}

package_qpmx() {
  optdepends=("qpmx-qpmsource: Adds support for cloning qpm packages"
              "qpmx-gitsource: Adds support for cloning git and github packages"
              "repkg: Automatically rebuild the package on dependency updates"
              "qbs: The qbs build system to use qpmx with qbs")
  install="${pkgname}.install"

  cd build/qpmx
  make INSTALL_ROOT="$pkgdir" install
  cd ../lib
  make INSTALL_ROOT="$pkgdir" install

  cd "../../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

package_qpmx-qpmsource() {
  depends=('qpmx' 'qpm')

  cd build/plugins/qpmsource
  make INSTALL_ROOT="$pkgdir" install

  cd "../../../$_pkgfqn"
  install -D -m644 "../plugin.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}

package_qpmx-gitsource() {
  depends=('qpmx' 'git')

  cd build/plugins/gitsource
  make INSTALL_ROOT="$pkgdir" install

  cd "../../../$_pkgfqn"
  install -D -m644 "../plugin.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
