# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade2
pkgver=2.0.99
pkgrel=1
pkgdesc='The best way to play your favorite retro games with or against any other player in the world.'
url='https://www.fightcade.com/'
arch=('any')
license=('custom')
depends=(rsync wine lib32-mpg123)
makedepends=(gendesk)
source=("$pkgname-$pkgver.tar.gz::https://web.fightcade.com/download/Fightcade-linux-latest.tar.gz")
md5sums=('SKIP')
_romsPkgname="$pkgname-roms"

createShellFiles() {
	cat << 'EOF' > $srcdir/Fightcade/start.sh
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

if [ ! -f "$fightcadeUserFolderPath/Fightcade2.sh" ] || [ "$hasNewVersion" -eq "1" ] 
then
    mkdir -p "$fightcadeUserFolderPath"
    rsync -r --copy-links $fightcadeInstallFolder/* $fightcadeUserFolderPath
fi

sh "$fightcadeUserFolderPath/Fightcade2.sh"
EOF
}

prepare() {
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Fightcade 2" --exec "/opt/$pkgname/start.sh"
	gendesk -n -f --pkgname "$_romsPkgname" --name "Fightcade 2 ROMs Folder" --exec "/opt/$pkgname/start.sh roms"
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
	chmod +x $pkgdir/opt/$pkgname/start.sh
}
