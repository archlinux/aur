# Maintainer: Sigurd Sætherø Spangelo <sigurd punktum spangelo ætt gmail dot com>
# Original submitter: Haonan Chen <g897331845@gmail.com>

# You need to provide the online installer manually from https://www.comsol.com/product-download and your license file. Place them in this directory together with this PKGBUILD.
# This PKGBUILD runs the installer inside a container, and then extracts the needed files, allowing for a clean system install without the need for root priveleges during installation.
# Note: you may need to use a corporate VPN for your license to be valid. Failing to do so can result in an error during installation such as 'FlexNet Licensing error:-15,570.  System Error: 115 "Operation now in progress"'.
# The build step uses excessive amount of memory, so you may not want to use /tmp as $BUILDDIR for this package. You can easily run out of memory if you do. I know 32 GB of RAM is not enough to install from tmpfs. You set $BUILDDIR to somewhere on your disk.

# Alternate instructions for creating a tarball manually (if all else fails) courtesy of Haionan Chen:
# 1.    Create a clean archlinux root with necessary packages
#           sudo mkdir -p /root/chroot/lowwer
#           sudo pacstrap /root/chroot/lowwer base base-devel vim xorg
#       also remember to enable necessary locales and install some fonts
#       (otherwise non-English letters will not show properly)
#       after that, copy comsol iso and license file into /root/chroot/lowwer
# 2.    create overlayfs 
#           sudo mkdir -p /root/chroot/upper
#           sudo mkdir -p /root/chroot/work
#           sudo mkdir -p /root/chroot/overlay
#           sudo mount -t overlay overlay -o upperdir=/root/chroot/upper,lowerdir=/root/chroot/lowwer,workdir=/root/chroot/work overlay
# 3.    jump into chroot with GUI application support
#           xhost +local:
#           sudo arch-chroot /root/chroot/overlay
#           export $DISPLAY=:0
# 4.    install comsol normally. not to install to /opt/comsol56/multiphysics and check "install desktop entry"
# 5.    exit and create tarball
#           sudo umount /root/chroot/overlay
#           sudo -i
#           cd /root/chroot/upper
#           tar -cpf - opt usr | xz -T0 -c - > comsol-multiphysics.tar.xz
# 6.    that's all. just delete junk file to release disk space.

pkgname=comsol-multiphysics
_installername=COMSOL64_lnx
pkgver=6.4.0.293
_pkgver_major=6.4
pkgrel=2
pkgdesc='A general-purpose simulation software for modeling designs, devices, and processes in all fields of engineering, manufacturing, and scientific research'
arch=('x86_64')
url='https://www.comsol.com/comsol-multiphysics'
license=('LicenseRef-Comsol')
depends=(base base-devel)
optdepends=(
    'matlab: LiveLink™ for MATLAB®'
    'tcsh: Required for interoperability with MATLAB®'
    'cuda: NVIDIA CUDA® Toolkit'
)
makedepends=(
    'podman' # For rootless containerized installation pre-packaging
    'coreutils'
    'grep'
    'bash'
    'man-pages' # For readlink
)
source=(
    # Download URL is https://nonusdownload.comsol.com/product/$pkgver/full/$_installername.zip?__gda__=$_gda&fileExt=.zip but $_gda changes dynamically. Automatic download not possible.
    "file://$_installername.zip" # Go to www.comsol.com, login and activate your license, then download the online installer for Linux from https://www.comsol.com/product-download manually. Place the zip in this directory together with this PKGBUILD
    "file://LICENSE"
)
sha256sums=(
    f4da49ce99f6351dd96df856894755f334d499cd02588bee9b005ba3437f6a04
    55a674c9c763b04fa313cda80998c4fbaf923b3166b2c91d242b0d3a4ae1843c
)
#OPTIONS=(!strip docs libtool staticlibs)
_installdir='/opt/comsol/multiphysics'

# Change this to '1' instead of '0' when you have read and accepted the 
# terms of the COMSOL AB Software License Agreement
# (see https://www.comsol.com/sla).
_license_agree=0
# License file or port@host or passcode
_license=

function _hostof
{
    echo "$1:$(ping $1 -c 1 -q 2>&1 | grep -Po "(\d{1,3}\.){3}\d{1,3}")"
}

prepare()
{
    cd "${srcdir}"

    #license agreement
    local _license_agreement="LICENSE"
    local _read=0
    while [[ $_license_agree != 1 ]]; do
        if [ "${_read}" = "1" ]; then
            less -E "${_license_agreement}"
            _read=0
        fi

        echo  "Do you accept the license agreement? ([y]es to agree, q to quit, r to read)"
        read -r ans
        case $(echo $ans | tr '[A-Z]' '[a-z]') in
            [Yy]|yes|yeS|yEs|yES|Yes|YeS|YEs|YES ) 
                _license_agree=1
            ;;
            [Qq] ) exit 1;;
            [Rr] ) _read=1;;
            * ) ;;
        esac
    done

    _vpn_interface=$(ip addr show | grep -o 'tun[0-9]*' | head -1)
    if [[ -n "$_vpn_interface" ]]; then
        echo "Warning: you may need to connect to a corporate VPN in order to activate your product license."
    fi

    while true; do
        if [[ "$_license" == "" ]]; then
            cat << EOF
COMSOL Multiphysics is commercially licensed software. Please enter one of the following:
     - passcode
         (example: license = FFFFFFFFFFFFFFFFF-CUSV-123456-1234567-123456789), or
     - license file path
         (example: license = ${HOME}/license.dat), or
     - port@host
         (example: license = 1718@mylicserver), or
     - three-server redundancy
         (example: license = 1718@licsvr1 1718@licsvr2 1718@licsvr3)
Press enter for default (1718@localhost), q to quit.
EOF
            read -e ans
        else
            ans=$_license
        fi

        if [ -z "${ans}" ]; then
            ans=1718@localhost
        fi
        if [ "${ans}" = q ]; then
            exit 1        
        else
            local _is_port_at_host=$(echo $ans | grep -c @)
            if [ "${_is_port_at_host}" != "0" ]; then
                _license_file='/dev/null'
                _license="${ans}"
                _license_mnt='/root/none'
                _license_server="$(echo "$_license" | awk -F '@' '{print $2}')"
                break
            elif [ -e "${ans}" ]; then
                _license_file="$(readlink -m "${ans}")"
                _license='/root/COMSOL_LICENSE.dat'
                _license_mnt="$_license"
                _license_server="$(cat "$_license_file" | grep -e ^SERVER | awk '{print $2}')"
                break
            elif [[ "$ans" == ?????????????????-????-??????-???????-????????? ]]; then
                _license_file='/dev/null'
                _license="${ans}"
                _license_mnt='/root/none'
                _license_server='comsol.com' # This could be wrong. It has not been tested. Just a guess.
            else
                _license=
                echo "$ans does not exist."
            fi
        fi
    done

    # Prepare setupconfig.ini
    sed -i "s/agree =.*\$/agree = 1/g" "$_installername/setupconfig.ini"
    sed -i "s@installdir =.*\$@installdir = $_installdir@g" "$_installername/setupconfig.ini"
    sed -i "s/showgui =.*\$/showgui = 0/g" "$_installername/setupconfig.ini"
    sed -i "s/autofinish =.*\$/autofinish = always/g" "$_installername/setupconfig.ini"
    sed -i "s#license =.*\$#license = $_license#g" "$_installername/setupconfig.ini"

    _tcsh=
    if command -v csh; then
        _tcsh='tcsh'
    fi

    # Prepare dockerfile
    cat > "Dockerfile" << EOF
FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm base base-devel unzip $_tcsh
RUN chmod +x /root/comsol/setup
RUN /root/comsol/setup -s /root/comsol/setupconfig.ini
EOF

    mkdir -p install
    mkdir -p applications
}

build()
{
    cd "${srcdir}"
  
    if test -f log.txt \
        && grep -q 'Installation complete' log.txt \
        && grep -q '0 ERRORS' log.txt \
        && grep -q '0 FATAL ERRORS' log.txt \
    ; then
        echo "Already built"
    else
        echo "" > log.txt

        podman rmi --ignore localhost/install_comsol:latest

        echo 'Building inside rootless container'
        podman build \
            --network=host \
            --device=/dev/net/tun \
            --add-host=$(_hostof fastly.mirror.pkgbuild.com) \
            --add-host=$(_hostof geo.mirror.pkgbuild.com) \
            --add-host=$(_hostof archlinux.org) \
            --add-host=$(_hostof "$_license_server") \
            --add-host=$(_hostof nonusdownload.comsol.com) \
            --add-host=$(_hostof update.comsol.com) \
            --add-host=$(_hostof comsol.com) \
            -v "$_license_file":"$_license_mnt":ro \
            -v "$srcdir/applications":/usr/share/applications:rw \
            -v "$srcdir/install":"$_installdir":rw \
            -v "$srcdir/$_installername":"/root/comsol":rw \
            --force-rm=true \
            --rm=true \
            -t install_comsol . \
            2> /dev/null \
            | while read -r _line; do 
                echo "[container] $_line"
                echo "$_line" >> log.txt
            done
        podman rmi --ignore localhost/install_comsol:latest

        # For some reason the install script always returns an error code, so i have to handle errors manually
        if ! grep -q 'Installation complete' log.txt; then
            echo "Installation did not complete successfully"
            exit 1
        fi
        if ! grep -q '0 ERRORS' log.txt; then
            echo "Installation failed with errors"
            exit 1
        fi
        if ! grep -q '0 FATAL ERRORS' log.txt; then
            echo "Installation failed with fatal errors"
            exit 1
        fi
    fi
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install desktop entry
    install -Dm644 "${srcdir}/applications/comsol-multiphysics-$_pkgver_major.desktop" "${pkgdir}/usr/share/applications/comsol-multiphysics.desktop"

    install -Dm755 -d "${pkgdir}${_installdir}"
    cp -rv "$srcdir/install" "${pkgdir}${_installdir}"

    # Install bin symlinks
    mkdir -p "${pkgdir}/usr/local/bin"
    ln -fsv "${_installdir}/bin/comsol" "${pkgdir}/usr/local/bin/comsol"
}
