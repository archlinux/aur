# Maintainer: radioxoma <radioxoma from gmail com>
# Last successful build with 1.4.13.r2306.gf5e50bd 22.01.2014 on x86_64.
pkgname=micromanager-git
pkgver=1.4.13.r2306.gf5e50bd
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
source=($pkgname::git+https://github.com/mdcurtis/micromanager-upstream.git#commit=f5e50bd
        'python_makefile.diff'
        'python_setup.diff'
        'micromanager-lib.conf')
noextract=()
md5sums=('SKIP'
         '76a9fb824728a8397e3b5245ffe4ddaf'
         'e14361cc344c2fb0d03f3458d53eb152'
         'b7b6a68ce53d8ea1a4a29d187174ee4c') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
        cd "$srcdir/$pkgname"
        
        # Change python to python2.
        # Remove installing commands form makefile and use setuptools instead.
        # See PKGBUILD package() function.
        patch -p0 < "$srcdir/python_makefile.diff"
        
        # Patching setup.py to prevent
        # >>> import MMCorePy
        # ...
        # ImportError: ./_MMCorePy.so: undefined symbol: _ZTI8CMMError
        # ... etc
        patch -p0 < "$srcdir/python_setup.diff"

        sh mmUnixBuild.sh
}

build() {
        cd "$srcdir/$pkgname"
        # Without Java-based GUI too.
        # Feel free to improve package to work with ImageJ or FIJI.
        ./configure --prefix=/usr --without-imagej --enable-python
        make
}

# check() {
#         cd "$srcdir/$pkgname"
#         make -k check
# }

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install

        # Micro-manager devs plan use autotools without setuptools for python.
        cd "$srcdir/$pkgname/MMCorePy_wrap/"
        python2 setup.py install --root="$pkgdir"

        # We need to update ldconfig cache with new libs.
        install -D -m644 "$srcdir/micromanager-lib.conf" "$pkgdir/etc/ld.so.conf.d/micromanager-lib.conf"
}

# This script print 'DemoCamera' property list if CMMCore and python bindings
# was installed well.
# $ python2 -c 'import MMCorePy; DEVICE = ["Camera", "DemoCamera", "DCam"]; mmc = MMCorePy.CMMCore(); mmc.loadDevice(*DEVICE); mmc.initializeDevice(DEVICE[0]); mmc.setCameraDevice(DEVICE[0]); print mmc.getDevicePropertyNames(DEVICE[0])'
