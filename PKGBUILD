# Contributor: karamaz0v <nihilum at gmail.com>
# purge-ext and swig patch from Graham Inggs https://launchpad.net/~ginggs/+archive/ppa
# Maintainer : karamaz0v

pkgname=p4vasp
pkgver=0.3.30
pkgrel=2
pkgdesc="A visualization suite for the Vienna Ab-initio Simulation Package (VASP)"
url="http://www.p4vasp.at/"
license=('GPL2')
arch=("x86_64")
depends=('python2' 'mesa' 'fltk' 'glu' 'swig')
options=(!strip staticlibs)
source=("http://www.p4vasp.at/files/${pkgname}-${pkgver}.tgz"
        "${pkgname}.desktop" 
        "${pkgname}.png" 
        'fix-glade-typo.patch'
        'fix-swig-len.patch'
        'sort-applet-list.patch'
        'python2-call.patch' 
        'purge-ext.patch' 
        'swig.patch' 
	'p4vasp_home.patch'
	'pass-hardening-flags.patch'
	'set-title-and-icon.patch')
md5sums=('3af30cc650cf4623b145138f92436b23'
         'f6cd7d2771e3e8cb83238542b486471b'
         '071dea8ea3223048466933a6e175a262'
         'c5389531b9c747eda241c16641928827'
         'c614721ae39e1eb5b18ec8f215f2fd6a'
         '6934484e7d8c28a178b37c9cba4924d4'
         '1009761795bdc56979e261abf339d70f'
         'ce1d2c9fa5d3b1361e3e466374f92995'
         '33d9191f7a2e46ae9a292f07d67720a0'
         'bcdb6b0204ec2134ae5582051587f9a4'
         '50d2eebce743fa82462748e57cc3b397'
	 'e853d1c9b9ac3e75811f4ea48858009d')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch -p0 -i "$srcdir/fix-glade-typo.patch"
        patch -p0 -i "$srcdir/fix-swig-len.patch"
        patch -p0 -i "$srcdir/sort-applet-list.patch"
        patch -p0 -i "$srcdir/python2-call.patch"
        patch -p0 -i "$srcdir/purge-ext.patch"
        patch -p0 -i "$srcdir/swig.patch"
        patch -p0 -i "$srcdir/p4vasp_home.patch"
        patch -p0 -i "$srcdir/pass-hardening-flags.patch"
        patch -p0 -i "$srcdir/set-title-and-icon.patch"
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        make P4VASP_HOME=/usr/share/$pkgname \
             PYTHON_HOME=/usr/lib/python2.7 \
             PYINCLUDE=/usr/include/python2.7
}


package() {
        cd "$srcdir/$pkgname-$pkgver"
        #install
        make P4VASP_HOME="$pkgdir"/usr/share/"$pkgname" \
             PYTHON_HOME=/usr/lib/python2.7 \
             PYINCLUDE=/usr/include/python2.7 \
             SITE_PACKAGES="$pkgdir"/usr/lib/python2.7/site-packages \
             INCLUDEDIR="$pkgdir"/usr/include \
             LIBDIR="$pkgdir"/usr/lib \
             BINDIR="$pkgdir"/usr/bin install
        # Install Desktop File and Icon
        install -D -m644 "$srcdir"/"$pkgname".desktop \
                         "$pkgdir"/usr/share/applications/"$pkgname".desktop
        install -D -m644 "$srcdir"/"$pkgname".png \
                         "$pkgdir"/usr/share/icons/"$pkgname"-icon.png
        rm -v "$pkgdir"/usr/share/"$pkgname"/uninstall.sh
}
