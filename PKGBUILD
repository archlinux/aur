# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=zenbound2
pkgver=20120325
pkgrel=1
pkgdesc="Puzzle game of wrapping rope around wooden sculptures (Humble Android 2 Bundle)"
url="http://zenbound.com/"
groups=('humbleandroid2bundle' 'humblebundles')
license=('custom: "proprietary"')
arch=('i686' 'x86_64')
options=(!strip)
makedepends=()
source=()
md5sums=()
depends=(bash libvorbis libxinerama libxft openal sdl mesa gcc-libs)

if [[ $CARCH == x86_64 ]]; then
  _archive="$pkgname-$pkgver-amd64.tar.gz"
  _archive_md5="a9de765573750498f7d4e1de749c4122"
else
  _archive="$pkgname-$pkgver-i386.tar.gz"
  _archive_md5="e8ece37f5f5009afdb47633b1903b25e"
fi

build() {
  cd $srcdir

  if [ ! -f "$_fsarchivelocation$_archive" ]; then
	  if [ ! -f $_archive ] && [ -n "$_humbleandroid2bundlekey" ]; then
		rm -f $_archive* "downloads?key=$_humbleandroid2bundlekey"*
		wget -N "http://www.humblebundle.com/downloads?key=$_humbleandroid2bundlekey"
		wget -c "$(grep "$_archive" "downloads?key=$_humbleandroid2bundlekey" | cut -d "'" -f 10)"
		mv $_archive* $_archive
	  elif [ -z "$_humbleandroid2bundlekey" ]; then
		echo "You can automate the download of the archive using the _humbleandroid2bundlekey bash variable."
		echo "Just add 'export _humbleandroid2bundlekey=<Your key here>' to .bashrc"
		echo
		echo "Otherwise please just place $_archive into $(pwd)/"
		echo "Press Enter to continue"
		read -a _unused
	  fi
  fi

  if [ ! -f "$_fsarchivelocation$_archive" ]; then
    echo "$_fsarchivelocation$_archive not found!"
    return 1
  fi

  if ! echo "$_archive_md5 $_fsarchivelocation$_archive" | md5sum -c --quiet; then
    echo "Invalid checksum for $_fsarchivelocation$_archive"
    return 1
  fi
}

package() {
  # directories
  install -d $pkgdir/opt/$pkgname
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/applications

  cd $srcdir
  tar xzf $_fsarchivelocation$_archive
  # Fix ownership
  chown 0:0 -R $srcdir/zenbound2/
  mv $srcdir/zenbound2/{data_common,data_desktop,ZenBound2.bin,ZenBound2.png} $pkgdir/opt/$pkgname/

  sed "s|\\\$INSTALL_PATH\\\$|/opt/$pkgname|" $srcdir/zenbound2/ZenBound2.desktop.in > $pkgdir/usr/share/applications/$pkgname.desktop
  sed "s|\\\$INSTALL_PATH\\\$|/opt/$pkgname|" $srcdir/zenbound2/zenbound2.in > $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
  cp $pkgdir/usr/bin/$pkgname $pkgdir/opt/$pkgname
}
