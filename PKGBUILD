# Maintainer: xiretza <aur@xiretza.xyz>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# BUILD INSTRUCTIONS:
#
# 1. Log in to xilinx.com
# 2. Go to https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html
# 3. Download "Xilinx Unified Installer SFD (TAR/GZIP)" - WARNING: This file is >110GB in size
# 4. Place the .tar.gz in the same directory as the PKGBUILD
# 5. Build!
#
# No refunds for broken AUR helpers, just use make(chroot)pkg.
#
# SOME MORE NOTES:
#
# This package is huge. The download alone is a barely-compressed 110GB .tar.gz (extracts to ~110GB)
# and the final zstd-compressed package is another 88GB. Reserve at least 400GB in total for building.
#
# It can also take several hours to build, being mostly limited by I/O and single-thread
# performance. `namcap` takes another hour, make sure you're not running that automatically.
#
# It *also* requires a reasonably ugly hack to build: since package() is run under fakeroot,
# and the installer tries to access the home directory no matter what `--location` is set to,
# it fails during "Running post-install tasks" because it tries to access `/root`.
# To fix this, a tiny shared library (see spoof_homedir.c) is LD_PRELOADed. Its only job is to
# wrap the `getpwuid()` function and modify the original return value for uid==0.

pkgname=vitis
_srcname=FPGAs_AdaptiveSoCs_Unified
pkgver=2023.2
_more_ver=1013_2256
pkgrel=2
pkgdesc="FPGA/CPLD design suite for Xilinx devices"
url="https://www.xilinx.com/products/design-tools/vitis.html"
arch=('x86_64')
license=('custom')
makedepends=('python')
depends=('ncurses5-compat-libs'
         'libxcrypt-compat'     # ?
         'libpng12'             # ?
         'lib32-libpng12'       # ?
         'gtk2'                 # or gtk3?
         'gcc'                  # for Vitis
         'git'                  # for Vitis
         'unzip'                # for Vitis
         'cpio'                 # ?
         'inetutils'            # ?
)
optdepends=('fxload'
            'digilent.adept.runtime'
            'digilent.adept.utilities'
            'xorg-xprop: for Vitis/Vivado startfile.py and Vitis IDE (xdg-mime and xdg-settings)'
            'xorg-xlsclients: for Vitis xsct unless -nodisp'
            'xorg-server-xvfb: for Vitis xsct as fallback X11 display'
            'dbus: for Vitis xsct if Xvfb is used'
            'graphviz: AIE tools'
            'libxss: AIE tools'
            'make: AIE tools'
            'net-tools: AIE tools'
            'openssl: AIE tools'
            'matlab: Model Composer'
            'qt4: Model Composer'       # ?
            'python'
)
provides=(vivado)
conflicts=(vivado)
source=("file:///${_srcname}_${pkgver}_${_more_ver}.tar.gz"
        'spoof_homedir.c')

# checksum from https://www.xilinx.com/support/download.html
md5sums=('64d64e9b937b6fd5e98b41811c74aab2'
         '69d14ad64f6ec44e041eaa8ffcb6f87c')

# takes forever for probably minimal gain
options=('!strip')

prepare() {
    mkdir -p "$srcdir/installer_temp"
}

build() {
    # build our getpwuid() wrapper library
    gcc -shared -fPIC -D "FAKE_HOME=\"$srcdir/installer_temp\"" spoof_homedir.c -o spoof_homedir.so -ldl
}

package() {
    cd "${_srcname}_${pkgver}_${_more_ver}"

    # LD_PRELOAD already contains libfakeroot.so, add our own library before that
    LD_PRELOAD="$srcdir/spoof_homedir.so:$LD_PRELOAD" ./xsetup \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA \
        --product Vitis \
        --edition 'Vitis Unified Software Platform' \
        --location "$pkgdir/opt/Xilinx"

    # install udev rules
    install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir/opt/Xilinx/Vivado/${pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

    # install desktop files
    for deskfile in "$srcdir"/installer_temp/Desktop/*.desktop; do
        sed -i -e "s|$pkgdir||g" "$deskfile"
        install -Dm644 -t "$pkgdir/usr/share/applications/" "$deskfile"
    done

    # Remove $pkgdir from load paths in binaries
    _relocator=$pkgdir/opt/Xilinx/Vitis/${pkgver}/data/emulation/qemu/comp/qemu/relocate_sdk
    # old_prefix is hardcoded in the relocator script,
    # but the relocator has already run, so we need to update it.
    sed -i -e '/old_prefix *=[^=]/s|"[^"]*"|"'"${_relocator%/*}"'"|' \
        "$_relocator".py
    # Only remove $pkgdir in the to-be-stored strings, i.e. 2nd, 3rd occurrence,
    # but leave $pkgdir where needed to find files
    sed -i -e "/^\\\${PYTHON}/{;s|$pkgdir||2;s|$pkgdir||2;}" "$_relocator".sh
    # Run the fixed relocator
    "$_relocator".sh
    # Now remove the remaining traces of $pkgdir
    sed -i -e "s|$pkgdir||g" "$_relocator".* \
        "${_relocator%/*}"/environment-setup-*
    find "$pkgdir/opt/Xilinx" -name '*settings64*' -type f \
        -exec sed -i -e "s|$pkgdir||g" '{}' \+
    find "$pkgdir/opt/Xilinx/Vitis/${pkgver}"/tps/lnx64/lopper-*/env \
        -maxdepth 2 -type f \
        -exec sed -i -e "s|$pkgdir||g" '{}' \+

    # Fix symlinks into pkgdir
    find "$pkgdir/opt/Xilinx" -type l | \
    while read link; do
        target=$(readlink "$link")
        case $target in ("$pkgdir/"*) ln -srf "$target" "$link";; esac
    done

    # There are some lib subdirs named after distros: Rhel SuSE Ubuntu Default.
    # We end up using Default; symlink that to Ubuntu if it does not exist.
    find "$pkgdir/opt/Xilinx" -name Ubuntu -type d | \
    while read udir; do
        ddir=${udir%/*}/Default
        test -d "$ddir" || ln -s Ubuntu "$ddir"
    done

    # clean up artefacts
    rm -rf "$pkgdir/opt/Xilinx/.xinstall/"

    # Save space for subsequent packaging, checking etc
    cd ..
    rm -rf "${_srcname}_${pkgver}_${_more_ver}"
}

# vim:set ts=4 sw=4 et:
