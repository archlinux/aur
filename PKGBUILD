# Contributor: Jonathan la Cour <jon@lacour.me>
# Contributor: Patrick Glandien <patrick@synix.io>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: portals <portals at riseup.net> Base on work of: 2bluesc <2bluesc at gmail.com> and mazzolino <maze+aur at strahlungsfrei.de>
# Contributor: Pieter Kokx <pieter@kokx.nl>

pkgname=armory
pkgver=0.96.5
pkgrel=3
pkgdesc="Full-featured Bitcoin wallet management application"
arch=('i686' 'x86_64')
url="https://github.com/goatpig/BitcoinArmory"
license=('AGPL3' 'MIT')
depends=('crypto++' 'qt4' 'python2' 'python2-twisted' 'python2-pyqt4' 'python2-bsddb' 'python2-psutil')
makedepends=('gcc' 'make' 'swig3')
optdepends=('bitcoin-daemon: Communicate with the Bitcoin network')
provides=('armory')
conflicts=('armory' 'armory-git' 'armory-bin' 'armory-goatpig-git')
install="${pkgname}.install"

# Don't blindly trust a random AUR package with your coins! Signed hashes available at
# https://github.com/goatpig/BitcoinArmory/releases with GPG ID 8C5211764922589A
_signatures="https://github.com/goatpig/BitcoinArmory/releases/download/v${pkgver}/sha256sum.txt.asc"
source=("https://github.com/goatpig/BitcoinArmory/releases/download/v${pkgver}/armory_${pkgver}_source.tar.xz"
        '0001-Fix-compilation.patch'
        '0002-Use-swig3.0.patch'
        '0003-Use-lrelease-qt4.patch'
        'run-armory.sh')
sha512sums=('aba9627a58414d9a5b9781753d6c09b3970f2728f317419b3dc8547a8ad2b9e7f9615a650a56441122647406ea846c64383677f220f26ef395029cdb8d25812c'
            '10d10d449652de81d2bdeff5cd2bc72015071354720b80650a243f51a16e2b6da8f0600134ab03364819d0e916ae368a1ef81a5df71cddbf48fe9c1980e99dff'
            'eb8f4d55495642747dd4777ebeed309b8b9dbc2a07294748ea2f2c7e97d35111dc4156eeda4c668a624bd05d5ea44957dfbc930484fc1fa0b487661cee7fac18'
            'd727cb2cbb7e68bbf769c31e44f53eef3d51553b63e9a4045bcc30bc1ab10cd0c3ad258bdfc62ccc27277029715cc0993713e4bcec7c565184aca1263130c99e'
            'af44a8edfdf751f3343a8bdf6fa21c125389de3435c4b03c7f581b980525a9f32af177f496830f847b70c8e2619c42908536698e0fd28f862f16083cf7396715')

_parentdir=Armory3

check() {
  msg 'Validating GPG signature...'
  msg2 '(To disable: remove/rename check() function from PKGBUILD)'
  gpg --recv-key 8C5211764922589A
  curl -sL $_signatures -o sha256sum.asc
  msg2 "Downloading $_signatures"
  gpg --verify 'sha256sum.asc'
  msg2 'GPG signature is valid.'

  msg 'Validating signed checksum of downloaded binary...'
  grep "${pkgver}_source.tar.xz" 'sha256sum.asc' | tr -d '\r' | sha256sum -c -
  msg2 'Checksum valid.'
}

prepare() {
  cd "$srcdir/$_parentdir"
  patch --strip=1 --input=../0001-Fix-compilation.patch
  patch --strip=1 --input=../0002-Use-swig3.0.patch
  patch --strip=1 --input=../0003-Use-lrelease-qt4.patch

  ## Get Python2 Version
  _py2longver=$(pacman -Qi python2 | grep "Version" | sed 's/^Version\s*:\s//')
  _py2ver=${_py2longver%.*}
  PYTHON_VERSION=${_py2ver} ./autogen.sh
}

build() {
  cd "$srcdir/$_parentdir"

  ## Get Python2 Version
  _py2longver=$(pacman -Qi python2 | grep "Version" | sed 's/^Version\s*:\s//')
  _py2ver=${_py2longver%.*}
  PYTHON_VERSION=${_py2ver} ./configure

  ## Build using current python2 version
  PYTHON_VERSION=${_py2ver} make
}

package() {
  install -Dm644 "$srcdir/${_parentdir}/dpkgfiles/armory.desktop" "$pkgdir/usr/share/applications/armory.desktop"
  install -Dm644 "$srcdir/${_parentdir}/dpkgfiles/armoryoffline.desktop" "$pkgdir/usr/share/applications/armoryoffline.desktop"
  install -Dm644 "$srcdir/${_parentdir}/dpkgfiles/armorytestnet.desktop" "$pkgdir/usr/share/applications/armorytestnet.desktop"
  install -Dm644 "$srcdir/${_parentdir}/img/armory_icon_64x64.png" "$pkgdir/usr/share/armory/img/armory_icon_64x64.png"
  install -Dm644 "$srcdir/${_parentdir}/img/armory_icon_green_64x64.png" "$pkgdir/usr/share/armory/img/armory_icon_green_64x64.png"

  install -Dm 755 "$srcdir/run-armory.sh" "$pkgdir/usr/bin/armory"

  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/${_parentdir}/." "$pkgdir/opt/$pkgname/"

  mkdir -p "$pkgdir/usr/local/bin"
  ln -s "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/local/bin/$pkgname"

  rm -rf "$pkgdir/opt/$pkgname/cppForSwig/"
  rm -rf "$pkgdir/opt/$pkgname/.git/"
  rm -rf "$pkgdir/opt/$pkgname/.gitignore"
  rm -rf "$pkgdir/opt/$pkgname/Makefile"
  rm -rf "$pkgdir/opt/$pkgname/config.log"
  rm -rf "$pkgdir/opt/$pkgname/config.status"
}
