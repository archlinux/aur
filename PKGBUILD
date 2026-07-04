# Maintainer: Gökçe Aydos (leuko) <aydos.de>
# Maintainer: VitalyR <vr@vitalyr.com>
# Former Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
# Former Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

### BUILD INSTRUCTIONS:
#
# 1. Go to https://www.xilinx.com/support/download.html
#
# 2. Download "AMD Unified Installer for FPGAs & ... SFD".
#    WARNING:
#
#   (1) Reserve about ~300GiB in total.
#       - Archive: ~100G
#       - Extracted files: ~100G
#       - `pkg` folder: ~60G (Vivado + Spartan-7 only)
#         - if you don't delete `pkg` folder after package generation, then you
#           require *additional* ~60G
#       - compressed package: ~25G
#   (2) You need an account for US export controls and license generation.
#       Starting from 2026.1 Vivado must be used with a license including
#       the free tier.
#
# 3. Place the .tar.gz in the same directory as the PKGBUILD.
#
# 4. Only if you want to install Vitis Edition:
#
#    There is an alternative PKGBUILD for vitis in AUR by Christian Cornelssen
#    which includes more workarounds and more detailed dependencies.
#
#    https://aur.archlinux.org/packages/vitis
#
#    If you still want to install Vitis using this PKGBUILD:
#    Uncomment the line `pkgname=(vitis_)`.
#
# 5. Select the features you need in `install_config-vivado.txt` or `*-vitis.txt`.
#    Alternatively you can install all features. See the lines in `package` for
#    this, which are commented out.
#
# 6. Build and install.
#
# 7. If you need a license: 
#    https://account.amd.com/en/forms/license/license-form.html
#
#
### SELECTING SPECIFIC COMPONENTS
#
# The unified installer that you downloaded includes all Vivado and Vitis
# editions. Vitis includes Vivado.
#
# Selecting only the features or component support you need will save space.
# Two example configuration files for 2026.1 `install_config-{vitis,vivado}.txt`
# are included, which enable support for Spartan-7 only – so add/remove
# features as needed. If you want to create the install configuration yourself,
# follow the following steps:
#
# 1. `makepkg --nobuild` – Extracts archive contents
#
# 2. ```
#    pushd src/FPGAs*/
#    ./xsetup -b ConfigGen
#    popd
#    ```
#
# 3. Edit the generated config file.
#    You don't have to modify `Destination`. It is overridden by the
#    `--location` argument 
#
# 4. Move the generated `install_config.txt` as
#    `install_config-{vitis,vivado}.txt`
#    to the PKGBUILD folder 
#
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
# If you later want to add more features to your installation by editing
# `install_config-*.txt`, you may want to repackage. If you did not remove the
# extracted installation archive files (`src`) and would like to save the time
# (checksum and extraction) before, then use:
#
# makepkg --noextract -f

pkgname=(vivado)

# pkgname=(vitis_)  # Uncomment for Vitis. 
# (`_` is to avoid name clash with the other AUR package

_installprefix=/opt/Xilinx

_srcname=FPGAs_AdaptiveSoCs_Unified_SDI
pkgver=2026.1
_more_ver=0616_1700
pkgrel=1
pkgdesc="FPGA & Adaptive SoC tools for AMD devices"
url="https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html"
arch=('x86_64')
license=('custom')
depends=(
    'inetutils'  # Vivado/bin/setupEnv.sh: `hostname` command
    'ncurses5-compat-libs'  # libxv_commontasks.so": libncurses.so.5
    'libxi'  # tps/lnx64/jre24.0.2_12/lib/libawt_xawt.so: libXi.so.6
    'libxtst'  # tps/lnx64/jre24.0.2_12/lib/libawt_xawt.so: libXtst.so.6
)
optdepends=(
    'xorg-xwayland: For running on Wayland'
)
source=(
    "file:///${_srcname}_${pkgver}_${_more_ver}.tar"
    "spoof_homedir.c"
    "install_config-vitis.txt"
    "install_config-vivado.txt"
)

md5sums=(
    'b577835d4304f07e40292c51a4018482'
    # Checksum from https://www.xilinx.com/support/download.html
    # => click `Verify Download`

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
    install=vitis.install

    LD_PRELOAD=$srcdir/spoof_homedir.so:/lib/libfakeroot/libfakeroot.so ./xsetup \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA \
        --location "$pkgdir$_installprefix" \
        --config ../install_config-vitis.txt

    # For installing all features, use the following options
        #--product Vitis \
        #--edition 'Vitis Unified Software Platform'

    VERSAL_QEMU_INSTALL_DIR="${pkgdir}${_installprefix}"/${pkgver}/Vitis/data/emulation/qemu/comp/qemu_edf
    VERSAL_QEMU_INSTALL_DIR_WITHOUT_PREFIX=${VERSAL_QEMU_INSTALL_DIR#"${pkgdir}${_installprefix}/"}
    cat <<EOF
⚠️ You may got a warning above as follows:
```
Warning: AMD software was installed successfully, but an unexpected status was returned from the following post installation task(s) xargs: file: terminated by signal 31 sed: no input files
```
Versal Qemu model installer uses `file`, which causes signal 31 SIGSYS under fakeroot.
So the installation under $VERSAL_QEMU_INSTALL_DIR_WITHOUT_PREFIX will probably not work.
If you need the emulator, please follow the instructions after the installation.
EOF
    echo Removing Versal Qemu installation from the following directory:
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
