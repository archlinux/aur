# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=fluxmod-styles
_pkgsuffix=pkg
pkgver=1
pkgrel=4
pkgdesc="All of the fluxbox styles from the deceased fluxmod.dk site"
arch=('any')
url="http://tenr.de/styles/"
license=('unknown')
depends=('fluxbox')
source=("http://tenr.de/styles/archives/${pkgname}-${_pkgsuffix}.tar.bz2" "License.txt.patch")
md5sums=('75140735ad4e014365a57b30be4c1911' '6aa4e452f125df8bef7a145627ce65ce')


build() {
    cd "$srcdir/$pkgname-$_pkgsuffix"
    rm "delfont.sh" # I have no idea what this file is for, so might as well delete it :P

    # patch the license.txt file to note the lack of licenses for the themes contained in
    # $srcdir/$pkgname-$_pkgsuffix
    patch "License.txt" "$srcdir/License.txt.patch"
    if [[ -d "green-with-stripes" ]]; then
	rm -R "green-with-stripes";
    fi
    rename "pr0n" "green-with-stripes" "pr0n" 


}

package() {
    
    # goto the $srcdir 
    cd "$srcdir/$pkgname-$_pkgsuffix"
    
    # install the, now patched, license file to /usr/share/license/$pkgname/
    install -m 644 -D "License.txt" "$pkgdir/usr/share/license/$pkgname/License.txt"

    for dirs in $(ls -l1 | sed '/^[^d]/d ; s:.*\s:: ; /Emerge/d')
    do
	# check for pixmaps 
	if [[ -d "${dirs}/pixmaps" ]]; then
	    for items in $(ls -1 "${dirs}/pixmaps" | sed '/png2xpm/d')
	    do
		install -m 644 -D "${dirs}/pixmaps/${items}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/pixmaps/${items}"
	    done
	fi

	# check for wallpapers and backgrounds
	if  [[ -d "${dirs}/wallpaper" ]]; then
	    for picts in $(ls "${dirs}/wallpaper")
	    do
		install -m 644 -D "${dirs}/wallpaper/${picts}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/wallpaper/${picts}"
	    done
		# checking for backgrounds. 
	elif [[ -d "${dirs}/bg" ]]; then
	    for bgs in $(ls "${dirs}/bg")
	    do
		install -m 644 -D "${dirs}/bg/${bgs}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/bg/${bgs}"
	    done
	fi

	# install what's left.  
	for files in $(ls -1 "${dirs}" | sed '/pixmaps/d ; /wallpaper/d ; /bg/d')
	do
	    install -m 644 -D "${dirs}/${files}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/${files}" 
	done
    done
}
