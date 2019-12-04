# Maintainer: mostlyharmless <mostlyharmlessgit@yahoo.com>
# needs multilib, user must be on sudoers
# Wacom tablet support enabled by default
# Advance features cannot be registered or activated under KVM/QEMU/OVMF
_wacomEnabled=yes
pkgname=hgsreceiver-bin
pkgver=7.7
pkgrel=1
pkgdesc="HP remote RGS receiver"
arch=('x86_64')
url="https://h30670.www3.hp.com/portal/swdepot/displayProductInfo.do?productNumber=RGS-LR"
license=('custom:"HP"')
depends=('lib32-glu' 'dmidecode')
#makedepends=('')
options=('emptydirs')
noextract=()
source=("file://RGS_Linux_64_Sender_and_Receiver_v7.7_L64934-001.tar.gz")
md5sums=('3bb5751a61424f2fff3d5e43a1578eb8')

prepare() {
bsdtar xf RGS_Linux_64_Sender_and_Receiver_v7.7_L64934-001.tar.gz
bsdtar xf rhel6/receiver/*.rpm
}

package() {
cd "${srcdir}"

# install licence
install -m644 -D rhel6/receiver/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# hack needed to register advance features 
# N.B. rgsmbiosreader does not work under KVM/QEMU/OVMF bios, nor kernel greater than 4.4.44
# next 4 lines replace rgsmbioreader
mkdir opt/hpremote/registration
sudo dmidecode -t 1 | grep UUID | tr A-z a-z | tr -d - | cut -c8-80 > opt/hpremote/registration/H264
mv opt/hpremote/rgreceiver/rgsmbiosreader opt/hpremote/rgreceiver/rgsmbiosreader.old
echo '#!/bin/sh' > opt/hpremote/rgreceiver/rgsmbiosreader
echo 'cat /opt/hpremote/registration/H264' >> opt/hpremote/rgreceiver/rgsmbiosreader

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
    cp -uf opt/hpremote/rgreceiver/rules/rgs-pen-tablet.rules etc/udev/rules.d/
fi

# copy the directories
cp -rpf ./opt/ $pkgdir
cp -rpf ./etc/ $pkgdir
cp -rpf ./usr/ $pkgdir
cp -rpf ./source/ $pkgdir

}

post-install() {

/sbin/ldconfig

}

