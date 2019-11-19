# Maintainer: Viliam Ganz <viliam.ganz@gmail.com>
pkgname=kafkatool
pkgver=1.0.3
pkgrel=2
epoch=
pkgdesc="The Ultimate Kafka UI Tool"
arch=("x86_64")
url="http://www.kafkatool.com"
license=('custom')
groups=()
depends=('java-runtime')
makedepends=('expect' 'gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.kafkatool.com/download/kafkatool.sh")
noextract=("kafkatool.sh")
md5sums=('0ede2d514fe9959223cbd7c8791bb705')
validpgpkeys=()

package() {
        install -dm 755 "$pkgdir/opt/kafkatool"
        install -dm 755 "$pkgdir/usr/bin"
        echo -e "#!/bin/bash\n/bin/bash -c \"DISPLAY='' $srcdir/kafkatool.sh\"" > $srcdir/install.sh
        chmod +x $srcdir/install.sh
        chmod +x $srcdir/kafkatool.sh
        
        EXPECT="#!/usr/bin/expect -f


set timeout -1
exp_internal 1
spawn $srcdir/install.sh
match_max 100000
expect \"Starting Installer ...\r\n\"
expect \"\[Ok (o)\]*\[Cancel\]*\"
send -- \"o\r\"

#expect \"A previous installation has been detected. Do you wish to update that installation?\"
#expect \"Yes, update the existing installation \[1, Enter\]\r\"
#expect \"No, install into a different directory \[2\]\r\"

#send -- \"2\r\"

expect {
    \"I accept the agreement\" {
      expect \"Yes*\[1]*No*\[2\]\"
      send \"1\r\"
    }
    \"\[Enter\]\r\" {
      send \"\r\"
      exp_continue
    }
    default  { exit 1 }
  }  

expect \"Where should Kafka Tool be installed?*\]\r\"
send -- \"$pkgdir/opt/kafkatool\r\"
expect \"already exists. Would you like to install to that directory anyway?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"y\r\"
expect \"Create symlinks?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"n\r\"
expect eof
"

    echo "$EXPECT" | /bin/expect
    sed -i -- "s~$pkgdir~~g" $pkgdir/opt/kafkatool/.install4j/*
    ln -s /opt/kafkatool/kafkatool $pkgdir/usr/bin/kafkatool
    
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/opt/kafkatool/.install4j/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
