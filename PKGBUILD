# Contributor: karamaz0v <nihilum at gmail.com>
# purge-ext and swig patch from Graham Inggs https://launchpad.net/~ginggs/+archive/ppa
# Maintainer : karamaz0v

pkgname=p4vasp
pkgver=0.3.29
pkgrel=1
pkgdesc="A visualization suite for the Vienna Ab-initio Simulation Package (VASP)"
url="http://www.p4vasp.at/"
license=('GPL2')
arch=("i686" "x86_64")
depends=('python2' 'mesa' 'fltk' 'glu' 'swig')
options=(!strip staticlibs)
source=("http://www.p4vasp.at/index.php/downloads/finish/2-source-code/16-p4vasp-0-3-29/${pkgname}-${pkgver}.tgz"
        "${pkgname}.desktop" 
        "${pkgname}.png" 
        'python2-call.patch' 
        'purge-ext.patch' 
        'swig.patch' 
	'p4vasp_home.patch')
md5sums=('845063c013e726a1f695399825082bdd'
         'f6cd7d2771e3e8cb83238542b486471b'
         '071dea8ea3223048466933a6e175a262'
         '6af582aec9b6aee3070051c318de10d9'
         '3420044e9a173caab2d0c30df0851e10'  
         '33d9191f7a2e46ae9a292f07d67720a0'
         '0eaf2bae665eae3da2c4f923218e5224')


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


