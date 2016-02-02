# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo
pkgver=0.9.0_rc4
_ref='8c830b6f1a6e3fee01b65fc62e22ce29cc14d1a7'
_pkgname=$pkgname-${_ref}
pkgrel=1
pkgdesc='Shell-centric cross-platform open source MongoDB management tool'
arch=('i686' 'x86_64')
url="http://robomongo.org/"
license=('GPLv3')
depends=('qt5-base' 'libxkbcommon-x11' 'pcre' 'qjson' 'openssl')
makedepends=('git' 'scons' 'cmake')
conflicts=('robomongo-bin')
source=('git://github.com/paralect/robomongo-shell.git#branch=roboshell-v3.2'
        "https://github.com/paralect/robomongo/archive/${_ref}.tar.gz"
        'robomongo.desktop')
sha256sums=('SKIP'
            'b2fafea569be3ba9482841806be8d110436b9ace334383be50f55b4d568619b8'
            'bdd63f5d4bd35dd865a0164f285d19555e4ecafb2d11d01f67bdb86bd730a13d')

build() {
  _mongodir=$srcdir/robomongo-shell
  scons --directory=${_mongodir} --disable-warnings-as-errors mongo

  cd $srcdir/${_pkgname}
  mkdir -p ./target && cd ./target/
  cmake .. -DCMAKE_PREFIX_PATH=${_mongodir} -DCMAKE_BUILD_TYPE=Release
  make
  make install
}

package() {
  _instdir=$srcdir/${_pkgname}/target/install

  install -Dm0755 "${_instdir}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "$srcdir/robomongo.desktop" "$pkgdir/usr/share/applications/robomongo.desktop"
  install -Dm0644 "$srcdir/${_pkgname}/src/robomongo/gui/resources/icons/logo.png" "${pkgdir}/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "${_instdir}/LICENSE" "${pkgdir}/usr/share/licenses/robomongo/LICENSE"
  install -Dm0644 "${_instdir}/COPYRIGHT" "${pkgdir}/usr/share/doc/robomongo/COPYRIGHT"
}
