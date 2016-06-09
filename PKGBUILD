# Maintainer: mostlyharmless <mostlyharmlessgit@yahoo.com>
# needs multilib, user must be on sudoers
# Wacom tablet support enabled by default
# Advance features cannot be registered or activated under KVM/QEMU/OVMF
_wacomEnabled=yes
pkgname=hgsreceiver-bin
pkgver=7.2.3
pkgrel=1
pkgdesc="HP remote RGS receiver"
arch=('x86_64')
url="https://h30670.www3.hp.com/portal/swdepot/displayProductInfo.do?productNumber=RGS-LR"
license=('custom:"HP"')
depends=('libudev.so.0' 'lib32-glu')
makedepends=('')
options=('emptydirs')
source=("file://RGS_Linux_64_Receiver_v7.2.3_Z7550-01890.tar.gz")
md5sums=('f6b335e7ff929af51bfc7d840b56dd8d')

prepare() {
bsdtar xf lin64/receiver/*.rpm
}

package() {
cd "${srcdir}"

# install licence
install -m644 -D lin64/receiver/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# Security hole needed to register advance features 
# N.B. rgsmbiosreader does not work under KVM/QEMU/OVMF bios
chmod 6755 opt/hpremote/rgreceiver/rgsmbiosreader
chmod a+w etc/opt
chmod a+w etc/opt/hpremote
chmod a+w etc/opt/hpremote/*

# link to libraries included with program
install -d -m644 etc/ld.so.conf.d
echo opt/hpremote/rgreceiver/lib64 > etc/ld.so.conf.d/hpremote.conf

# Install WaCom tablet rules
if [[ $_wacomEnabled != "no" ]]
then
    install -d -m644 etc/udev/rules.d
    cp -u opt/hpremote/rgreceiver/rules/rgs-pen-tablet.rules etc/udev/rules.d/
fi

# copy the directories
cp -rp ./opt/ $pkgdir
cp -rp ./etc/ $pkgdir
cp -rp ./usr/ $pkgdir
cp -rp ./source/ $pkgdir

}

post-install() {

/sbin/ldconfig

}

