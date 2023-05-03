# Contributor: quantax -- contact via Arch Linux forum or AUR
#              M0Rf30
# Mantainer: XenGi
pkgname=unrealtournament
pkgver=469c
pkgrel=2
pkgdesc="The classic Unreal Tournament from 1999 (Retail CD or DVD required)"
arch=('i686' 'x86_64')
url="http://www.unrealtournament.com/"
license=('custom')
optdepends=('innoextract: Extract GOG release')
source=("ut.desktop"
        "ut.svg.zstd")
source_i686+=("OldUnreal-UTPatch${pkgver}-Linux.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2")
source_x86_64+=("OldUnreal-UTPatch${pkgver}-Linux.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2")
noextract=("OldUnreal-UTPatch${pkgver}-Linux.tar.bz2")
sha256sums=('fea5efdcac67564f2b5b8ef215115990739243a53a5f86e67f9414081d5b28dc'
            '8fc6bc71f20b8395d75fad8b30d18fc6c9d39fee1f9633be090ad8fd779e8827')
sha256sums_i686+=('30978800c100e8c5a20fbc66a04b9e12f843424b3a811b04e6fb8e1b6b5d6543')
sha256sums_x86_64+=('4c99bde06d26b724f14471d374d4d6105dbdc98c56ec2a40af3fa541956eeed9')

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
    fi

    # Set game destination
    export _game_dir="/opt/ut"
}

package() {
    # Create game directory
    install --mode 755 -d -- ${pkgdir}${_game_dir}

    # Unpack patch into game directory
    tar xaf ${srcdir}/OldUnreal-UTPatch${pkgver}-Linux.tar.bz2 -C ${pkgdir}${_game_dir}

    # Copy the Music and Sounds directories from the distribution directory into the game directory
    cp -r ${_dist_dir}/Music/ ${pkgdir}${_game_dir}
    cp -r ${_dist_dir}/Sounds/ ${pkgdir}${_game_dir}

    # Copy the contents of the Textures directory from the distribution directory into the existing Textures directory
    # within your game directory WITHOUT REPLACING the existing files
    cp -n ${_dist_dir}/Textures/* ${pkgdir}${_game_dir}/Textures/ || true

    # Create a Maps directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr
    # extension) from the distribution directory
    install --mode=755 -d -- ${pkgdir}${_game_dir}/Maps
    cp ${_dist_dir}/Maps/*.unr ${pkgdir}${_game_dir}/Maps/

    # Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory as follows.
    # If there are no compressed maps in your game distribution folder, you may ignore this step.
    #for i in /mnt/Maps/*.uz; do ./System64/ucc-bin decompress $i; done
    [ "$CARCH" = "i686" ] && _system_dir=${_game_dir}/System
    [ "$CARCH" = "x86_64" ] && _system_dir=${_game_dir}/System64

    find ${_dist_dir}/Maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} \;
    #find ${_dist_dir}/Maps/ -name "*.uz" -exec sh -c "mv ${pkgdir}${_system_dir}/\$\{1%\} ${pkgdir}${_game_dir}/Maps/" _ {}\;

    install --mode 755 -d -- ${pkgdir}/usr/bin
    ln -s ${_system_dir}/ut-bin ${pkgdir}/usr/bin/ut
    install --mode=755 -d -- "${pkgdir}/usr/share/pixmaps"
    zstdcat "${srcdir}/ut.svg.zstd" > "${pkgdir}/usr/share/pixmaps/ut.svg"
    install --mode=644 -D -- "${srcdir}/ut.desktop" "${pkgdir}/usr/share/applications/ut.desktop"
}

