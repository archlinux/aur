# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgbase=scaleio
# Not ready 'scaleio-sdc' 'scaleio-sds'  'scaleio-callhome'
pkgname=( 'scaleio-gui' 'scaleio-mdm' )
pkgver=2.0.0.2
pkgrel=8
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

extract_deb(){ ar xv "$1"; }

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
        rm ./GUI/EMC-ScaleIO-gui-2.0-7120.0.noarch.rpm

        mv ./ScaleIO_${pkgver}_UBUNTU_14.04_Download  ./U1404P
        cd ./U1404P
        for file in ./*.tar; do
            tar xf $file
            rm $file
        done
        rm ./*.sig
        for file in ./*.siob; do
            ./siob_extract $file
        done
        rm ./siob_extract
        rm ./*.siob
}

package_scaleio-gui()
{
        pkgdesc="ScaleIO GUI"
        depends=('java-runtime')
        provides=()
        conflicts=()
        options=('!emptydirs' '!strip')

        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/GUI
        extract_deb EMC-ScaleIO-gui-2.0-7120.0.deb
        rm EMC-ScaleIO-gui-2.0-7120.0.deb control.tar.gz debian-binary
        tar xf data.tar.gz
        mv opt ${pkgdir}/opt

        mkdir -p ${pkgdir}/usr/bin/

        {
            echo '#!/bin/bash'
            echo '/opt/emc/scaleio/gui/run.sh'
        } >  ${pkgdir}/usr/bin/scaleio-gui
        chmod +x ${pkgdir}/usr/bin/scaleio-gui

        mkdir -p ${pkgdir}/usr/share/icons/
        [ -f ${srcdir}/../scaleio.png ] && install -Dm 644 ${srcdir}/../scaleio.png ${pkgdir}/usr/share/icons/scaleio.png

        mkdir -p ${pkgdir}/usr/share/applications/
        {
            echo "[Desktop Entry]"
            echo Name=ScaleIO GUI
            echo Comment=ScaleIO GUI client
            echo Exec=/usr/bin/scaleio-gui
            echo Icon=scaleio
            echo Terminal=false
            echo Type=Application
            echo StartupNotify=true
        } >  ${pkgdir}/usr/share/applications/scaleio-gui.desktop
}

package_scaleio-mdm()
{
        pkgdesc="ScaleIO mdm"
        depends=()
        provides=()
        conflicts=()
        install=scaleio-mdm.install
        options=('!emptydirs' '!strip')

        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/
        mkdir -p MDM
        mv ./U1404P/EMC-ScaleIO-mdm-2.0-7120.0.Ubuntu.14.04.x86_64.deb ./MDM
        cd ./MDM
        extract_deb EMC-ScaleIO-mdm-2.0-7120.0.Ubuntu.14.04.x86_64.deb
        rm EMC-ScaleIO-mdm-2.0-7120.0.Ubuntu.14.04.x86_64.deb debian-binary control.tar.gz
        tar xf data.tar.xz
        mv opt ${pkgdir}/opt

        mkdir -p ${pkgdir}/usr/bin/
        {
            echo '#!/bin/bash'
            echo /opt/emc/scaleio/mdm/bin/cli '"$@"'
        } > ${pkgdir}/usr/bin/scli
        chmod +x ${pkgdir}/usr/bin/scli

        mkdir -p ${pkgdir}/usr/share/bash-completion/completions/
        cp ${pkgdir}/opt/emc/scaleio/mdm/bin/cli_autocompletion ${pkgdir}/usr/share/bash-completion/completions/

        mkdir -p ${pkgdir}/usr/lib/systemd/system/
        # mdm.service
        {
            echo "[Unit]"
            echo  Description=ScaleIO MDM
            echo  After=local-fs.target

            echo "[Service]"
            echo ExecStart=/opt/emc/scaleio/mdm/bin/run_bin.sh
            echo OOMScoreAdjust=-999
            echo Restart=always
            echo CPUAccounting=true
            echo MemoryAccounting=true
            echo ProtectHome=true

            echo "[Install]"
            echo WantedBy=local-fs.target
        } > ${pkgdir}/usr/lib/systemd/system/mdm.service
}

#package_scaleio-callhome()
#{
#        pkgdesc="ScaleIO callhome"
#        depends=()
#        provides=()
#        conflicts=()
#        options=('!emptydirs' '!strip')
#
#        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/
#}

#package_scaleio-sdc()
#{
#        pkgdesc="ScaleIO sdc"
#        depends=()
#        provides=()
#        conflicts=()
#        options=('!emptydirs' '!strip')
#
#        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/
#}

#package_scaleio-sds()
#{
#        pkgdesc="ScaleIO sds"
#        depends=()
#        provides=()
#        conflicts=()
#        options=('!emptydirs' '!strip')
#
#        cd ${srcdir}/ScaleIO_${pkgver}_Complete_Linux_SW_Download/
#}
