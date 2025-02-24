# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="bgmapeditor-git"
pkgver=r12.eef915f
pkgrel=1
pkgdesc="Mapeditor for boardgames. Used for Zombicide, Sedition Wars, and others"
url="https://github.com/nmzi/bgmapeditor"
license=("GPL-3.0")
arch=("any")
depends=("perl-tk" "perl-archive-zip" "perl-template-gd" "perl-switch")
source=("git+$url" "bgmapeditor.desktop")
b2sums=('SKIP'
        '9ae3155a9eafbad2d6b54cb712869310329d110e788e180fc9b8a8a90f91cc3880178862191a654b03f8aab43472a12dc90f45b7ecf6bada51e50c1e7266f61b')
backup=("etc/bgmapeditor.cfg")

pkgver(){
 cd "bgmapeditor"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
 cd "bgmapeditor"
 # create missing directory
 install -d -m 0755 "$pkgdir/usr/share/bgmapeditor" "$pkgdir/usr/bin" "$pkgdir/etc"

 # copy program files
 cp -r "trunk/"* "$pkgdir/usr/share/bgmapeditor"

 # remove windows-only files
 find "$pkgdir/usr/share/bgmapeditor" -type f \( -name "*.dll" -o -name "*.exe" -o -name "*.bat" \) -exec rm {} \;

 # link executable
 chmod 0755 "$pkgdir/usr/share/bgmapeditor/bgmapeditor.pl"
 ln -s "/usr/share/bgmapeditor/bgmapeditor.pl" "$pkgdir/usr/bin/bgmapeditor"

 # link configuration
 mv "$pkgdir/usr/share/bgmapeditor/bgmapeditor.cfg" "$pkgdir/etc/bgmapeditor.cfg"
 ln -s "/etc/bgmapeditor.cfg" "$pkgdir/usr/share/bgmapeditor/bgmapeditor.cfg"

 # link temp dir
 ln -s "/tmp" "$pkgdir/usr/share/bgmapeditor/tmp"

 # copy desktop entry files
 install -D -m 644 "$srcdir/bgmapeditor.desktop" "$pkgdir/usr/share/applications/bgmapeditor.desktop"
 install -D -m 644 "$pkgdir/usr/share/bgmapeditor/exemples/sample1.png" "$pkgdir/usr/share/pixmaps/bgmapeditor.png"
}
