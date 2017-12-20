pkgname=bibata-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Material Based Cursor Theme."
arch=('any')
url="https://github.com/KaizIqbal/Bibata_Cursor.git"
license=('GPL')
makedepends=('inkscape' 'xorg-xcursorgen')
source=('git+https://github.com/KaizIqbal/Bibata_Cursor')
sha256sums=('SKIP')

build() {
	cd "$srcdir/Bibata_Cursor"

	# Bibata Default
	RAWSVGS_Bibata="src/Bibata_Oil/svgs"
	INDEX_Bibata="src/Bibata_Oil/cursor.theme"
	INDEX1_Bibata="src/Bibata_Oil/index.theme"
	
	# Bibata Light
	RAWSVGS_Bibata_Light="src/Bibata_Ice/svgs"
	INDEX_Bibata_Light="src/Bibata_Ice/cursor.theme"
	INDEX1_Bibata_Light="src/Bibata_Ice/index.theme"
	
	ALIASES="src/cursorList"
	
	# Dirs
	DIR2X_Bibata="build/Bibata_Oil/x2"
	DIR1X_Bibata="build/Bibata_Oil/x1"
	DIR2X_Bibata_Light="build/Bibata_Ice/x2"
	DIR1X_Bibata_Light="build/Bibata_Ice/x1"
	
	OUTPUT_Bibata="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata)"
	OUTPUT_Bibata=${OUTPUT_Bibata// /_}
	OUTPUT_Bibata_Light="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Light)"
	OUTPUT_Bibata_Light=${OUTPUT_Bibata_Light// /_}
	
	mkdir -p "$DIR2X_Bibata"
	mkdir -p "$DIR1X_Bibata"
	mkdir -p "$DIR2X_Bibata_Light"
	mkdir -p "$DIR1X_Bibata_Light"
	mkdir -p "$OUTPUT_Bibata/cursors"
	mkdir -p "$OUTPUT_Bibata_Light/cursors"
	
	# Generating simple cursor pixmaps
	for CUR in src/config/*.cursor;
	do
		BASENAME=$CUR
		BASENAME=${BASENAME##*/}
		BASENAME=${BASENAME%.*}
	
		inkscape -w 33  -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR1X_Bibata/$BASENAME.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR2X_Bibata/$BASENAME.png" > /dev/null
		inkscape -w 33  -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR1X_Bibata_Light/$BASENAME.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR2X_Bibata_Light/$BASENAME.png" > /dev/null
	done
	
	# Generating animated cursor pixmaps
	for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
	do
		inkscape -w 33  -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR1X_Bibata/progress-$i.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR2X_Bibata/progress-$i.png" > /dev/null
		inkscape -w 33  -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR1X_Bibata_Light/progress-$i.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR2X_Bibata_Light/progress-$i.png" > /dev/null

		inkscape -w 33  -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR1X_Bibata/wait-$i.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR2X_Bibata/wait-$i.png" > /dev/null
		inkscape -w 33  -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR1X_Bibata_Light/wait-$i.png" > /dev/null
		inkscape -w 66 -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR2X_Bibata_Light/wait-$i.png" > /dev/null
	done
	
	# Generating cursor theme
	for CUR in src/config/*.cursor; do
		BASENAME=$CUR
		BASENAME=${BASENAME##*/}
		BASENAME=${BASENAME%.*}

		ERR="$( xcursorgen -p build/Bibata_Oil "$CUR" "$OUTPUT_Bibata/cursors/$BASENAME" 2>&1 )"
    
		if [[ "$?" -ne "0" ]]; then
			echo "FAIL: $CUR $ERR"
		fi

		ERR="$( xcursorgen -p build/Bibata_Ice "$CUR" "$OUTPUT_Bibata_Light/cursors/$BASENAME" 2>&1 )"
    
		if [[ "$?" -ne "0" ]]; then
			echo "FAIL: $CUR $ERR"
		fi
	done
	
	# Generating shortcuts
	while read -r ALIAS ;
	do
		FROM=${ALIAS% *}
		TO=${ALIAS#* }
    
		if [ -e "$OUTPUT_Bibata/cursors/$FROM" ] ; then
			continue
		fi
		ln -s "$TO" "$OUTPUT_Bibata/cursors/$FROM"

		if [ -e "$OUTPUT_Bibata_Light/cursors/$FROM" ] ; then
			continue
		fi
		ln -s "$TO" "$OUTPUT_Bibata_Light/cursors/$FROM"
	done < $ALIASES
	
	# Copying Theme Index
	cp $INDEX_Bibata "$OUTPUT_Bibata/cursor.theme"
	cp $INDEX1_Bibata "$OUTPUT_Bibata/index.theme"
	
	cp $INDEX_Bibata_Light "$OUTPUT_Bibata_Light/cursor.theme"
	cp $INDEX1_Bibata_Light "$OUTPUT_Bibata_Light/index.theme"
}

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	mv "$srcdir/Bibata_Cursor/Bibata_Ice" "$pkgdir/usr/share/icons/Bibata_Ice"
	mv "$srcdir/Bibata_Cursor/Bibata_Oil" "$pkgdir/usr/share/icons/Bibata_Oil"
}
