# Maintainer: Matthew Muresan  <matt_muresan [AT] hotmail [DOT] com>
# Former Maintainer: bidet <b [AT] t>
# Former Maintainer: ian kremlin <ian [AT] kremlin [DOT] cc>
# Former Maintainer: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dwarffortress-phoebus
pkgver=0.44.11

# rewrite by kremlin, july 8th 2014
# with help from halosghost
pkgrel=17
epoch=1

pkgdesc='Dwarf Fortress preloaded with Phoebus tileset'

arch=('x86_64')
url='http://www.bay12games.com/dwarves/'
license=('custom:dwarffortress_phoebus')
groups=('games')
depends=('gcc-libs' 'glew' 'glib2' 'glu' 'gtk2' 'libsndfile' 'openal' 'sdl_image' 'sdl_ttf')

source=('https://github.com/DFgraphics/Phoebus/archive/44.11b.zip'
		'http://bay12games.com/dwarves/df_44_11_linux.tar.bz2'
		'dwarf-fortress'
		'LICENSE')

md5sums=('9e4fb2c75e02f8f890a7c73af53a117d'
'a9baf90758ceae8f08895ffe08e758a3'
'915f9b8efc7e2ea9e233bc6a9606038e'
'eddfb4bd478f9c64e6801bda7c7791ba'
)

prepare() {
	
	# inject DF with phoebus' tilesets
	cp -arf "$srcdir"/Phoebus-44.11b/raw/graphics/* "$srcdir"/df_linux/raw/graphics/
	cp -arf "$srcdir"/Phoebus-44.11b/raw/objects/* "$srcdir"/df_linux/raw/objects/

	cp -arf --no-preserve=ownership "$srcdir"/Phoebus-44.11b/data/art/* "$srcdir"/df_linux/data/art/
	cp -arf --no-preserve=ownership "$srcdir"/Phoebus-44.11b/data/init/* "$srcdir"/df_linux/data/init/
	#remove libstc++ as per http://www.bay12games.com/dwarves/mantisbt/view.php?id=9893
	rm "$srcdir"/df_linux/libs/'libstdc++.so.6'
	chmod -R a+rx "$srcdir"/df_linux/libs/Dwarf_Fortress
	chmod -R a+rx "$srcdir"/df_linux/data/*
	chmod -R a+rx "$srcdir"/df_linux/raw/*
	chmod -R a+rx "$srcdir"/df_linux/g_src/*

	chmod a+rx "$srcdir"/df_linux/*
	chmod a+r "$srcdir"/df_linux/sdl/sdl\ license.txt
}
package() {

	install -d "$pkgdir"/usr/lib32/"$pkgname"
   	install -m644 "$srcdir"/df_linux/libs/libgraphics.so "$pkgdir"/usr/lib32/"$pkgname"/libgraphics.so
	install -D -m755 "$srcdir"/dwarf-fortress "$pkgdir"/usr/bin/dwarf-fortress
	install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	cp -a --no-preserve=ownership "$srcdir"/df_linux/* "$pkgdir"/usr/lib32/"$pkgname"/
	mkdir -p "$pkgdir"/usr/lib32/"$pkgname"/data/save/current/

	chmod a+rw "$pkgdir"/usr/lib32/"$pkgname"/data/save/
	chmod a+rw "$pkgdir"/usr/lib32/"$pkgname"/data/save/current # save dir is worldwrite
	chmod a+w "$pkgdir"/usr/lib32/"$pkgname"/data/index # crashes otherwise
}
