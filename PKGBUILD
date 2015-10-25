# Contributor: Anton Leontiev <unsector /at/ km.ru>
pkgname=lasercalc-git
pkgver=0.6
pkgrel=2
pkgdesc='A tool to calculate optical paths and resonators based on Gaussian beam matrix optics'
arch=('i686' 'x86_64')
url='https://sourceforge.net/apps/phpwebsite/lasercalc/'
license=('GPL3')
depends=('wxgtk' 'webkitgtk2')
makedepends=('wxgtk' 'webkitgtk2')
conflicts=('lasercalc')
install=$pkgname.install
source=("git+git://git.code.sf.net/p/lasercalc/code"
	"git+git://git.code.sf.net/p/lasercalc/libproperties"
	"git+git://git.code.sf.net/p/lasercalc/libsaf"
	"git+git://git.code.sf.net/p/lasercalc/libplot"
	"$pkgname.desktop"
	
	"patch_properties.patch"
	"patch_saf.patch"
	"patch_plot.patch"
	"patch_lasercalc.patch")

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dc3d1436285e80acdd218ae09cb70354c88a62cfd6d7113f4e43bdf2297e211a8256af2a3302e132a5c1c6e1c7dc78499bc18589c377fbce939a660448a11f64'
            '6c8c534c65fddf5c39944817b6c5c1a0c446433691fc7d723ad52a9005d57089137ba5b1d735d9199eadcd3bc14aafcb16c6606f5610c4d0862c9264d633c407'
            '8cb2bb779925a8492e7595097e369621a47b0b0cf4531e96fec9280a1058a0f941bb3887bfc3170d11c8649e530693b462dd3cbbc28249251cc1b40d74102ccc'
            '4942dec7eacb1de18c8428838be1dc50334f4b290b518981c262b30b0358aaca1ad6271f43b039ca6de48c9c1d76de42444865216ce0e1bc8108c1d8616db44c'
            '5ff06762ecd9655e015a60cd91d145557e7dd6e10cdae39a365b0fcbdd3db375c54a2d7c6633349fd6130f83ed59e45c91efdf24aaa0f9e296c61ae3c0442d9c')

prepare() {
	cd "$srcdir/libproperties/properties"
	git apply "$srcdir/patch_properties.patch"
        
        cd "$srcdir/libsaf/SAF"
	git apply "$srcdir/patch_saf.patch"
	
        cd "$srcdir/libplot/plot"
        git apply "$srcdir/patch_plot.patch"
        
        cd "$srcdir/code/LaserCalc"
        git apply "$srcdir/patch_lasercalc.patch"
}
         
build() {
	export CPPFLAGS="-I$srcdir/libs/include"
	export LDFLAGS="-L$srcdir/libs/lib"
        
        msg2 "Building libproperties..."
	cd "$srcdir/libproperties/properties"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --with-wx-config=wx-config --disable-shared
	make install

        msg2 "Building libsaf..."
	cd "$srcdir/libsaf/SAF"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --with-wx-config=wx-config --disable-shared
	make install

        msg2 "Building libplot..."
	cd "$srcdir/libplot/plot"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --with-wx-config=wx-config --disable-shared
	make install
        
        msg2 "Building LaserCalc..."
	cd "$srcdir/code/LaserCalc"
	rm missing; autoreconf -i
	./configure --prefix=/usr --with-wx-config=wx-config
	make
}

package() {
	cd "$srcdir/code/LaserCalc"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/title.htm"
	install -Dm644 src/lasercalc.xpm "$pkgdir/usr/share/pixmaps/lasercalc.xpm"
	install -Dm644 "$srcdir/lasercalc-git.desktop" "$pkgdir/usr/share/applications/lasercalc-git.desktop"
}
