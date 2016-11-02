# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgbase=scaleio
pkgname=( 'scaleio-gui' 'scaleio-tb'
          'scaleio-sdc' 'scaleio-sds'
          'scaleio-mdm' 'scaleio-callhome' )
pkgver=2.0.0.2
pkgrel=3
pkgdesc="ScaleIO"
arch=('x86_64')
url="http://www.emc.com/storage/scaleio/"
license=('Custom')
depends=('libaio' 'numactl' 'mutt' 'bash-completion' 'python2')
makedepends=('unzip')
conflicts=()
options=('!strip' '!emptydirs')
source=("http://downloads.emc.com/emc-com/usa/ScaleIO/ScaleIO_Linux_v2.0.zip")

md5sums=('b681b39f46bcff125522d2c2b819b32f')

extract_deb(){
    ar xv $1
}

prepare() {
        cd $srcdir/ScaleIO_${pkgver}_Complete_Linux_SW_Download
        echo "Clean up"
        echo "Remove GPG-RPM-KEY"
        rm -rf ./ScaleIO_${pkgver}_GPG-RPM-KEY_Download
        echo "Remove RHEL stuff"
        rm -rf ./ScaleIO_${pkgver}_RHEL6_Download
        rm -rf ./ScaleIO_${pkgver}_RHEL7_Download
        echo "Remove XEN stuff"
        rm -rf ./ScaleIO_${pkgver}_XEN_6.5_Download
        echo "Remove SLES stuff"
        rm -rf ./ScaleIO_${pkgver}_SLES_11.3_Download
        rm -rf ./ScaleIO_${pkgver}_SLES_12.0_Download
        rm -rf ./ScaleIO_${pkgver}_SLES_12.1_Download
        echo "Remove OpenStack stuff"
        rm -rf ./ScaleIO_${pkgver}_OpenStack_Driver_Download
        echo "Remove Windows stuff"
        rm -rf ./ScaleIO_${pkgver}_Gateway_for_Windows_Download
        rm -rf ./ScaleIO_${pkgver}_GUI_for_Windows_Download
        echo "Remove PDFs"
        rm ./*.pdf
        echo "Remove Gateway for Linux"
        rm -rf ./ScaleIO_${pkgver}_Gateway_for_Linux_Download
        mv ./ScaleIO_${pkgver}_GUI_for_Linux_Download ./GUI
        mv ./ScaleIO_${pkgver}_UBUNTU_14.04_Download  ./U1404P
}

package_scaleio-gui()
{
        pkgdesc="ScaleIO GUI"
        depends=('java-runtime')
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/GUI
        rm EMC-ScaleIO-gui-2.0-7120.0.noarch.rpm
        extract_deb EMC-ScaleIO-gui-2.0-7120.0.deb
        rm EMC-ScaleIO-gui-2.0-7120.0.deb control.tar.gz debian-binary
        tar xf data.tar.gz
        mv opt ${pkgdir}/opt

        rm -rf ../scaleio-gui

        mkdir -p ${pkgdir}/usr/bin/
        echo '#!/bin/bash'                 >  ${pkgdir}/usr/bin/scaleio-gui
        echo '/opt/emc/scaleio/gui/run.sh' >> ${pkgdir}/usr/bin/scaleio-gui
        chmod +x ${pkgdir}/usr/bin/scaleio-gui

        mkdir -p ${pkgdir}/usr/share/icons/
        mkdir -p ${pkgdir}/usr/share/applications/
        [ -f ${srcdir}/../scaleio.png ] && install -Dm 644 ${srcdir}/../scaleio.png ${pkgdir}/usr/share/icons/scaleio.png
        echo "[Desktop Entry]"          >  ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Name=ScaleIO GUI           >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Comment=ScaleIO GUI client >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Exec=/usr/bin/scaleio-gui  >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Icon=scaleio               >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Terminal=false             >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo Type=Application           >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
        echo StartupNotify=true         >> ${pkgdir}/usr/share/applications/scaleio-gui.desktop
}

package_scaleio-gateway()
{
        pkgdesc="ScaleIO Gateway"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-gateway
        cd ./scaleio-gateway
        mv ../EMC-ScaleIO-gateway-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm

        for i in ../*csv; do
                mv $i ./opt/emc/scaleio/gateway/conf/
        done
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-gateway
}

package_scaleio-callhome()
{
        pkgdesc="ScaleIO callhome"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-callhome
        cd ./scaleio-callhome
        mv ../EMC-ScaleIO-callhome-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-callhome
}

package_scaleio-lia()
{
        pkgdesc="ScaleIO callhome"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-lia
        cd ./scaleio-lia
        mv ../EMC-ScaleIO-lia-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-lia
}

package_scaleio-tb()
{
        pkgdesc="ScaleIO tb"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-tb
        cd ./scaleio-tb
        mv ../EMC-ScaleIO-tb-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-tb
}

package_scaleio-sdc()
{
        pkgdesc="ScaleIO sdc"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-sdc
        cd ./scaleio-sdc
        mv ../EMC-ScaleIO-sdc-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
	mkdir ${pkgdir}/usr/
	mv ${pkgdir}/bin ${pkgdir}/usr/
	chmod -R 755 ${pkgdir}/
	mv ${pkgdir}/etc/init.d/scini ${pkgdir}/usr/bin/
	rm -rf ${pkgdir}/etc/init.d
        rm -rf ../scaleio-sdc
}

package_scaleio-sds()
{
        pkgdesc="ScaleIO sds"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-sds
        cd ./scaleio-sds
        mv ../EMC-ScaleIO-sds-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-sds
}

package_scaleio-mdm()
{
        pkgdesc="ScaleIO mdm"
        depends=()
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}
        mkdir -p scaleio-mdm
        cd ./scaleio-mdm
        mv ../EMC-ScaleIO-mdm-*.rpm ./
        rpmextract.sh ./*rpm
        rm ./*rpm
        rsync -a ./ ${pkgdir}/
        rm -rf ../scaleio-mdm
}
