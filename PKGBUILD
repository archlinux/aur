# Maintainer: Eugene Dvoretsky <radioxoma from gmail com>
# Visit https://github.com/radioxoma/aur for pull requests or issue solving.

pkgname=micromanager-git
pkgver=1.4.21.r39.ge60756c
pkgrel=1
epoch=
pkgdesc="Software package for control of automated microscopes. CMMCore and python2 bindings only."
arch=('x86_64' 'i686')
url="http://www.micro-manager.org"
license=('BSD LGPL')
groups=()
depends=('boost' 'libdc1394' 'python2' 'python2-numpy')
makedepends=('git' 'swig')
checkdepends=()
optdepends=()
provides=('micromanager')
conflicts=('micromanager')
replaces=()
backup=()
options=()
install=mm.install
changelog=ChangeLog
# Alternative repo: https://github.com/openspim/micromanager/tree/svn/git-svn
source=($pkgname::git+https://github.com/mdcurtis/micromanager-upstream.git#commit=e60756c
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

        # Install MMCorePy
        SPDIR="$pkgdir/usr/lib/python2.7/site-packages"
        mkdir -p "$SPDIR"
        mv "$pkgdir/usr/lib/micro-manager/MMCorePy.py" "$SPDIR"
        mv "$pkgdir/usr/lib/micro-manager/_MMCorePy.so" "$SPDIR"
        python2 -m compileall "$SPDIR"
        python2 -O -m compileall "$SPDIR"

        # We need to update ldconfig cache with new libs.
        install -Dm644 "$srcdir/micromanager-lib.conf" "$pkgdir/etc/ld.so.conf.d/micromanager-lib.conf"
        install -Dm644 "$srcdir/$pkgname/doc/copyright.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# This script print 'DemoCamera' property list if CMMCore and python bindings
# had installed well.
# $ python2 -c 'import MMCorePy; DEVICE = ["Camera", "DemoCamera", "DCam"]; mmc = MMCorePy.CMMCore(); mmc.loadDevice(*DEVICE); mmc.initializeDevice(DEVICE[0]); mmc.setCameraDevice(DEVICE[0]); print mmc.getDevicePropertyNames(DEVICE[0])'
