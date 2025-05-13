
# Maintainer: Alexandru Iercosan-Lucaci <lucaci32u4@gmail.com>

#
# $ makepkg -si
#
# Set DUNGEONDRAFT_DOWNLOAD_URL with the download url provided by
# the Humble Bundle purchase page and the nrun makepkg.
#
# It will work with all current versions of Dungeondraft.
# The version string is detected dinamically when run.
#


pkgname=dungeondraft
pkgrel=2

pkgdesc='Dungeondraft is a tabletop encounter map creation tool designed to draw aesthetic maps without the typical frustrations and time investment'

arch=('x86_64')
url='https://dungeondraft.net'
license=('custom:TailwindGamesLicense')

depends=('mono' 'zenity')
makedepends=('unzip')


red_color='\033[0;31m'
yellow_color='\033[0;33m'
bold_font='\033[1m'
no_color='\033[0m'

if [[ -z $DUNGEONDRAFT_DOWNLOAD_URL ]]; then
   echo -e "${red_color}${bold_font}==> ERROR:${no_color}${bold_font} You need to set DUNGEONDRAFT_DOWNLOAD_URL to install Dungeondraft!"
   echo ""
   echo "To get the download URL go to your Humble Bundle purchases https://www.humblebundle.com/home/purchases, select Dungeondraft and then copy the link from the \"Manual Install\" button under the Linux section."
   echo "Afterwards execute \"export DUNGEONDRAFT_DOWNLOAD_URL=<the url you copied>\"."
   exit 12
fi

if [[ ! $DUNGEONDRAFT_DOWNLOAD_URL =~ ^https://cdn.humble.com/humblebundle/tailwindgamesllc_ChunI/Dungeondraft.* ]]; then
    echo -e "${red_color}${bold_font}==> ERROR:${no_color}${bold_font} DUNGEONDRAFT_DOWNLOAD_URL seems to be invalid! Your download link has to start with \"https://cdn.humble.com/humblebundle/tailwindgamesllc_ChunI/Dungeondraft*\"."
   exit 12
fi

source=("$DUNGEONDRAFT_DOWNLOAD_URL")
pkgver="$(echo "$DUNGEONDRAFT_DOWNLOAD_URL" | grep -oE '[0-9]+(\.[0-9]+)*' | head -n 1)"
if [[ "$pkgver" == "1.1.0.6" ]]; then
	md5sums=('11c548c3c9ad238a0e96fef11d64b26f')
elif [[ "$pkgver" == "1.1.1.1" ]]; then
	md5sums=('373c52a353b3f17412d766070cb28816')
elif [[ "$pkgver" == "1.0.3.2" ]]; then
	md5sums=('3f6ceb8096fca8fd48fb6f1438b21236')
else
	echo -e "${yellow_color}${bold_font}==> WARNING:${no_color}${bold_font} No md5sum for v$pkgver found, cannot validate your download!"
	md5sums=('SKIP')
fi

package() {
	local destdir="$pkgdir/opt/Dungeondraft"
	mkdir -p "$destdir"
	mv "data_Dungeondraft" "$destdir"
	mv "Dungeondraft.pck" "$destdir"
	mv "Dungeondraft.png" "$destdir"
	mv "Dungeondraft.x86_64" "$destdir"
	chmod a+x "$destdir/Dungeondraft.x86_64"
	mv "EULA.txt" "$destdir"
	mv "example_template.zip" "$destdir"
	mkdir -p "$pkgdir/usr/share/applications"
	mv "Dungeondraft.desktop" "$pkgdir/usr/share/applications"
}


