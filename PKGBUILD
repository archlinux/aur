# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade2
pkgver=2.1.35
pkgrel=1
pkgdesc='The best way to play your favorite retro games with or against any other player in the world.'
url='https://www.fightcade.com/'
arch=('any')
license=('custom')
depends=(rsync wine wine-mono lib32-mpg123 lib32-libxss lib32-libcurl-gnutls libcurl-gnutls libzip miniupnpc)
makedepends=(gendesk)
source=("$pkgname-$pkgver.tar.gz::https://web.fightcade.com/download/Fightcade-linux-latest.tar.gz")
md5sums=('SKIP')
_romsPkgname="$pkgname-roms"

createShellFiles() {
	cat << 'EOF' > $srcdir/Fightcade/Fightcade2.sh
#!/bin/bash

fightcadeUserFolderName="fightcade2"
fightcadeInstallFolder="/opt/$fightcadeUserFolderName"
fightcadeUserFolderPath="$HOME/.$fightcadeUserFolderName"
fightcadeRomsPath="$fightcadeUserFolderPath/ROMs"
oldVersionTxt="$fightcadeUserFolderPath/VERSION.txt"
newVersionTxt="$fightcadeInstallFolder/VERSION.txt"
oldVersion=0
newVersion=0

function compareVersion () {
    #1: requiredver
    #2: currentver
    if [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" = "$1" ]; then 
        return 0
    else
        return 1
    fi
}

if [ -f "$oldVersionTxt" ] 
then
    oldVersion=`cat $fightcadeUserFolderPath/VERSION.txt`
fi

if [ -f "$newVersionTxt" ] 
then
    newVersion=`cat $fightcadeInstallFolder/VERSION.txt`
fi

if [ "$1" = "roms" ]; then
	xdg-open "$fightcadeRomsPath"
	exit 1
fi

compareVersion "$newVersion" "$oldVersion"
hasNewVersion=$?
echo "$oldVersion -> $newVersion"

if [ ! -f "$fightcadeUserFolderPath/Fightcade2.sh" ] || [ "$hasNewVersion" -eq "1" ] 
then
    echo "New version: $newVersion"
    notify-send "Fightcade" "Updating new version $newVersion... please wait"
    mkdir -p "$fightcadeUserFolderPath"
    rsync -r --copy-links $fightcadeInstallFolder/* $fightcadeUserFolderPath
	notify-send "Fightcade" "Update finished!"
fi

sh "$fightcadeUserFolderPath/_Fightcade2.sh"
EOF
}

prepare() {
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Fightcade" --exec "/opt/$pkgname/Fightcade2.sh"
	gendesk -n -f --pkgname "$_romsPkgname" --name "Fightcade ROMs Folder" --exec "/opt/$pkgname/Fightcade2.sh roms"
	mv "$srcdir/Fightcade/Fightcade2.sh" "$srcdir/Fightcade/_Fightcade2.sh"
	createShellFiles
}

package() {
	install -dm755 $HOME/.$pkgname/
	install -dm755 $pkgdir/opt/
	install -Dm644 "$srcdir/Fightcade/fc2-electron/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$_romsPkgname.desktop" "$pkgdir/usr/share/applications/$_romsPkgname.desktop"
	msg "Copying files..."
	rsync -r -I --copy-links $srcdir/Fightcade/* $pkgdir/opt/$pkgname/
	chmod +x $pkgdir/opt/$pkgname/Fightcade2.sh
	chmod +x $pkgdir/opt/$pkgname/_Fightcade2.sh
}
