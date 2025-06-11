# Maintainer: Gökçe Aydos (leuko) <aydos.de>
# Maintainer: VitalyR <vr@vitalyr.com>
# Former Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
# Former Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://www.xilinx.com/support/download.html
# 2. Download "AMD Unified Installer for FPGAs & Adaptive SoCs .... SFD" - WARNING:
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
# This package is huge. The download alone is a barely-compressed >100 GB
# .tar.gz (extracts to ~110 GB) and the final zstd-compressed package is another
# 20 GB. Reserve at least 270 GB in total for building.
#
# The unified installer that you downloaded includes all Vivado and Vitis
# editions. "Vitis (Unified Software Platform)" includes Vivado.
#
# Selecting only the features or component support you need will save space.
# Two example configuration files for 2025.1
# `install_config-{vitis,vivado}.txt` are included, which enable support for
# Spartan-7 only – so add/remove features as needed. If you want to create the
# install configuration yourself, follow the following steps:
#
# 1. tar xf *.tar
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

pkgname=(vivado)
#pkgname=(vitis_)  # To avoid name clash with the AUR package

_installprefix=/opt/Xilinx

_srcname=FPGAs_AdaptiveSoCs_Unified_SDI
pkgver=2025.1
_more_ver=0530_0145
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
    "file:///${_srcname}_${pkgver}_${_more_ver}.tar"
    "spoof_homedir.c"
    "install_config-vitis.txt"
    "install_config-vivado.txt"
)

md5sums=(
    '144b21e7a231081821d13f85495dd809'
    # Checksum from https://www.xilinx.com/support/download.html

    '69d14ad64f6ec44e041eaa8ffcb6f87c'
    SKIP
    SKIP
)

options=('!strip' '!debug')
# Takes forever for probably minimal gain

prepare() {
    rm -rf "$srcdir/installer_temp"
    # If not removed, may lead to `Program group entry already exists` if
    # srcdir is reused, e.g., with `makepkg --noextract -f`.

    mkdir -p "$srcdir/installer_temp"
}

build() {
    # Build our getpwuid() wrapper library
    gcc -shared -fPIC -D "FAKE_HOME=\"$srcdir/installer_temp\"" spoof_homedir.c -o spoof_homedir.so -ldl
}

package_common_pre() {
    # If the installer is restarted using `makepkg --noextract -f`, then the
    # folder `installer_temp` stops the installer.
    rm -rf installer_temp 

    cd "${_srcname}_${pkgver}_${_more_ver}" || exit
}
package_common_post() {
    # Install udev rules
    install -Dm644 "$pkgdir$_installprefix/${pkgver}/Vivado/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir$_installprefix/${pkgver}/Vivado/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir$_installprefix/${pkgver}/Vivado/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

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
    conflicts=(vitis vivado)
    pkgdesc="$pkgdesc – Vivado edition"
    package_common_pre
    # LD_PRELOAD already contains libfakeroot.so, however in some stages of the
    # install libfakeroot.so still cannot be found, so provide full path
    LD_PRELOAD=$srcdir/spoof_homedir.so:/lib/libfakeroot/libfakeroot.so ./xsetup \
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
    provides=(vitis vivado)
    conflicts=(vitis vivado)
    pkgdesc="$pkgdesc – Vitis edition"
    package_common_pre
    install=vitis.install  # Reinstall Python wheel etc

    LD_PRELOAD=$srcdir/spoof_homedir.so:/lib/libfakeroot/libfakeroot.so ./xsetup \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA \
        --location "$pkgdir$_installprefix" \
        --config ../install_config-vitis.txt

    # For installing all features, use the following options
        #--product Vitis \
        #--edition 'Vitis Unified Software Platform'

    cat <<"EOF"
⚠️ You may got a warning above as follows:
```
Warning: AMD software was installed successfully, but an unexpected status was returned from the following post installation task(s) xargs: file: terminated by signal 31 sed: no input files
```
Versal Qemu model installer uses `file`, which causes signal 31 SIGSYS under fakeroot.
So the installation under `Vitis/data/emulation/qemu/comp/qemu` will probably not work.
If you need the emulator, please follow the instructions after the installation.
EOF
    echo Removing Versal Qemu installation from the following directory:
    VERSAL_QEMU_INSTALL_DIR="$pkgdir$_installprefix"/${pkgver}/Vitis/data/emulation/qemu/comp/qemu
    echo $VERSAL_QEMU_INSTALL_DIR
    rm -r $VERSAL_QEMU_INSTALL_DIR

    # The following fix can successfully run the installer, but the executables still contain
    # references to the pkgdir and must be relocated.
    #The debug message by the install script is:
    #```
    #...Relocate script failed. Abort!, stderr: xargs: file: terminated by
    #signal 31
    #```
    #versal_qemu_installer="$pkgdir$_installprefix"/${pkgver}/Vitis/data/emulation/qemu/comp/qemu_scripts/qemu/x86_64-qemu-xilinx-nativesdk-standalone
    #echo 'Patching the installer to run `file` without sandboxing (`--no-sandbox`).'
    #sed -i \
    #    -e 's:file :file --no-sandbox:g' \
    #    $versal_qemu_installer
    #echo Restarting the installer
    #$versal_qemu_installer -d $VERSAL_QEMU_INSTALL_DIR -y -R

    # Electron-based Vitis IDE ships its own libraries which clash with Arch's.
    # Deactivate them by removing all uses of $CUSTOM_LIBRARY_PATH and
    # $MY_LIBRARY_PATH.
    sed -Ei \
        's!\$\{?(CUSTOM|MY)_LIBRARY_PATH\}?[:]*!!g' \
        "$pkgdir$_installprefix"/$pkgver/Vitis/bin/vitis

    package_common_post
}
# Note:
# The installer tries to download
# https://download.amd.com/opendownload/installer/installer_patch_2025.1_2025.1_0530_0145.zip
# which leads to 404 as of 2025-06-09. Maybe it is only applied if it can be
# downloaded. The error can be seen in the debug logs in
# `$HOME/.Xilinx/xinstall/xinstall-*.log`.
