# Maintainer:

pkgname=ubuntu-emulator
pkgver=0.34
pkgrel=1
pkgdesc="Create and destroy Ubuntu Touch instances and run them with the emulator"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
depends=("android-tools" "ubuntu-emulator-runtime" "lib32-libgl")
makedepends=("go" "bzr")
# options='!emptydirs'
source=("https://launchpad.net/ubuntu/+archive/primary/+files/goget-ubuntu-touch_${pkgver}.orig.tar.gz"
        "fix_chpasswd_path.patch")
sha512sums=('86b996e9fa62f54fa3c7920d4fc9874218e6e839f5c0e3e62fce4d17881692e6eb68fab2b32022217ca356e5d67676b05c95b42334b750f1b594daf820e9980b'
            'dda7af7cfd6b32cdcd490fdd93f4559645db6962eb16c8b3b0d5f4cc807ab45d141fc359e8dd96edebcf901cea197f12eaa12509411907df8ad69b1afad3d190')

build() {
  export GOPATH="$srcdir/build"

  cd $srcdir/goget-ubuntu-touch-$pkgver/$pkgname

  #download dependencies
  go get -v -d

  # Build executable
  cd $GOPATH/src/launchpad.net/goget-ubuntu-touch/ubuntu-emulator
  patch -Np1 < $srcdir/fix_chpasswd_path.patch
  go install
}

package() {
  mkdir -p $pkgdir/usr/share/ubuntu-emulator/
  cp -r $srcdir/goget-ubuntu-touch-$pkgver/ubuntu-emulator/skins $pkgdir/usr/share/ubuntu-emulator/
  
  install -Dm644 $srcdir/goget-ubuntu-touch-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  install -Dm755 $srcdir/build/bin/ubuntu-emulator $pkgdir/usr/bin/ubuntu-emulator
}
