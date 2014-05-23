# Maintainer: radioxoma <radioxoma from gmail com>
# Visit https://github.com/radioxoma/aur for pull requests or issue solving.

pkgname=micromanager-git
pkgver=1.4.13.r3204.g13250d0
pkgrel=1
epoch=
pkgdesc="Software package for control of automated microscopes. CMMCore and python2 bindings only."
arch=('x86_64' 'i686')
url="http://www.micro-manager.org"
license=('LGPL-2.1 BSD GPL-3')
groups=()
depends=('zlib' 'boost' 'libdc1394' 'python2' 'python2-numpy')
makedepends=('git' 'swig')
checkdepends=()
optdepends=()
provides=('micromanager')
conflicts=('micromanager')
replaces=()
backup=()
options=()
install=mm.install
changelog=
source=($pkgname::git+https://github.com/mdcurtis/micromanager-upstream.git#commit=13250d0
        'micromanager-lib.conf')
noextract=()
md5sums=('SKIP'
         'b7b6a68ce53d8ea1a4a29d187174ee4c') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
        cd "$srcdir/$pkgname"
        sh ./autogen.sh
}

build() {
        cd "$srcdir/$pkgname"
        # With MMCore, device adapters, Python2 wrapper (MMCorePy).
        # Without Java wrapper (MMCoreJ), MMStudio (Java GUI)
        # and closed-source device adapters.

        # Feel free to improve package to work with ImageJ or FIJI.
        ./configure --prefix=/usr --with-java=no --with-python PYTHON="python2"
        make
}

# check() {
#         cd "$srcdir/$pkgname"
#         make -k check
# }

package() {
        cd "$srcdir/$pkgname"
        mkdir -p "$pkgdir/usr/lib/micro-manager"
        make install DESTDIR="$pkgdir"

        mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
        mv "$pkgdir/usr/lib/micro-manager/MMCorePy.py" "$pkgdir/usr/lib/python2.7/site-packages"
        mv "$pkgdir/usr/lib/micro-manager/_MMCorePy.so" "$pkgdir/usr/lib/python2.7/site-packages"
        # We need to update ldconfig cache with new libs.
        install -D -m644 "$srcdir/micromanager-lib.conf" "$pkgdir/etc/ld.so.conf.d/micromanager-lib.conf"
}

# This script print 'DemoCamera' property list if CMMCore and python bindings
# was installed well.
# $ python2 -c 'import MMCorePy; DEVICE = ["Camera", "DemoCamera", "DCam"]; mmc = MMCorePy.CMMCore(); mmc.loadDevice(*DEVICE); mmc.initializeDevice(DEVICE[0]); mmc.setCameraDevice(DEVICE[0]); print mmc.getDevicePropertyNames(DEVICE[0])'
