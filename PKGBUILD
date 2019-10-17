# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# WARNING: This package is very large.  It requires upwards 6 GiB of
#   space to completely build, so make sure you have plenty of room
#   where you do so.

# This package preferentially uses GOG's installer, using the
#   build function to extract the data.  Please ensure the
#   file is available in the build directory via copy or
#   symlink, i.e. ~/aur/fs2_open-data/setup_freespace_2_1.20.exe.
#       If using a copy of the retail CD, follow the instructions
#   from the website below to extract the data. Once extracted, place
#   the data directly in the $builddir/src directory, i.e.
#       ~/aur/fs2_open-data/src/.
#   http://www.hard-light.net/wiki/index.php/Fs2_open_on_Linux/Acquiring_the_Game_Data

# TODO: acquire copy of CDs to test, refine, and include CD installer
# script in pkgbuild

pkgname=fs2_open-data
pkgver=1.20
pkgrel=9
pkgdesc="FreeSpace 2 retail data for fs2_open"
arch=('any')
url="https://www.gog.com/game/freespace_2"
license=('custom:freespace2')
makedepends=('icoutils' 'innoextract' 'recode')
PKGEXT=".pkg.tar"
source=('file://setup_freespace_2_1.20.exe')
sha256sums=('6070befe0e041aa80c824593ac3ed2430ea18eb14aba6bdb1704fd375786c707')
prepare() {
    local _gog_exe="setup_freespace_2_1.20.exe"
    mkdir -p build
    cd build
    innoextract ../$_gog_exe
    # Extract and convert the icon
    # Untested with the CD version
    if [ -f ReadMe.txt ]; then
	wrestool -x -t 14 -o . FreeSpace2.exe
    else
	wrestool -x -t 14 -o . app/FreeSpace2.exe
    fi
    icotool -x -i 3 -o . FreeSpace2.exe_14_128.ico
    mv FreeSpace2.exe_14_128_3_48x48x8.png freespace2.png
}

package() {
    cd "$srcdir/build"

    if [[ -r ReadMe.txt ]]; then sed -n 416,471p ReadMe.txt > LICENSE;
    else head -n 19 < tmp/GOG_EULA.txt | recode windows-1252/CRLF..utf8 > LICENSE;
	 license=('custom:goodoldgames');
    fi

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 freespace2.png "$pkgdir/usr/share/icons/freespace2.png"
    rm -f freespace2.png

    # This whole thing goes in /opt/fs2_open as a lot of upstream stuff
    #   expects binaries and data to be together like in Windows
    mkdir -p "$pkgdir/opt/fs2_open"

    if [[ -r ReadMe.txt ]]; then
	mv ./* "$pkgdir/opt/fs2_open"
    else
	# The GOG installer places cutscenes and data copies in folders
	#   corresponding with the original CDs; we need to move the
	#   cutscenes and delete the redundant data and folders.
	mkdir app/data/movies
	mv app/data{2,3}/*.MVE app/data/movies/
	rm -rf app/data{2,3}
	mv app/* "$pkgdir/opt/fs2_open"
    fi

    # Useless files for a Linux port. :D
    find "$pkgdir/opt/fs2_open" -iname \*.exe -print0 -or -iname \*.dll -print0 \
	 -or -iname \*.ico -print0 | xargs -0 rm -f
}
