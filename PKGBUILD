# Maintainer: Joop Kiefte <joop@kiefte.net>
pkgname=ocean-data
pkgver=0.1
pkgrel=1
pkgdesc="The library data of the Ocean religious writings tool"
arch=('any')
url="http://bahai-education.org/ocean"
license=('custom')
makedepends=('p7zip' 'convmv' 'perl')
source=('http://bahai-education.org/sites/default/files/uploadfiles/Ocean.dmg' 'file-encode.pl')
noextract=('Ocean.dmg')
md5sums=('54e727a44371f2e33cb945100f11861a'
         'cc015d746955e6ba574901d40c7be034')

sanitize() {
  shopt -s extglob;

  filename=$(basename "$1")
  directory=$(dirname "$1")

  filename_clean=$(perl "$builddir/file-encode.pl" "$filename")

  if (test "$filename" != "$filename_clean")
  then
    mv -v "$1" "$directory/$filename_clean"
  fi
}

export -f sanitize

sanitize_dir() {
  find "$1" -depth -exec bash -c 'sanitize "$0"' {} \;
}

build() {
  export builddir="`pwd`"
  cd "Ocean/Ocean.app/Contents/Resources/drive_c/Ocean/"
  echo "Sanitize dir"
  sanitize_dir "Library"
  echo "Done sanitizing"
}

prepare() {
	7z -y x Ocean.dmg
}

package() {
  cd "Ocean/Ocean.app/Contents/Resources/drive_c/Ocean/"

  echo "Create dir"
  mkdir -p "$pkgdir/usr/share/ocean/"
  echo "Copy to dir"
  cp -r Library "$pkgdir/usr/share/ocean/"
}
