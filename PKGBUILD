# Maintainer: zayatura <zayatura@mailbox.org>
# Contributor: invade_r

pkgname=offsetexplorer
pkgver=3.0.3
pkgrel=1
epoch=
pkgdesc="The Ultimate UI Tool for Kafka"
arch=("x86_64")
url="http://www.kafkatool.com"
license=('custom')
groups=()
depends=('java-runtime=11')
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
source=("https://www.kafkatool.com/download3/offsetexplorer.sh" "set-envs.sh")
noextract=("offsetexplorer.sh")
sha256sums=(
  '62a8f6f9dd54a0f433bc0317c6638bc69616c26d3b4caf54858e3eb8448b9c5b' # offsetexplorer.sh
  '65589eea4f00bbbf17bad0e6f69cb56461bac06de1c5e55af24a284d70213430' # set-envs.sh
)
validpgpkeys=()

package() {
  install -dm 755 "$pkgdir/opt/offsetexplorer"
  install -dm 755 "$pkgdir/usr/bin"
  echo -e "#!/bin/bash\n/bin/bash -c \"DISPLAY='' $srcdir/offsetexplorer.sh\"" >$srcdir/install.sh
  chmod +x $srcdir/install.sh
  chmod +x $srcdir/offsetexplorer.sh
  chmod +x $srcdir/set-envs.sh

  EXPECT="#!/usr/bin/expect -f


set timeout -1
exp_internal 1
spawn $srcdir/install.sh
match_max 100000
expect \"This will install Offset Explorer 3 on your computer.\r\n\"
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

expect \"Where should Offset Explorer 3 be installed?*\]\r\"
send -- \"$pkgdir/opt/offsetexplorer\r\"
expect \"already exists. Would you like to install to that directory anyway?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"y\r\"
expect \"Create symlinks?\"
expect \"Yes*\[y, Enter\]*No*\[n\]\"
send -- \"n\r\"
expect eof
"

  echo "$EXPECT" | /bin/expect

  sed -i -E 's_#!/bin/sh_#!/bin/sh\n\nsource /opt/offsetexplorer/set-envs.sh_' $pkgdir/opt/offsetexplorer/offsetexplorer

  cp $srcdir/set-envs.sh $pkgdir/opt/offsetexplorer/set-envs.sh

  ln -s /opt/offsetexplorer/offsetexplorer $pkgdir/usr/bin/offsetexplorer

  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgdir/opt/offsetexplorer/.install4j/offsetexplorer.png" "$pkgdir/usr/share/pixmaps/offsetexplorer.png"
}
