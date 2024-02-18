# Maintainer: mostlyharmless <mostlyharmlessgit@yahoo.com>
# needs multilib, user must be on sudoers
# Legacy Wacom tablet support disabled by default
# Advance features cannot be registered or activated under KVM/QEMU/OVMF
_legacyWacomEnabled=no
pkgname=zcentral_rb-bin
pkgver=2020
pkgrel=1
pkgdesc="ZCentral-Remote Boost"
arch=('x86_64')
url="https://www8.hp.com/us/en/workstations/zcentral-remote-boost.html?jumpid=ex_r11260_go_rgs#section=resources"
license=('custom:"HP"')
depends=('lib32-glu' 'dmidecode')
conflicts=('hgsreceiver-bin')
#makedepends=('')
options=('emptydirs')
noextract=()

source=("file://ZCentral_RB_22.1_Linux_Receiver_M39127-009.tar.gz")
md5sums=('21c0d1f76e2ba732269e64c666400a51')

prepare() {
bsdtar xf ZCentral_RB_22.1_Linux_Receiver_M39127-009.tar.gz
bsdtar xf ubuntu/receiver/*.tar.gz
bsdtar xf ./*.deb
}

package() {

bsdtar xf data.tar.xz 
cd "${srcdir}"

# install licence
install -m644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

chmod 6755 opt/hpremote/rgreceiver/rgsmbiosreader
chmod a+w etc/opt
chmod a+w etc/opt/hpremote
chmod a+w etc/opt/hpremote/*

# link to libraries included with program
install -d -m644 etc/ld.so.conf.d
echo opt/hpremote/rgreceiver/lib64 > etc/ld.so.conf.d/hpremote.conf

# Do not install legacy WaCom tablet rules
if [ "$_legacyWacomEnabled" = "yes" ]; then
    install -d -m644 etc/udev/rules.d
    cp -uf opt/hpremote/rgreceiver/rules/rgs-pen-tablet.rules etc/udev/rules.d/
else
    if [ -f etc/udev/rules.d/rgs-pen-tablet.rules ]; then
        rm -f etc/udev/rules.d/rgs-pen-tablet.rules
    fi
fi

rm -rf ./usr/sbin

# copy the directories
cp -fpr ./opt/ $pkgdir
cp -fpr ./etc/ $pkgdir
cp -urf ./usr/ $pkgdir
cp -fpr ./source/ $pkgdir

}

post-install() {

# hack needed to register advance features 
# N.B. rgsmbiosreader does not work under KVM/QEMU/OVMF bios, nor kernel greater than 4.4.44

# next few lines replace rgsmbioreader
if [ -f ./opt/hpremote/registration ] ; then
echo ./opt/hpremote/registration
 else
  mkdir ./opt/hpremote/registration
fi
dmidecode -t 1 | grep UUID | tr A-z a-z | tr -d - | cut -c8-80 > opt/hpremote/registration/H264
mv opt/hpremote/rgreceiver/rgsmbiosreader opt/hpremote/rgreceiver/rgsmbiosreader.old
echo '#!/bin/sh' > opt/hpremote/rgreceiver/rgsmbiosreader
echo 'cat /opt/hpremote/registration/H264' >> opt/hpremote/rgreceiver/rgsmbiosreader

/sbin/ldconfig
ln -s /opt/hpremote/rgreceiver/receiverconfigapp.sh /usr/sbin/rgreceiverconfig

}

