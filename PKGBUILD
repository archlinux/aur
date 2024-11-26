# Maintainer: MeaTLoTioN <ml@erb.pw>
pkgname=syncterm-src
pkgver=latest
pkgrel=1
pkgdesc="SyncTERM - A terminal for connecting to BBSes (built from source)"
arch=('x86_64')
url="https://syncterm.bbsdev.net/"
license=('GPL')
depends=('ncurses' 'glibc' 'sdl12-compat' 'sdl2')  # Runtime dependencies
makedepends=('wget' 'unzip' 'gcc' 'make' 'base-devel')  # Build dependencies
source=()  # Sources are fetched dynamically in build()
sha256sums=()  # No checksum validation for dynamic sources

build() {
    cd "$srcdir"

    # Download the source zip files
    echo "[1;32mAbout to download the syncterm application source...[0m"
    wget https://gitlab.synchro.net/main/sbbs/-/archive/master/sbbs-master.zip?path=3rdp -O 3rdp.zip
    wget https://gitlab.synchro.net/main/sbbs/-/archive/master/sbbs-master.zip?path=src -O src.zip

    # Extract the zip files
    echo "[1;32mExtracting the source now...[0m"
    for F in *.zip; do unzip -a "$F"; done

    # Organize the directory structure
    echo "[1;32mSorting directory structure...[0m"
    for D in sbbs-master-*; do cp -r "$D"/* .; done
    rm -rf sbbs-master-*

    # Change directory to the source folder
    echo "[1;32mChange into the 'make' folder[0m"
    cd src/syncterm

    # To get full path src
    echo "[1;32mSet st_path variable for the SRC_ROOT path...[0m"
    st_path=${PWD%/*}
    
    # Time to compile!
    echo "[1;32mMake SRC_ROOT with path: $st_path[0m"
    make SRC_ROOT=$st_path
}

package() {
    cd "$srcdir/src/syncterm"

    # Find the newly built binary
    binary_file="$(find $srcdir -name syncterm|tail -1)"
    binary_file="$(echo "$binary_file"|sed 's|^\./||')"

    # Install the newly built binary
    install -Dm755 "${binary_file}" "$pkgdir/usr/bin/syncterm"    # Install the compiled binary
}

