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

pkgbase=comsol-multiphysics
pkgname=(
    "$pkgbase"
    #"$pkgbase-acdc"
)
_installername=COMSOL64_lnx
pkgver=6.4.0.343
_pkgver_major=6.4
pkgrel=1
pkgdesc='A general-purpose simulation software for modeling designs, devices, and processes in all fields of engineering, manufacturing, and scientific research'
arch=('x86_64')
url='https://www.comsol.com/comsol-multiphysics'
license=('LicenseRef-Comsol')
depends=(base base-devel jre21-openjdk graphicsmagick)
optdepends=(
    'matlab: LiveLink™ for MATLAB®'
    'tcsh: Required for interoperability with MATLAB®'
    'cuda: COMSOL CUDA Runtime. Required for GPU Compute'
    'cudss: COMSOL CUDSS Runtime Components'
)
makedepends=(
    'coreutils'
    'grep'
    'sed'
    'unzip'
    'sh'
    'man-pages' # For readlink
)
source=(
    # Download URL is https://nonusdownload.comsol.com/product/$pkgver/full/$_installername.zip?__gda__=$_gda&fileExt=.zip but $_gda changes dynamically. Automatic download not possible.
    # Go to www.comsol.com, login and activate your license, then download the online installer for Linux from https://www.comsol.com/product-download manually. Place the zip in this directory together with this PKGBUILD
    # Note: if you don't have an exactly matching version, there's still a good chance everything should work if you just change the sha256sum for the installer zip, or 'SKIP' it.
    "file://$_installername.zip"
    "file://LICENSE"
    "file://setupconfig.ini"
    "file://comsol-multiphysics.desktop"
)
sha256sums=(
    d3608ff8bfef0c351f93f5a5c27e14f15922e4284092d378dafa09bb20f9d964
    55a674c9c763b04fa313cda80998c4fbaf923b3166b2c91d242b0d3a4ae1843c
    3e87aeb02ee58364c75f6979fc05be42d189f2653fa3394951844bc5363cd283
    fda96a349398e5d49598f3186f242dd8d673fb18aa73719c1dcad066ea9b1afa
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
    echo "$1:$(ping "$1" -c 1 -q 2>&1 | grep -Po "(\d{1,3}\.){3}\d{1,3}")"
}

function _get_conf
{
    if grep -q "$1 = " "${srcdir}/setupconfig.ini"; then
        grep "$1 = " "${srcdir}/setupconfig.ini" | tail | sed "s/$1 = //g"
    fi
}
function _set_conf
{
    if grep -q "$1 =" "${srcdir}/setupconfig.ini"; then
        sed -i "s#^$1 =.*\$#$1 = $2#g" "${srcdir}/setupconfig.ini"
    else
        echo "[Warning]: new configuration '$1'"
        echo "$1 = $2" >> "${srcdir}/setupconfig.ini"
    fi
    echo "$1 = $2"
}

prepare()
{
    cd "${srcdir}"

    #license agreement
    local _license_agreement="LICENSE"
    local _read=0
    if [[ $_license_agree != 1 && ${COMSOL_MULTIPHYSICS_LICENSE_AGREE} == 1 ]]; then
        _license_agree=1
    elif [[ $_license_agree != 1 && "$(_get_conf 'agree')" == "1" ]]; then
        _license_agree=1
    elif [[ -f "${srcdir}/agree.cache" ]]; then
        _license_agree=1
    fi
    while [[ $_license_agree != 1 ]]; do
        if [ "${_read}" == "1" ]; then
            less -E "${_license_agreement}"
            _read=0
        fi

        echo  "Do you accept the license agreement? ([y]es to agree, q to quit, r to read)"
        read -r ans
        case $(echo "$ans" | tr '[:upper:]' '[:lower:]') in
            [Yy]|yes|yeS|yEs|yES|Yes|YeS|YEs|YES ) 
                _license_agree=1
            ;;
            [Qq] ) exit 1;;
            [Rr] ) _read=1;;
            * ) ;;
        esac
    done
    if [[ ${COMSOL_MULTIPHYSICS_LICENSE_AGREE} != 1 ]]; then
        echo "[Info]: You can set COMSOL_MULTIPHYSICS_LICENSE_AGREE=1 in /etc/makepkg.conf to make your agreement permanent."
    fi
    touch "${srcdir}/agree"
    _set_conf agree 1

    if [[ "$_license" == "" && "${COMSOL_MULTIPHYSICS_LICENSE}" != "" ]]; then
        _license="${COMSOL_MULTIPHYSICS_LICENSE}"
    fi
    if [[ "$_license" == "" ]] && grep -q "license = " "$srcdir/setupconfig.ini"; then
        _license="$(_get_conf license)"
    fi
    if [[ "$_license" == "" && -f "${srcdir}/license.cache" ]]; then
        _license="$(cat "${srcdir}/licence.cache")"
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
            read -re ans
        else
            ans=$_license
        fi
        
        if [ -z "${ans}" ]; then
            ans=1718@localhost
        fi
        if [ "${ans}" == 'q' ]; then
            echo "Quitting..."
            exit 1        
        else
            if [[ $(echo "$ans" | grep -c @) != 0 ]]; then
                _license="${ans}"
                break
            elif [ -e "${ans}" ]; then
                _license="$(readlink -m "${ans}")"
                break
            elif [[ "$ans" == ?????????????????-????-??????-???????-????????? ]]; then
                _license="${ans}"
            else
                _license=
                echo "$ans does not exist."
            fi
        fi
    done
    _set_conf license "$_license"
    echo "$_license" > "${srcdir}/license.cache"
    if [[ "${COMSOL_MULTIPHYSICS_LICENSE}" == "" ]]; then
        echo "[Info]: You can set COMSOL_MULTIPHYSICS_LICENSE=$_license in /etc/makepkg.conf to make your license permanent."
    fi

    _show_addins_info=1
    _show_addins_help=0
    read -ra _addins <<< "${COMSOL_MULTIPHYSICS_ADDIN_MODULES[@]}"
    for _addin in "${_addins[@]}"; do
        if grep -q "comsol.$_addin = 0" "${srcdir}/setupconfig.ini"; then
            _set_conf "comsol.$_addin" 1
        else
            echo "[Warning]: Add-in module '$_addin' does not exist."
            _show_addins_help=1
        fi
        _show_addins_info=0
    done
    if [[ $_show_addins_info == 1 ]]; then
        echo "[Info]: You can specify add-in modules by setting the COMSOL_MULTIPHYSICS_ADDIN_MODULES variable in /etc/makepkg.conf."
        echo "[Example]: COMSOL_MULTIPHYSICS_ADDIN_MODULES=(acdc mems)"
        _show_addins_help=1
    fi
    if [[ $_show_addins_help == 1 ]]; then
        echo "[Info]: Valid add-in modules are: $(grep "^comsol\." setupconfig.ini | sed 's/^comsol\.//g' | sed 's/ .*$//g' | sed -e ':x /$/ { N; s/\n/ /g ; bx }')"
    fi

    _set_conf installdir "${srcdir}/install"
    mkdir -p install
    mkdir -p home
    mkdir -p tmp
}

build()
{
    cd "${srcdir}"
 
    if test -f setupconfig.ini.cache \
        && cmp --silent setupconfig.ini setupconfig.ini.cache \
        && test -f log.txt \
        && grep -q 'Installation complete' log.txt \
        && grep -q '0 ERRORS' log.txt \
        && grep -q '0 FATAL ERRORS' log.txt \
    ; then
        echo "Already built"
    else
        echo "" > log.txt

        _vpn_interface=$(ip addr show | grep -o 'tun[0-9]*' | head -1)
        if [[ ! -n "$_vpn_interface" ]]; then
            echo "[Warning]: you may need to connect to a corporate VPN in order to activate your product license."
        fi

        cp "${srcdir}/setupconfig.ini" "${srcdir}/setupconfig.ini.cache"
        HOME="${srcdir}/home" \
            XDG_DESKTOP_DIR="${srcdir}/home/Desktop" \
            XDG_DOCUMENTS_DIR="${srcdir}/home/Documents" \
            XDG_DOWNLOAD_DIR="${srcdir}/home/Downloads" \
            XDG_MUSIC_DIR="${srcdir}/home/Music" \
            XDG_PICTURES_DIR="${srcdir}/home/Pictures" \
            XDG_PUBLICSHARE_DIR="${srcdir}/home/Public" \
            XDG_TEMPLATES_DIR="${srcdir}/home/Templates" \
            XDG_VIDEOS_DIR="${srcdir}/home/Videos" \
            XDG_CONFIG_HOME="${srcdir}/home/.config" \
            XDG_CACHE_HOME="${srcdir}/home/.cache" \
            XDG_DATA_HOME="${srcdir}/home/.local/share" \
            XDG_STATE_HOME="${srcdir}/home/.local/state" \
            TMPDIR="${srcdir}/tmp" \
            /usr/bin/sh "${srcdir}/$_installername/setup" -s "${srcdir}/setupconfig.ini" \
            2> /dev/null \
            | while read -r _line; do 
                echo "$_line"
                echo "$_line" >> log.txt
            done 

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

    sed -i "s@GRAPHICS_MAGICK_PATH=.*\$@GRAPHICS_MAGICK_PATH='/usr/lib'@g" "${srcdir}/install/bin/comsol"
    sed -i "s@^CUDAROOT=.*\$@CUDAROOT='/opt/cuda'@g" "${srcdir}/install/bin/comsol"
    sed -i "s@^CUDSSROOT=.*\$@CUDSSROOT='/usr'@g" "${srcdir}/install/bin/comsol"
    sed -i "s@^JRE=.*\$@JRE='/usr/lib/jvm/java-21-openjdk/lib/server/libjvm.so'@g" "${srcdir}/install/bin/comsol"
    sed -i "s@^JREROOT=.*\$@JREROOT='/usr/lib/jvm/java-21-openjdk'@g" "${srcdir}/install/bin/comsol"
    rm -f "${srcdir}/install/comsolsetup.log"
    rm -f "${srcdir}/install/comsolsetup.log.old"
}

package()
{
    cd "${srcdir}"

    # Install License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

    # Install desktop entry
    install -Dm644 "${srcdir}/comsol-multiphysics.desktop" "${pkgdir}/usr/share/applications/comsol-multiphysics.desktop"

    install -Dm755 -d "${pkgdir}${_installdir}"
    cp -r "${srcdir}/install"/* "${pkgdir}${_installdir}/"
    chmod -R o-w "${pkgdir}${_installdir}"

    # Install bin symlinks
    install -vd "${pkgdir}/usr/bin"
    ln -vsf "${_installdir}/bin/comsol" "${pkgdir}/usr/bin/comsol"
}
