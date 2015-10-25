# Maintainer: lks <lukas dot graetz at web dot de>
# Contributor: Ilya Petrov <ilya.muromec@gmail.com>

_pkgname=putusb
pkgname=${_pkgname}-git
pkgver=r81.65b7f9d
pkgrel=1
pkgdesc="Utility for communication with firmware of some Motorola smartphones and Tegra devices"
arch=('any')
license=('BSD')
url="https://github.com/muromec/${_pkgname}"
depends=('python2-pyusb')
makedepends=('git')
optdepends=('python2-pyqt4: For using qputusb')
provides=('putusb' 'qputusb')
replaces=('putusb' 'qputusb')
conflicts=('putusb' 'qputusb')
source=("${pkgname}::git+https://github.com/muromec/${_pkgname}.git"
        "setup.py"
        "50-ezx-flash.rules")
# If anyone has a backup of this file I would include it
#        "http://people.openezx.org/muromec/putusb/gen-blob"
md5sums=('SKIP'
         '3db8e59bf1f4424882d9c1e5c0ec076c'
         '39cb4ed67ee89d57e97f9f1e6ca26eb6')
#         '5a38817e14a12dd757003f42f5f3c77c'

pkgver () {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p $srcdir/${pkgname}-build/build/lib/
  cd $srcdir/${pkgname}-build

  echo "#!/usr/bin/python2" > qputusb
  cat $srcdir/$pkgname/$_pkgname/qputusb.py >> qputusb
  echo "#!/usr/bin/python2" > qt-putusb
  cat $srcdir/$pkgname/$_pkgname/qt-putusb.py >> qt-putusb
  echo "#!/usr/bin/python2" > nv
  cat $srcdir/$pkgname/$_pkgname/nv.py >> nv

  cp $srcdir/setup.py setup.py

  sed -i "s|from putusb import putusb|import putusb|g" {qputusb,qt-putusb,nv}
}

package() {
  cd $srcdir/$pkgname-build

  python2 setup.py install -f --root=$pkgdir

  install -d $pkgdir/usr/bin
  # all python2 scripts (working or not) will be in /usr/bin
  install -m 755 -t $pkgdir/usr/bin/ {qputusb,qt-putusb,nv}

  cd $srcdir
  install -d  $pkgdir/usr/lib/firmware/ezx/
  install -t $pkgdir/usr/lib/firmware/ezx/ $pkgname/bin/{fastboot.stock,tegra_pre_boot}.bin
  #install -t $pkgdir/usr/lib/firmware/ezx/ gen-blob

  install -d $pkgdir/etc/udev/rules.d
  install 50-ezx-flash.rules $pkgdir/etc/udev/rules.d/50-ezx-flash.rules

  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -t $pkgdir/usr/share/licenses/$pkgname $pkgname/LICENSE
}
