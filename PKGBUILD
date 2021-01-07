# Maintainer: Félix Saparelli <aur@passcod.name>

pkgname=talon-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Powerful hands-free voice and gaze input scriptable with Python'
url='https://talonvoice.com/'
arch=('x86_64')
license=('custom')
depends=('python37')

install=talon.install

package() {
  # --- custom start script to reflect our locations ---
  install -Dm755 start.sh "$pkgdir/usr/bin/talon"
  install -Dm644 talon.png "$pkgdir/usr/share/icons/talon.png"
  install -Dm644 talon.desktop "$pkgdir/usr/share/applications/talon.desktop"

  # --- wave2letter model ---
  mkdir -p "$pkgdir/usr/share/talon/models"
  cp -r "$srcdir/talon-w2l-small3-dslm-en_US" "$pkgdir/usr/share/talon/models/"

  # --- talon itself ---
  cd "$srcdir/talon"
  install -Dm644 10-talon.rules "$pkgdir/usr/lib/udev/rules.d/10-talon.rules"
  install -Dm755 talon "$pkgdir/usr/share/talon/talon-bin"

  mkdir -p "$pkgdir/usr/lib"
  cp -r lib "$pkgdir/usr/lib/talon"

  mkdir -p "$pkgdir/usr/share"
  cp -r resources "$pkgdir/usr/share/talon"

  # fix talon's python by using our python37
  ln -snf /usr/bin/python3.7 "$pkgdir/usr/share/talon/resources/python/bin/python3"

  install -Dm644 resources/EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  install -Dm644 resources/LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSES.txt"
}

source=(
  'talon.tar.xz::https://talonvoice.com/dl/latest/talon-linux.tar.xz'
  'https://talonvoice.com/dl/talon-w2l-small3-dslm-en_US.zip'
  'start.sh'
  'talon.desktop'
  'talon.png'
)

b2sums=('215a247eacf3dfe77ccd9d3f6cded66052443bc87df04eac23521143e3e3dfb106738fc5e4fa7ddb39fe7231ba2ed322679cfe499b907b4b72bbb4d901761463'
        '34608eb13260ad88baa65faa875e29808ff30be56ae90298ca2d081181cd90a26d2c1f126dd605467f18245136b962ee0e2db17139392a37a44c6a9bc46301ec'
        'c63afa0d3d1cbdeda086b278c4539b60be80be1b927e7eb137d2c40d3dbb13b0945efd743515c3d2d6bee7ff66b01cc9360cf3be12a17e4d4ca481d71d574dfb'
        '86a2e315b72e43e1083cd9163adb634987526fe80972ff3697afa71d538968bce54b7e2115fee9814768aba4c2dfb7d8c23ed45f75c70f44cfee9a30e00bf99e'
        'a5938dcf06c69adef6fb6461ff683fdaa82c806771f080da4539279e242bd3df30ab032283f3a3c062cf2fb66a29616cbda7d25bfec90bcb9af567a67477517d'
)
