# maintainer: lorelei <eel@sdf.org>

pkgname=python09
pkgver=0.9.1
pkgrel=10
pkgdesc="an extensible interpreted programming language"
arch=('i686' 'x86_64')
license=('custom')
url="www.cwi.nl/~guido/Python.html"
depends=("readline" "termcap")

source=(

	"http://python.org/ftp/python/src/Python-$pkgver.tar.gz"
        "http://eel.sdf.org/pit/python/0.9/"{mod,tut}".pdf"

)

md5sums=(
	 "7d7a4c0e472226b33f7ad2f976f4eb9e"
         "b97d27ed16cb0df9ffc2d9067c5c6982"
         "bf44218c430a1c30261ff0ba1e5f5ff3" 
)

options=(
         "!buildflags"
         "!makeflags"
         "!strip"
)


build() {

	cd "$srcdir/python-$pkgver/src"

        # put the standard library in a familiar place
        sed -i 's|^DEFPYTHONPATH=.*|DEFPYTHONPATH=.:/usr/lib/python0.9|' Makefile

        # build with readline
        sed -i 's|^#LIBREADLINE=.*|LIBREADLINE=/usr/lib/libreadline.so|' Makefile
        sed -i 's|^#LIBTERMCAP=.*|LIBTERMCAP=-ltermcap|' Makefile
        sed -i 's|^#RL_USE =.*|RL_USE=-DUSE_READLINE|' Makefile
        sed -i 's|^#RL_LIBS=.*|RL_LIBS=$(LIBREADLINE) $(LIBALLOCA) $(LIBTERMCAP)|' Makefile
        sed -i 's|^#RL_LIBDEPS=.*|RL_LIBDEPS=$(LIBREADLINE) $(LIBALLOCA)|' Makefile

        make


        cd "$srcdir/python-$pkgver"

        # add section number
        sed -i 's|^.TH PYTHON.*|.TH PYTHON 1 "19 February 1991"|' python.man

        # make license
        sed -n '/Copyright 1991/,/THIS SOFTWARE./p' README > LICENSE
}

package() {

        cd "$pkgdir"
        mkdir usr
        cd usr

        mkdir bin 
        mkdir -p lib/python0.9

        mkdir share
        cd share
        mkdir -p doc/python0
        mkdir -p licenses/python0

	cd "$srcdir/python-$pkgver/src"

        install -Dpm755 python $pkgdir/usr/bin/python0.9
        ln -s /usr/bin/python0.9 $pkgdir/usr/bin/python0

        cd "$srcdir/python-$pkgver"
        install -Dpm644 LICENSE $pkgdir/usr/share/licenses/python0/

        install -Dpm644 python.man "$pkgdir/usr/share/man/man1/python0.9.1"
        ln -s $pkgdir/usr/share/man/man1/python0.9.1 $pkgdir/usr/share/man/man1/python0.1


        cd "$srcdir/python-$pkgver/lib"
        install -Dpm644 *.py $pkgdir/usr/lib/python0.9/

        cd "$srcdir/python-$pkgver/doc"
        install -Dpm644 fibo.py $pkgdir/usr/lib/python0.9/

        cd "$srcdir"
        install -Dpm644 *.pdf $pkgdir/usr/share/doc/python0/

}
