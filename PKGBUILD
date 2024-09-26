# Maintainer: Gökçe Aydos (leuko) <aydos.de>
# Maintainer: VitalyR <vr@vitalyr.com>
# Former Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
# Former Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html
# 2. Download "AMD Unified Installer for FPGAs & Adaptive SoCs SFD" - WARNING:
#   (1) This file is >100GB in size  (2) You need an account for US export
#   controls.
# 3. Place the .tar.gz in the same directory as the PKGBUILD
# 4. Only if you want to install Vitis Edition: Replace `vivado` with `vitis_` in `pkgname`.
#
#    Note that there is an alternative PKGBUILD for vitis in AUR.
# 5. Select the features you need in `install_config-vivado.txt` or `*-vitis.txt`.
#    
#    Alternatively you can install all features. See the commented lines in
#    `package` for this.
# 6. Build!
#
#
### SELECTING SPECIFIC COMPONENTS
#
# This package is huge. The download alone is a barely-compressed >100GB
# .tar.gz (extracts to ~100GB) and the final zstd-compressed package is another
# 20GB. Reserve at least 200GB in total for building.
#
# The unified installer that you downloaded includes all Vivado and Vitis
# editions. "Vitis Unified Software Platform" includes Vivado.
#
# Selecting only the features or component support you need will save space.
# Two example configuration files for 2024.1
# `install_config-{vitis,vivado}.txt` are included. If you want to create the
# install configuration yourself, follow the following steps:
#
# 1. tar xf *.tar.gz
# 2. ./xsetup -b ConfigGen
# 3. edit the generated config file.
#    You don't have to modify `Destination`. It is overridden by the
#    `--location` argument 
# 4. move the generated `install_config.txt` as
# `install_config-{vitis-vivado}.txt` to the PKGBUILD folder 
# 5. uncomment the file in `source` array
# 6. uncomment the corresponding `SKIP` in `md5sums` array
# 7. use the following arguments for `./xsetup` instead
#
#    --batch Install \
#    --agree XilinxEULA,3rdPartyEULA \
#    --location "$pkgdir/opt/Xilinx" \
#    --config ../install_config-$pkgname.txt
#
#
### UGLY HACK FOR BUILDING: `spoof_homedir.c`
#
# This PKGBUILD requires a reasonably ugly hack to build: since package() is
# run under fakeroot, and the installer tries to access the home directory no
# matter what `--location` is set to, it fails during "Running post-install
# tasks" because it tries to access `/root`. To fix this, a tiny shared library
# (see spoof_homedir.c) is LD_PRELOADed. Its only job is to wrap the
# `getpwuid()` function and modify the original return value for uid==0.
#
#
### CONSUMING LESS TIME FOR REPACKAGING
#
# If you later want to add more features to your installation, you may want to
# repackage. If you did not remove the extracted installation archive files
# (`src`) and would like to save the time for checksum and extraction for
# repackaging, then use:
#
# makepkg --noextract -f
#
#
### LIMITATIONS OF THE VITIS INSTALLATION
#
# Installation may hand after `Installing files, ... completed. (Done)`:
#
# After installation some scripts are executed, e.g., getting a list of
# installed devices for Vivado or installing Python wheels for Vitis. If a
# library is missing, Vivado may stay in its shell forever. To debug these
# problems, refer to the log: `~/.Xilinx/xinstall/xinstall-*.log`.
#

#pkgbase=vivado-suite
# For repo change in future

pkgname=(vivado)
#pkgname=(vitis_)  # To avoid name clash with the AUR package

_srcname=FPGAs_AdaptiveSoCs_Unified
pkgver=2024.1
_more_ver=0522_2023
pkgrel=1
pkgdesc="FPGA/CPLD design suite for AMD devices"
url="https://www.xilinx.com/products/design-tools/vivado.html"
arch=('x86_64')
license=('custom')
depends=('ncurses5-compat-libs'
    'libxcrypt-compat'
    'libpng12'
    'lib32-libpng12'
    'gtk3'
    'inetutils'
    'xorg-xlsclients'
    'cpio'
)
optdepends=('fxload'
    'digilent.adept.runtime'
    'digilent.adept.utilities'
    'matlab: Model Composer'
    'qt4: Model Composer'
)
source=(
    "file:///${_srcname}_${pkgver}_${_more_ver}.tar.gz"
    "spoof_homedir.c"
    "install_config-vitis.txt"
    "install_config-vivado.txt"
)

md5sums=(
    '372c0b184e32001137424e395823de3c'
    # Checksum from https://www.xilinx.com/support/download.html

    '69d14ad64f6ec44e041eaa8ffcb6f87c'
    SKIP
    SKIP
)

# Takes forever for probably minimal gain
options=('!strip')

prepare() {
    rm -rf "$srcdir/installer_temp"
    # If not removed, may lead to `Program group entry already exists` in
    # if srcdir is reused, e.g., with `makepkg --noextract -f`.

    mkdir -p "$srcdir/installer_temp"
}

build() {
    # Build our getpwuid() wrapper library
    gcc -shared -fPIC -D "FAKE_HOME=\"$srcdir/installer_temp\"" spoof_homedir.c -o spoof_homedir.so -ldl
}

_installprefix=/opt/Xilinx
package_common_pre() {
    # If installer is restarted using `makepkg --noextract -f`, then the folder
    # `installer_temp` stops the installer.
    rm -rf installer_temp 

    cd "${_srcname}_${pkgver}_${_more_ver}" || exit
}
package_common_post() {
    # Install udev rules
    install -Dm644 "$pkgdir$_installprefix/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir$_installprefix/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir$_installprefix/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

    # Clean up artifacts, remove leading $pkgdir from paths
    rm -rf "$pkgdir$_installprefix/.xinstall/"
    find "$pkgdir$_installprefix" -name '*settings64*' -exec sed -i -e "s|$pkgdir||g" '{}' \+

    # Install desktop files
    for deskfile in "$srcdir"/installer_temp/Desktop/*.desktop; do
        # Fix paths
        sed -i -e "s|$pkgdir||g" "$deskfile"

        # Avoid temporary files in your HOME during runtime
        echo "Path=/tmp" >> "$deskfile"

        install -Dm644 -t "$pkgdir/usr/share/applications/" "$deskfile"
    done

    # If you want to save space for subsequent packaging, then remove the
    # extracted installation archive files. The following lines are executed
    # before the pacman package is created and will free >100G of space.
    #cd ..
    #rm -rf "${_srcname}_${pkgver}_${_more_ver}"
}
package_vivado() {
    conflicts=(vitis)
    pkgdesc="$pkgdesc – Vivado edition"
    package_common_pre
    # LD_PRELOAD already contains libfakeroot.so, add our own library before that
    LD_PRELOAD=$srcdir/spoof_homedir.so:$LD_PRELOAD ./xsetup \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA \
        --location "$pkgdir$_installprefix" \
        --config ../install_config-vivado.txt

    # For installing all features, use the following options
        #--product Vivado \
        #--edition 'Vivado ML Standard'

    package_common_post
}
package_vitis_() {
    provides=(vitis)
    conflicts=(vivado)
    pkgdesc="$pkgdesc – Vitis edition"
    package_common_pre
    install=vitis.install  # Reinstall Python wheel etc

    LD_PRELOAD=$srcdir/spoof_homedir.so:$LD_PRELOAD ./xsetup \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA \
        --location "$pkgdir$_installprefix" \
        --config ../install_config-vitis.txt

    # For installing all features, use the following options
        #--product Vitis \
        #--edition 'Vitis Unified Software Platform'

    # Vitis' custom libraries clash with native libraries. Only load select
    # ones, e.g., libssl.so.10 for cmake $CUSTOM_LIBRARY_PATH and
    # $MY_LIBRARY_PATH contain the paths to the
    # custom libraries. The following lines replace the expansion of these
    # variables with the select libraries
    sed -i \
        "s|\$CUSTOM_LIBRARY_PATH|$_installprefix/Vitis/2024.1/tps/lnx64/cmake-3.24.2/libs/Ubuntu|g" \
        "$pkgdir$_installprefix"/Vitis/2024.1/bin/vitis
    sed -i \
        "s|\$MY_LIBRARY_PATH|$_installprefix/Vitis/2024.1/tps/lnx64/cmake-3.24.2/libs/Ubuntu|g" \
        "$pkgdir$_installprefix"/Vitis/2024.1/bin/vitis

    # Vitis installer installs lopper etc packages into a Python virtual
    # environment, but these will point to the PKGBUILD folder. The following
    # fixes the exec paths only in executables. Fixing the path in all files
    # corrupts installed libraries in the virtual path.
    #
    # An improvement idea is to reinstall the virtualenv after installation
    # using a script. However I could not get it working (see vitis.install).

    # Fix Python 3.8 path
    ln -sf "$_installprefix"/Vitis/${pkgver}/tps/lnx64/python-3.8.3/bin/python \
        "$pkgdir$_installprefix"/Vitis/${pkgver}/tps/lnx64/lopper-1.1.0/env/bin/python
    
    for prog in Vitis Vivado; do
        find "$pkgdir$_installprefix"/$prog/$pkgver/tps/lnx64/lopper-1.1.0/env/bin \
            -type f \
            -exec sed -i -e "s|$pkgdir||g" '{}' \+

        # Remove write permissions from the lopper directory
        chmod go-w -R "$pkgdir$_installprefix"/$prog/${pkgver}/tps/lnx64/lopper-1.1.0
    done
    package_common_post
}
