# Contributor: karamaz0v <nihilum at gmail.com>
# purge-ext and swig patch from Graham Inggs https://launchpad.net/~ginggs/+archive/ppa
# Maintainer : karamaz0v

pkgname=p4vasp
pkgver=0.3.30
pkgrel=1
pkgdesc="A visualization suite for the Vienna Ab-initio Simulation Package (VASP)"
url="http://www.p4vasp.at/"
license=('GPL2')
arch=("x86_64")
depends=('python2' 'mesa' 'fltk' 'glu' 'swig')
options=(!strip staticlibs)
source=("http://www.p4vasp.at/files/${pkgname}-${pkgver}.tgz"
        "${pkgname}.desktop" 
        "${pkgname}.png" 
        'python2-call.patch' 
        'purge-ext.patch' 
        'swig.patch' 
	'p4vasp_home.patch')
md5sums=('3af30cc650cf4623b145138f92436b23'
         'f6cd7d2771e3e8cb83238542b486471b'
         '071dea8ea3223048466933a6e175a262'
         'd3c2a5db23b3f8d32d1317bd7a8bf931'
         '04f68eff94b1fb3a049e45c32b318bb4'
         '33d9191f7a2e46ae9a292f07d67720a0'
	 '78f6b4e79bd20b370d47d025f9554b19')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch -p0 -i "$srcdir/python2-call.patch"
        patch -p0 -i "$srcdir/purge-ext.patch"
        patch -p0 -i "$srcdir/swig.patch"
        patch -p0 -i "$srcdir/p4vasp_home.patch"
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="/opt/$pkgname" p4vasp
        make DESTDIR="/opt/$pkgname" launcher
}


package() {
        cd "$srcdir/$pkgname-$pkgver"
        ls /opt
        make DESTDIR="$pkgdir/opt/$pkgname" install
        ## copy launcher
        install -d "$pkgdir/usr/bin/"
        ## install -D -m755 "$srcdir/vesta-exec" "$pkgdir/usr/bin/$pkgname"
        install -D -m755 "$pkgdir/opt/p4vasp/bin/p4v"  "$pkgdir/usr/bin"
        ## # Install Desktop File and Icon
        install -D -m644 "$srcdir/$pkgname.desktop" \
                         "$pkgdir/usr/share/applications/$pkgname.desktop"
        install -D -m644 "$srcdir/$pkgname.png" \
  	                 "$pkgdir/usr/share/icons/$pkgname-icon.png"
}


