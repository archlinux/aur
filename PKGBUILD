# Maintainer: Ray Chung <ray20020809@gmail.com>
pkgname=thinkpad-gen7-led-switch
pkgver=0.100
pkgrel=1
pkgdesc="A script to switch Thinkpad logo led."
arch=(i686 x86_64)
url="SKIP"
license=('GPL')
depends=('bash')
makedepends=()
# source=('')
# md5sums=('SKIP')
build() {
    cd $startdir
    # ls -la
    cat << EOF > src/led
#!/bin/bash    
if [ "\$#" -ne 1 ] ; then
echo "usage:"
echo "	\$0 <on|off>"
exit
fi
sudo modprobe ec_sys write_support=1
if [[ \$1 == 'on' ]]; then 
    echo -n -e "\x8a" | sudo dd of="/sys/kernel/debug/ec/ec0/io" bs=1 seek=12 count=1 conv=notrunc 2> /dev/null && echo "Led has been turned on!"
else
    echo -n -e "\x0a" | sudo dd of="/sys/kernel/debug/ec/ec0/io" bs=1 seek=12 count=1 conv=notrunc 2> /dev/null && echo "Led has been turned off!"
fi
EOF

}

package() {
    mkdir -p "$pkgdir/usr/bin" 
    cp $startdir/src/led $pkgdir/usr/bin/led
    chmod +x $pkgdir/usr/bin/led
}
