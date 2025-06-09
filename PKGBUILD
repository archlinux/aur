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
# This package is huge. The download alone is a 118GB tar (in SI units),
# and the final zstd-compressed package is another 79GB.
# Reserve at least 470GB in total for building.
#
# It can also take several hours to build,
# being mostly limited by I/O and single-thread performance.
# Avoid running namcap: It takes long and ultimately fails due to exceeded limits.
#
# It *also* requires a reasonably ugly hack to build: since package() is run under fakeroot,
# and the installer tries to access the home directory no matter what `--location` is set to,
# it fails during "Running post-install tasks" because it tries to access `/root`.
# To fix this, a tiny shared library (see spoof_homedir.c) is LD_PRELOADed. Its only job is to
# wrap the `getpwuid()` function and modify the original return value for uid==0.

pkgname=vitis
_srcname=FPGAs_AdaptiveSoCs_Unified_SDI
_pkgver=2025.1  # used in install paths
pkgver=${_pkgver}
_more_ver=0530_0145
pkgrel=1
pkgdesc="FPGA/CPLD design suite for Xilinx devices"
url="https://www.xilinx.com/products/design-tools/vitis.html"
arch=('x86_64')
license=('custom')
makedepends=('gawk' 'python')
# depends+optdepends revised using find-libdeps minus find-libprovides.
# This may result in too few dependencies if the tools do not set up their
# lib paths appropriately.
depends=(
    'gcc-libs'                  # libgcc_s.so.1 libgomp.so.1 libstdc++.so.6
    'gtk2'                      # libgdk-x11-2.0.so.0 libgtk-x11-2.0.so.0
    'gtk3'                      # libgdk-3.so.0 libgtk-3.so.0
    ## According to toplevel installLibs.sh:
    'gcc'                       # for Vitis
    'git'                       # for Vitis
    'inetutils'                 # `hostname` for setupEnv.sh
    'libsecret'                 # libsecret-1.so.0
    'libxcrypt-compat'          # needed by setup tools
    'ncurses5-compat-libs'      # albeit provided internally
    'openssl-1.1'               # for DocNav
    'unzip'                     # for Vitis
    'zip'                       # for Vitis
    ## The following are required but presumably satisfied indirectly:
    'at-spi2-core'              # libatk-1.0.so.0 libatk-bridge-2.0.so.0 libatspi.so.0
    'cairo'                     # libcairo-gobject.so.2 libcairo.so.2
    'fontconfig'                # libfontconfig.so.1
    'freetype2'                 # libfreetype.so.6
    'gdk-pixbuf2'               # libgdk_pixbuf-2.0.so.0
    'glib2'                     # for libsecret
    'glibc'                     # libc.so libm.so
    'libglvnd'                  # (via gtk3) libEGL.so.1 libGL.so.1
    'libx11'                    # libX11-xcb.so.1
    'libxcb'                    # libxcb-dri3.so.0
    'libxft'                    # libXft.so.2
    'pango'                     # libpango-1.0.so.0 libpangocairo-1.0.so.0 libpangoft2-1.0.so.0
    'pcre2'                     # for glib2
    'util-linux-libs'           # libuuid.so.1
)
optdepends=(
    'dbus: for Vitis xsct if Xvfb is used'
    'digilent.adept.runtime'
    'digilent.adept.utilities'
    'fxload'
    'graphviz: AIE tools'
    'libselinux'                # libselinux.so.1
    'libxss: AIE tools'
    'make: AIE tools'
    'matlab: Model Composer'
    'net-tools: AIE tools'
    'nss: for Vitis tools'
    'openssl: AIE tools'
    'openssl-1.0'               # closest to RH compat-openssl10
    'python'
    'util-linux: fdisk for Vitis tools'
    'xorg-server-xvfb: for Vitis xsct as fallback X11 display'
    'xorg-xlsclients: for Vitis xsct unless -nodisp'
    'xorg-xprop: for Vitis/Vivado startfile.py and Vitis IDE (xdg-mime and xdg-settings)'
    ## Required by some installed (but possibly unused) binaries:
    'alsa-lib'                  # libasound.so.2
    'ffmpeg4.4'                 # libavcodec.so.58 libavformat.so.58
    'glu'                       # libGLU.so.1
    'lib32-glibc'               # lib32/ld-linux.so.2 lib32/libc.so lib32/libm.so
    'lib32-zlib'                # lib32/libz.so.1
    'libice'                    # libICE.so.6
    'libsm'                     # libSM.so.6
    'libstdc++5'                # libstdc++.so.5
    'libunwind'                 # libunwind.so.8
    'libxkbfile'                # libxkbfile.so.1
    'libyaml'                   # libyaml-0.so.2
    'onetbb'                    # libtbb.so.2 libtbbmalloc.so.2
                                # Note: current onetbb provides libtbb.so.12 instead of libtbb.so.2
                                # Note: intel-oneapi-basekit has copies of libtbb.so.2 in /opt
)
provides=(vivado)
conflicts=(vivado)
source=("file:///${_srcname}_${pkgver}_${_more_ver}.tar"
        'spoof_homedir.c')

# checksum from https://www.xilinx.com/support/download.html
md5sums=('144b21e7a231081821d13f85495dd809'
         '69d14ad64f6ec44e041eaa8ffcb6f87c')

# takes forever for probably minimal gain
options=('!strip' '!debug')

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
        --batch ConfigGen \
        --product Vitis \
        --edition 'Vitis Unified Software Platform' \
        --location "$pkgdir/opt/Xilinx"
    sed -i '/^Modules=/s,:0\>,:1,g' "$srcdir"/installer_temp/.Xilinx/install_config.txt
    LD_PRELOAD="$srcdir/spoof_homedir.so:$LD_PRELOAD" ./xsetup \
        --config "$srcdir"/installer_temp/.Xilinx/install_config.txt \
        --batch Install \
        --agree XilinxEULA,3rdPartyEULA

    # install udev rules
    install -Dm644 "$pkgdir/opt/Xilinx/${_pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-digilent-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir/opt/Xilinx/${_pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-ftdi-usb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$pkgdir/opt/Xilinx/${_pkgver}/data/xicom/cable_drivers/lin64/install_script/install_drivers/52-xilinx-pcusb.rules" -t "$pkgdir/usr/lib/udev/rules.d/"

    # install desktop files
    for deskfile in "$srcdir"/installer_temp/Desktop/*.desktop; do
        sed -i -e "s|$pkgdir||g" "$deskfile"
        install -Dm644 -t "$pkgdir/usr/share/applications/" "$deskfile"
    done

    # Remove $pkgdir from load paths in binaries
    _relocator=$pkgdir/opt/Xilinx/${_pkgver}/data/emulation/qemu/comp/qemu/relocate_sdk
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
        test -d "$ddir" || ln -sfTv Ubuntu "$ddir"
    done

    # Symptom: Vitis cannot even launch a browser.
    # Reason: Vitis packages lots of libstdc++.so.6 versions,
    # none of which are recent enough for Archlinux.
    # Workaround: Replace libstdc++.so.6 with symlinks to the system version.
    # For thoroughness, extend this to libgcc_s.so.1 and libgomp.so.1.
    # To limit side effects, restrict to libs with /Default/ in their path.
    # Note: This does not find stuff below the Default symlinks created above,
    # but our targets are not there anyway.
    find "$pkgdir/opt/Xilinx" \( -false $(printf ' -o -name %s' \
        libstdc++.so.6 libgcc_s.so.1 libgomp.so.1) \) -path '*/Default/*' | \
    while read lib; do
      _libarch=$(readelf -h "$lib" 2>/dev/null | awk '$1=="Machine:" {print $NF}')
      case $_libarch in
        (X86-64) ln -sfTv /usr/lib/"${lib##*/}" "$lib" ;;
        (80386) ln -sfTv /usr/lib32/"${lib##*/}" "$lib"         # 0 matches
          echo "W: Add lib32-gcc-libs to optdepends" >&2 ;;
      esac
    done

    # clean up artefacts
    rm -rf "$pkgdir/opt/Xilinx/.xinstall/"

    # There are lots of files with useless x permissions.
    # This looks weird and slows dependency checking.
    # Remove x permissions in obvious cases. (*.tcl not considered obvious.)
    ( set -f    # no globbing outside find
      find "$pkgdir" \( -false $(printf ' -o -iname *.%s' \
          a acd adoc aiff al avi avif bcmap bmp bs bsd btl bz2 \
          c cc cdo cfg class cnf conf config cmake cpj cpp css csv cxx \
          d dat db def diff do doc docs docx dst dtd dts dtsi dxc dxt \
          enc f f90 features fs gif gmo gz gzip h hex hpp htm html hxx \
          ico ipp in inc inf info info-[0-9] info-[0-9][0-9] ini \
          jar java jfif jmod jpeg jpg js json \
          l layout lcl lib lna log ltl lz lzma \
          m make man manifest map markdown mat md mdd mdl mf mjs mk \
          mo mod mp3 mpd msg mss \
          ngc npy npz o obj ogg otf \
          p padr paspd patch pb pc pcnm pdf pem pkg pkl png pm \
          po policy ppm prj properties props proto psg pxd pyc pyi pyo \
          rc rd rlx rsa rst rtd rules \
          s sav sch scss sdb sdbl sdbx security sf sgm slx \
          spec specs stamp sv svg svh svp \
          tar tcc td templ template tex texi toml tpl ts tsx ttcl ttf txt \
          ucf usg v vdb vdbl vdbx veo verif vh vhd vhdl vho vp vsix \
          wav webp whl woff woff2 \
          xchk xco xda xds xgd xit xlsx xml xng xsl xz yml yaml z zip) \
          $(printf ' -o -iname %s' makefile makefile[_.]* readme*) \) \
        -type f -exec chmod a-x {} +)
    # Normalize permissions
    find "$pkgdir" ! -type l ! -perm 755 ! -perm 644 \
      -exec chmod u=rwX,go=rX {} +

    # Save space for subsequent packaging, checking etc
    cd ..
    rm -rf "${_srcname}_${pkgver}_${_more_ver}"
}

# vim:set ts=4 sw=4 et:
