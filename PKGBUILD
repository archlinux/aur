# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
# Contributor: Joshua Ellis <josh@jpellis.me>
# Contributor: Konstantin Gizdov <kgizdov@gmail.com>

pkgname=pythia
pkgver=8.2.19
_pkgid="${pkgname}${pkgver//./}"
pkgrel=3
pkgdesc="High-energy physics events generator."
arch=('i686' 'x86_64')
url="http://home.thep.lu.se/Pythia/"
license=('GPL')
depends=('boost-libs' 'zlib')
provides=('pythia')
source=("http://home.thep.lu.se/~torbjorn/pythia8/$_pkgid.tgz"
        "pythia.sh"
        "shared_lib.patch")
sha256sums=('1ea21c01d70f6ddf58457ed18405d89193f07152466ee925ca5102da1abcd08d'
            '8e3a205fd3fbe8d833ca8377a418a4f2083a4e274c32b93ba295cb3335fb4225'
            'fdbcb895d3506d10f8983ee15afbf1c5947905a4ead95384eb55fd682dfe4c82')
_srcpath=$srcdir/$_pkgid

prepare() {
    cd $srcdir/$_pkgid
    patch -p 1 < ../shared_lib.patch
}

build() {
    cd $srcdir/$_pkgid
    ## Pythia can be configured to use other packages by enabling the additional
    ## flags below (just uncomment and move up the relevant ones).
    ##
    ## Note that this requires the relevant programs to be already installed.
    ## Some additional flags might be required in the configure script cannot
    ## find the relevant files.
    ./configure --prefix="/usr" \
                --cxx-common="-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC -Ofast -march=native" \
                --enable-shared \
                --with-boost \
                --with-gzip \
                --with-python \
                --with-python-include=/usr/include/python3.5m/
                # --with-evtgen \
                # --with-fastjet3 \
                # --with-hepmc3 \
                # --with-lhapdf6 \
                # --with-powheg \
                # --with-promc \
                #--with-root \
                #--with-root-include=/usr/include/root
    make
}

package() {
    mkdir -p "$pkgdir/usr"
    install -Dm755 "$srcdir/$_pkgid/bin/pythia8-config" "$pkgdir/usr/bin/pythia8-config"
    install -D "$srcdir/pythia.sh" "$pkgdir/etc/profile.d/pythia.sh"
    
    cp -r "$srcdir/$_pkgid/include" "$pkgdir/usr/"
    cp -r "$srcdir/$_pkgid/share" "$pkgdir/usr/"
    cp -r "$srcdir/$_pkgid/examples" "$pkgdir/usr/share/Pythia8/"

    install -Dm755 "$srcdir/$_pkgid/lib/libpythia8.so" "$pkgdir/usr/lib/libpythia8.so"
    install -Dm755 "$srcdir/$_pkgid/lib/pythia8.py" "$pkgdir/usr/lib/python3.5/site-packages/pythia8.py"

    install -d ${pkgdir}/etc/ld.so.conf.d
    echo '/usr/lib/pythia8' > ${pkgdir}/etc/ld.so.conf.d/pythia8.conf
    
}
