# Contributor: quantax -- contact via Arch Linux forum or AUR
# Mantainer: M0Rf30
pkgname=unrealtournament
pkgver=451
pkgrel=8
pkgdesc="The classic Unreal Tournament from 1999. Retail CD or DVD required."
arch=('i686' 'x86_64')
url="http://www.unrealtournament.com/"
license=('custom')
groups=(ut1999-goty)
[ "$CARCH" = "i686" ] && depends=(ossp libnotify sdl libgl)
[ "$CARCH" = "x86_64" ] &&  depends=(ossp libnotify lib32-sdl lib32-libgl)
makedepends=(makepkg-unreal unshield)
provides=(ut1999)
conflicts=(ut1999 ut ut-server)
source=(ut436.run::'https://raw.github.com/XenGi/oldgames/master/ut/unreal.tournament_436-multilanguage.run'
        ut436goty.run::'https://raw.github.com/XenGi/oldgames/master/ut/unreal.tournament_436-multilanguage.goty.run'
        https://raw.github.com/XenGi/oldgames/master/ut/ALAudio-86eade1c.zip
	    https://raw.github.com/XenGi/oldgames/master/ut/OpenGLDrv-3.6-86eade1c.zip
        https://raw.github.com/XenGi/oldgames/master/ut/UTPGPatch451.tar.bz2
        ut.desktop
        disk.list
        utpg.list
        utcustom.sh
        https://raw.github.com/XenGi/oldgames/master/ut/ut.svgz)
noextract=(UTPGPatch451.tar.bz2)
md5sums=('726aede817997a2aefccb8c20601d760'
         '7012dc6caaa9453dcf8951474556912a'
         '165ced7397e1269f061e356f170a90ba'
         '0bb18191cafbc6e6ae48e0b3577a39ad'
         '77a735a78b1eb819042338859900b83b'
         '8906e3958918af977f5a8583fa7c263f'
         '7fbe728f7cef23d53bdfe6be17b7129a'
         '72efce99d512b1a71587c2c127dccd06'
         '5575e5771736d143a0ccaa4d4d043bcb'
         'cc8e253aac0e008c9fbe0d4cfdf3ffbd')

# You can uncomment and set these two variables in order to override the auto
# detection done in build() by _detect_cdpath() and _detect_cdversion().
#_cdpath="/mnt"    # path to your mounted UT CD or DVD
#_cdversion="" # "default" or "anthology"

# Detect the mount point of the install medium.
_detect_cdpath() {
    echo "Searching for mount point of install medium... "

    for mountpoint in $(egrep "(iso9660|udf)" /etc/mtab | awk '{print $2}'); do
        if [ -f "${mountpoint}/SYSTEM/UnrealTournament.exe" ] || [ -f "${mountpoint}/Disk1/data1.hdr" ]; then
            _cdpath="${mountpoint}"
            break
        fi
    done

    if [ -z "${_cdpath}" ]; then
	    cat << __EOF__ >&2
    No mounted valid Unreal Tournament CD or Unreal Anthology
    DVD has been detected while scanning all "iso9660"
    and all "udf" filesystems in "/etc/mtab" for the file
    "SYSTEM/UnrealTournament.exe" or the file "Disk1/data1.hdr".
    Make sure you mounted the right disk correctly.  If it still
    doesn't work you can try setting the "_cdpath" and/or the
    "_cdversion" variable in this PKGBUILD to your mount point and
    your version of UT manually.
__EOF__
        return 1
    else
        echo "    ${_cdpath} looks promising."
    fi
}

# Determine which method should be used for extracting the files from the
# install medium.
_detect_cdversion() {
    echo "Determining install method... "

    if [ -f "${_cdpath}/SYSTEM/UnrealTournament.exe" ]; then
        _cdversion="default"
    elif [ -f "${_cdpath}/Disk1/data1.hdr" ]; then
        _cdversion="anthology"
    elif [ -f "${_cdpath}/System/UnrealTournament.exe" ]; then
        _cdversion="default"
    else
        echo "Could not determine _cdversion." >&2
        return 1
    fi
    echo "    Using \"${_cdversion}\" method."
}

# Install files from most UT99 CDs.
_build_default() {
    echo "Extracting files from ${_cdpath}..."
    cd "${srcdir}"

    _unreal_install_files "${_cdpath}" "${pkgdir}/opt/ut" "*./System400/.*" < disk.list || return 1

    _install_patches || return 1

    echo "Decompressing maps from ${_cdpath}..."
    grep "Maps/" disk.list | sed -e "s/$/\.uz/" | _unreal_decompress_files "${_cdpath}" "${pkgdir}/opt/ut" || return 1
    grep "Maps/" disk.list | _unreal_move_files "${pkgdir}/opt/ut/System" "${pkgdir}/opt/ut" || return 1
    rm -f -- "${pkgdir}/opt/ut/System/ucc.log"
}

# Install files from the Unreal Anthology DVD.
_build_anthology() {
    echo "Extracting files from ${_cdpath}..."
    cd "${srcdir}"

    ln -fs -- ${_cdpath}/Disk*/data* -t . || return 1
    unshield -g 3_UnrealTournament_Help -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_Maps -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_Music -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_Sounds_All -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_Sounds_English -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_System_All -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_System_English -d dvd x data1.hdr || return 1
    unshield -g 3_UnrealTournament_Textures -d dvd x data1.hdr || return 1
    _unreal_move_files dvd "${pkgdir}/opt/ut" < disk.list || return 1
    _install_patches || return 1
}

# Add files for running UT on Linux, apply the patches shipped by Loki and add
# some third party fixes.
_install_patches() {
    echo "Adding Loki's Linux runtime files..."
    cd "${srcdir}"

    sh ./ut436.run --tar xfC 436 || return 1
    sh ./ut436goty.run --tar xfC 436goty || return 1

    cd 436goty
    zcat ../ut.svgz > ../ut.svg
    install --mode=755 -D ../ut.svg "${pkgdir}/usr/share/pixmaps/ut.svg"
    install --mode=644 -- README "${pkgdir}/opt/ut/Help/README"
    install --mode=644 -- README.Loki "${pkgdir}/opt/ut/Help/README.Loki"
    install --mode=755 -- bin/Linux/x86/ucc "${pkgdir}/opt/ut/ucc"
    install --mode=755 -- ../utcustom.sh "${pkgdir}/usr/bin/ut"
    chmod +x $pkgdir/usr/bin/ut
    ln -fs -- /opt/ut/ut "${pkgdir}ut"

    tar xfC data.tar.gz "${pkgdir}/opt/ut" --exclude=System/UnrealTournament.ini.PATCH || return 1
    chmod 644 -- "${pkgdir}/opt/ut/System/OpenGLDrv.int"
    install --mode=644 -D -- "${pkgdir}/opt/ut/System/License.int"
                             "${pkgdir}/usr/share/licenses/${pkgname}/License.int"

    tar xfC UT436-OpenGLDrv-Linux-090602.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC OpenGL.ini.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC Credits.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC NetGamesUSA.com.tar.gz "${pkgdir}/opt/ut" || return 1

    # As there is no distinction between GOTY and non-GOTY CDs yet, we just try
    # to patch everything that applies.  Also Loki's patcher is too unreliable.
    cd "${srcdir}"
    echo "Trying to apply Loki's 436 Xdelta patches..."
    _unreal_fail_safe_patcher 436/setup.data/data "${pkgdir}/opt/ut"
    _unreal_fail_safe_patcher 436goty/setup.data/data "${pkgdir}/opt/ut"

    echo "Applying 451 UTPG patch..."
    tar xfC UTPGPatch451.tar.bz2 451utpg || return 1
    _unreal_move_files 451utpg "${pkgdir}/opt/ut" < utpg.list || return 1

    # Fix a small bug until next UTPG release.  Thanks for the hint, elsixdiab.
    sed -i '/^LoadClassMismatch/s/\.%s$//' "${pkgdir}/opt/ut/System/Core.int"
}

package() {
    source /usr/lib/makepkg/unreal.sh || return 1

    if [ -z "${_cdpath}" ]; then
        _detect_cdpath || return 1
    else
        echo "Using ${_cdpath} as install medium."
    fi
    if [ -z "${_cdversion}" ]; then
        _detect_cdversion || return 1
    else
        echo "Using \"${_cdversion}\" install method."
    fi

    install --directory -- ${srcdir}/{436,436goty,451utpg} \
                           ${pkgdir}/usr/bin \
                           ${pkgdir}/opt/ut/{Help,Logs,Maps,Music,Sounds,System,Textures} \
                           ${pkgdir}/opt/ut/Web/{images,inc,plaintext/inc} || return 1
    install --mode=644 -D -- "${srcdir}/ut.desktop" \
                             "${pkgdir}/usr/share/applications/ut.desktop"
    # Update OpenGL driver to 3.6 and ALaudio
    cp $srcdir/*.so* $pkgdir/opt/ut/System

    case "${_cdversion}" in
        ("default")
            _build_default || return 1
            ;;
        ("anthology")
            _build_anthology || return 1
            ;;
        (*)
            echo "Unknown _cdversion: ${_cdversion}" >&2
            return 1
            ;;
    esac
}
