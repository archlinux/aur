# Contributor: quantax -- contact via Arch Linux forum or AUR
#              M0Rf30
# Mantainer: XenGi
pkgname=unrealtournament
pkgver=469b
pkgrel=3
pkgdesc="The classic Unreal Tournament from 1999 (Retail CD or DVD required)"
arch=('i686' 'x86_64')
url="http://www.unrealtournament.com/"
license=('custom')
groups=(ut1999-goty)
[ "$CARCH" = "i686" ] && depends=(libnotify sdl libgl)
[ "$CARCH" = "x86_64" ] &&  depends=(libnotify lib32-sdl lib32-libgl)
makedepends=(makepkg-unreal unshield lib32-fakeroot)
provides=(ut1999)
conflicts=(ut1999 ut ut-server)
source=("ut436.run::https://gitlab.com/XenGi/oldgames/-/raw/master/ut/unreal.tournament_436-multilanguage.run"
        "ut436goty.run::https://gitlab.com/XenGi/oldgames/-/raw/master/ut/unreal.tournament_436-multilanguage.goty.run"
        "https://gitlab.com/XenGi/oldgames/-/raw/master/ut/ALAudio-86eade1c.zip"
	    "https://gitlab.com/XenGi/oldgames/-/raw/master/ut/OpenGLDrv-3.6-86eade1c.zip"
        "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux.tar.bz2"
        "ut.desktop"
        "disk.list"
        "utcustom.sh"
        "https://gitlab.com/XenGi/oldgames/raw/master/ut/ut.svgz")
noextract=("OldUnreal-UTPatch${pkgver}-Linux.tar.bz2")
sha256sums=('8c0f0e266744ed18b14f6f6777d9ce8ed3ece120ccc37e7bbffa92e5a92ad2a8'
            'cb704cf21625c12eaf181fabd24297bcf1f51576afa691067a56e3e6f38f6d34'
            '674ae459b3ff6d442cce0e4b115244f3db5384923e6b848626aa67b370b7148b'
            'b985a79323bee32ad24cce30afbfe63c47dcd43e3e06fa226b3ea42bbc4b0c0e'
            '99b0832dfa5e8122b79c05b0d3cd22a277e36b865a1079941ee62c986cd92c1f'
            '9aac034bbfe75afc1bbcc1f280025d6c36d77d4e00e68a3b11a2e3855f37756e'
            'e31d9c7b91254128214dfa606058b78ece25a5a10fe2a2b8fd19575a9c7b2dbb'
            'ad9dca0d55bea773f573ff5f216c8010fd629c8785b6873a22c10172fbd10424'
            '75ed2ef644f5e7100553241f195247dcad58d59a63b855d6895d421fdbfb9c1a')

# You can uncomment and set these two variables in order to override the auto
# detection done in build() by _detect_cdpath() and _detect_cdversion().
#_cdpath="/mnt"    # path to your mounted UT CD or DVD
#_cdversion="" # "default" or "anthology"

# Detect the mount point of the install medium.
_detect_cdpath() {
    echo "Searching for mount point of install medium..."

    for mountpoint in $(egrep "(iso9660|udf)" /etc/mtab | awk '{print $2}'); do
        if [ -f "${mountpoint}/SYSTEM/UnrealTournament.exe" ] || [ -f "${mountpoint}/Disk1/data1.hdr" ]; then
            _cdpath="${mountpoint}"
            break
        fi
    done

    if [ -z "${_cdpath}" ]; then
	    cat << EOF >&2
No mounted valid Unreal Tournament CD or Unreal Anthology
DVD has been detected while scanning all "iso9660"
and all "udf" filesystems in "/etc/mtab" for the file
"SYSTEM/UnrealTournament.exe" or the file "Disk1/data1.hdr".
Make sure you mounted the right disk correctly.  If it still
doesn't work you can try setting the "_cdpath" and/or the
"_cdversion" variable in this PKGBUILD to your mount point and
your version of UT manually.
EOF
        return 1
    else
        echo "${_cdpath} looks promising."
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
    install --mode=644 -D -- "${pkgdir}/opt/ut/System/License.int" \
                             "${pkgdir}/usr/share/licenses/${pkgname}/License.int"

    tar xfC UT436-OpenGLDrv-Linux-090602.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC OpenGL.ini.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC Credits.tar.gz "${pkgdir}/opt/ut" || return 1
    tar xfC NetGamesUSA.com.tar.gz "${pkgdir}/opt/ut" || return 1

    # As there is no distinction between GOTY and non-GOTY CDs yet, we just try
    # to patch everything that applies. Also Loki's patcher is too unreliable.
    cd "${srcdir}"
    echo "Trying to apply Loki's 436 Xdelta patches..."
    _unreal_fail_safe_patcher 436/setup.data/data "${pkgdir}/opt/ut"
    _unreal_fail_safe_patcher 436goty/setup.data/data "${pkgdir}/opt/ut"

    echo "Applying OldUnreal patch"
    tar xfC OldUnreal-UTPatch${pkgver}-Linux.tar.bz2 "${pkgdir}/opt/ut"
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
