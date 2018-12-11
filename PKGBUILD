# Maintainer: Zsolt Donca <dnczsolt@gmail.com>
# Contributor (from 1.0.2): Viliam Ganz <viliam.ganz@gmail.com>

pkgname=kafkatool2
pkgver=2.0.3
pkgrel=1
epoch=
pkgdesc="The Ultimate Kafka UI Tool, version 2"
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
source=("http://www.kafkatool.com/download2/kafkatool.sh")
noextract=("kafkatool.sh")
md5sums=('932db885b3e5dfee351d14fe29baa928')
validpgpkeys=()

package() {
        install -dm 755 "$pkgdir/opt/kafkatool2"
        install -dm 755 "$pkgdir/usr/bin"
        echo -e "#!/bin/bash\n/bin/bash -c \"DISPLAY='' $srcdir/kafkatool.sh\"" > $srcdir/install.sh
        chmod +x $srcdir/install.sh
        chmod +x $srcdir/kafkatool.sh

        EXPECT="#!/usr/bin/expect -f


set timeout -1
exp_internal 1
spawn $srcdir/install.sh
match_max 100000
expect \"This will install Kafka Tool 2 on your computer.\r\n\"
expect \"\[OK (o)\]*\[Cancel\]*\"
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

expect \"Where should Kafka Tool 2 be installed?*\]\r\"
send -- \"$pkgdir/opt/kafkatool2\r\"
expect \"already exists. Would you like to install to that directory anyway?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"y\r\"
expect \"Create symlinks?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"n\r\"
expect eof
"

    echo "$EXPECT" | /bin/expect
    sed -i -- "s~$pkgdir~~g" $pkgdir/opt/kafkatool2/.install4j/*
    ln -s /opt/kafkatool2/kafkatool $pkgdir/usr/bin/kafkatool2

    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/opt/kafkatool2/.install4j/kafkatool.png" "$pkgdir/usr/share/pixmaps/kafkatool2.png"
}
