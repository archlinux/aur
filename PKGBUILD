# Contributor: quantax -- contact via Arch Linux forum or AUR
#              M0Rf30
# Mantainer: XenGi
pkgname=unrealtournament
pkgver=469d
pkgrel=1
pkgdesc="The classic Unreal Tournament from 1999 (Retail CD or DVD required)"
arch=('i686' 'x86_64')
url="http://www.unrealtournament.com/"
license=('custom')
depends=('libfmod' 'libxmp' 'mpg123' 'openal' 'sdl2' 'sdl2_ttf')
optdepends=('innoextract: Extract GOG release')
source=("ut.desktop"
        "ut.svg.zstd")
source_i686=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2")
source_x86_64=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2")
noextract=("OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2" "OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2")
sha256sums=('fea5efdcac67564f2b5b8ef215115990739243a53a5f86e67f9414081d5b28dc'
            '8fc6bc71f20b8395d75fad8b30d18fc6c9d39fee1f9633be090ad8fd779e8827')
sha256sums_i686=('d49b052ae0008ff2ed62f3943c5bb41e7fb3bd8deb896d189496cb77852768a5')
sha256sums_x86_64=('6a81b35ae6a4c0dfce2f8fb152af16129776735aeb34dfc391f7c8daf0d51a3b')

prepare() {
    # Mount the UT (GOTY) cd/image or unpack the GOG distribution with the innoextract tool.
    # We will refer to the root directory of your game cd/image or GOG distribution as the distribution directory.
    echo "Searching for mount point of install medium..."
    for mountpoint in $(grep -E "(iso9660|udf)" /etc/mtab | awk '{print $2}'); do
        if [ -f "${mountpoint}/SYSTEM/UnrealTournament.exe" ]; then
            export _dist_dir="${mountpoint}"
            break
        fi
    done

    # #########################################################################
    # Set the path to your extracted GOG dirtectory here if needed:
    #export _dist_dir=""
    # #########################################################################

    if [ -z "${_dist_dir}" ]; then
	    cat << EOF >&2
No mounted valid Unreal Tournament CD has been detected while scanning all
"iso9660" and all "udf" filesystems in "/etc/mtab" for the file
"SYSTEM/UnrealTournament.exe". Make sure you mounted the disk correctly.
If it still doesn't work you can try setting the "_dist_dir" variable in this
PKGBUILD to your mount point or GOG directory manually. For the GOG release,
use the innoextract tool and set the variable to the output directory.
EOF
        return 1
    else
        echo "${_dist_dir} looks promising."
        rm -f ${srcdir}/dist_dir
        ln -s ${_dist_dir} ${srcdir}/dist_dir
    fi
}

package() {
    # Set game destination
    export _game_dir="/opt/ut"

    [ "$CARCH" = "i686" ] && _system_dir=${_game_dir}/System
    [ "$CARCH" = "i686" ] && _srctar=OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2
    [ "$CARCH" = "x86_64" ] && _system_dir=${_game_dir}/System64
    [ "$CARCH" = "x86_64" ] && _srctar=OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2

    # Create game directory
    install --mode=755 -d -- ${pkgdir}${_game_dir}/{Music,Sounds,Maps}

    # Unpack patch into game directory
    tar xaf ${srcdir}/${_srctar} -C ${pkgdir}${_game_dir}
    # fix permissions
    find ${pkgdir}${_game_dir} -type d -exec chmod 755 {} \;

    # Remove bundled libraries to use native versions instead
    rm ${pkgdir}${_system_dir}/libfmod.so*
    rm ${pkgdir}${_system_dir}/libmpg123.so*
    rm ${pkgdir}${_system_dir}/libopenal.so*
    rm ${pkgdir}${_system_dir}/libSDL2*
    rm ${pkgdir}${_system_dir}/libxmp.so*

    # Copy the Music and Sounds directories from the distribution directory into the game directory
    install --mode=644 -t ${pkgdir}${_game_dir}/Music ${srcdir}/dist_dir/Music/*
    install --mode=644 -t ${pkgdir}${_game_dir}/Sounds ${srcdir}/dist_dir/Sounds/*

    # Copy the contents of the Textures directory from the distribution directory into the existing Textures directory
    # within your game directory WITHOUT REPLACING the existing files
    cp -n ${srcdir}/dist_dir/Textures/* ${pkgdir}${_game_dir}/Textures/ || true
    # fix permissions
    chmod 644 ${pkgdir}${_game_dir}/Textures/*

    # Create a Maps directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr
    # extension) from the distribution directory
    install --mode=644 -t ${pkgdir}${_game_dir}/Maps ${srcdir}/dist_dir/Maps/*.unr

    # Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory as follows.
    # If there are no compressed maps in your game distribution folder, you may ignore this step.
    #for i in /mnt/Maps/*.uz; do ./System64/ucc-bin decompress $i; done
    find ${srcdir}/dist_dir/Maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} -nohomedir \;
    set -- ${pkgdir}${_system_dir}/*.unr
    [ -f "$1" ] && mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}${_game_dir}/Maps

    install --mode 755 -d -- ${pkgdir}/usr/bin
    ln -s ${_system_dir}/ut-bin ${pkgdir}/usr/bin/ut
    install --mode=755 -d -- "${pkgdir}/usr/share/pixmaps"
    zstdcat "${srcdir}/ut.svg.zstd" > "${pkgdir}/usr/share/pixmaps/ut.svg"
    install --mode=644 -D -- "${srcdir}/ut.desktop" "${pkgdir}/usr/share/applications/ut.desktop"
    install --mode=644 -D -- "${pkgdir}${_game_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/unrealtournament/LICENSE.md"

    # fix ownership
    chown -R root:root ${pkgdir}${_game_dir}

    # remove symlink
    rm ${srcdir}/dist_dir
}

