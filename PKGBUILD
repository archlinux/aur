# Contributor: quantax -- contact via Arch Linux forum or AUR
#              M0Rf30
# Mantainer: XenGi
pkgname=unrealtournament
pkgver=469e_rc9
pkgrel=1
pkgdesc="The classic Unreal Tournament from 1999 (GOTY + OldUnreal patches)"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.unrealtournament.com/"
license=('custom')
conflicts=('unrealtournament-bonuspack1' 'unrealtournament-bonuspack2' 'unrealtournament-bonuspack3')
depends=('libfmod' 'libxmp' 'mpg123' 'openal' 'sdl2-compat' 'sdl2_ttf')
makedepends=('libarchive' # bsdtar: unpack ISO
             'zstd') # zstdcat: unpack SVG
source=("ut.desktop"
        "ut.svg.zstd"
        "UnrealTournament.ini"
        "User.ini"
        "ut-wrapper.sh"
        "https://archive.org/download/ut-goty/UT_GOTY_CD1.iso"
        "https://archive.org/download/ut-goty/UT_GOTY_CD2.iso")
source_i686=("OldUnreal-UTPatch-${pkgver//_/-}-Linux-x86.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-x86.tar.bz2")
source_x86_64=("OldUnreal-UTPatch-${pkgver//_/-}-Linux-amd64.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-amd64.tar.bz2")
source_aarch64=("OldUnreal-UTPatch-${pkgver//_/-}-Linux-arm64.tar.bz2::https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-arm64.tar.bz2")
noextract=("OldUnreal-UTPatch-${pkgver//_/-}-Linux-x86.tar.bz2"
           "OldUnreal-UTPatch-${pkgver//_/-}-Linux-amd64.tar.bz2"
           "OldUnreal-UTPatch-${pkgver//_/-}-Linux-arm64.tar.bz2"
           "UT_GOTY_CD1.iso"
           "UT_GOTY_CD2.iso")
sha256sums=('fea5efdcac67564f2b5b8ef215115990739243a53a5f86e67f9414081d5b28dc'
            '8fc6bc71f20b8395d75fad8b30d18fc6c9d39fee1f9633be090ad8fd779e8827'
            'b03456f17f3e50627b3193519166aa554b5ee9aa6c8df37b0cc333708a949bda'
            '66e96135314ab34b18a7b2041b6570fc4f3f8e9ed76a416bb019cf34e1b961d7'
            'b944b7dec13b3b96230997695c8892ab06b764f004636629b72133d58aa8000f'
            'e184984ca88f001c5ddd52035d76cd64e266e26c74975161b5ed72366c74704f'
            'd95d8ee1cf95562ee023fd54035ec8813d4275f63d1847423220986edc8d00d8')
sha256sums_i686=('69fa43b65534d6d1291a77e089c856aac523f342e4d8afffb3fea2caa4bf56af')
sha256sums_x86_64=('d611168948e0cdbd66293b3fda9dbf5a18fc15da6aa6f7da0ed5dfeb74bf5b8e')
sha256sums_aarch64=('6586f0c1e7e7e627f3cfdae4c7d5fc3d2572d5cf2dd99db8557b7a76282752d8')

prepare() {
    # Extract ISOs manually because makepkg would extract them into the same dir and overwrite the contents
    mkdir -p ${srcdir}/cd1 ${srcdir}/cd2
    bsdtar -x -f ${srcdir}/UT_GOTY_CD1.iso -C ${srcdir}/cd1
    bsdtar -x -f ${srcdir}/UT_GOTY_CD2.iso -C ${srcdir}/cd2
}

package() {
    # Create game directory
    install --mode=755 -d -- ${pkgdir}/opt/ut/{Music,Sounds,Maps}

    # Set system directory and unpack patch into game directory
    if [ "$CARCH" = "i686" ]; then
        _system_dir=/opt/ut/System
        tar xaf ${srcdir}/OldUnreal-UTPatch-${pkgver//_/-}-Linux-x86.tar.bz2 -C ${pkgdir}/opt/ut
    elif [ "$CARCH" = "x86_64" ]; then
        _system_dir=/opt/ut/System64
        tar xaf ${srcdir}/OldUnreal-UTPatch-${pkgver//_/-}-Linux-amd64.tar.bz2 -C ${pkgdir}/opt/ut
    elif [ "$CARCH" = "aarch64" ]; then
        _system_dir=/opt/ut/System64
        tar xaf ${srcdir}/OldUnreal-UTPatch-${pkgver//_/-}-Linux-arm64.tar.bz2 -C ${pkgdir}/opt/ut
    fi

    # fix permissions
    find ${pkgdir}/opt/ut -type d -exec chmod 755 {} \;

    # Remove bundled libraries to use native versions instead
    rm -f \
        ${pkgdir}${_system_dir}/libfmod.so* \
        ${pkgdir}${_system_dir}/libmpg123.so* \
        ${pkgdir}${_system_dir}/libopenal.so* \
        ${pkgdir}${_system_dir}/libSDL2* \
        ${pkgdir}${_system_dir}/libxmp.so*

    # Copy the Music and Sounds directories from the isos into the game directory
    install --mode=644 -t ${pkgdir}/opt/ut/Music ${srcdir}/cd1/Music/*
    install --mode=644 -t ${pkgdir}/opt/ut/Sounds ${srcdir}/cd1/Sounds/*
    install --mode=644 -t ${pkgdir}/opt/ut/Sounds ${srcdir}/cd2/Sounds/*

    # Copy the contents of the Textures directory from the distribution directory into the existing Textures directory
    # within your game directory WITHOUT REPLACING the existing files
    cp --update=none ${srcdir}/cd1/Textures/* ${srcdir}/cd2/Textures/* ${pkgdir}/opt/ut/Textures/
    # fix permissions
    chmod 644 ${pkgdir}/opt/ut/Textures/*

    # Create a Maps directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr
    # extension) from the distribution directory
    install --mode=644 -t ${pkgdir}/opt/ut/Maps ${srcdir}/cd1/Maps/*.unr

    # Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory.
    #find ${srcdir}/Maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} -nohomedir \;
    #set -- ${pkgdir}${_system_dir}/*.unr
    #[ -f "$1" ] && mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}/opt/ut/Maps
    ## CD2 has a lower case maps directory
    #find ${srcdir}/maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} -nohomedir \;
    #set -- ${pkgdir}${_system_dir}/*.unr
    #[ -f "$1" ] && mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}/opt/ut/Maps
    # Uncompressing maps in parallel
    for map in ${srcdir}/{cd1/Maps,cd2/maps}/*.uz; do
        ${pkgdir}${_system_dir}/ucc-bin decompress $map -nohomedir >/dev/null &
    done
    wait
    mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}/opt/ut/Maps

    # cleanup
    rm ${pkgdir}${_system_dir}/ucc.log

    # copy optimized default config
    install --mode=644 -t ${pkgdir}${_system_dir} ${srcdir}/UnrealTournament.ini
    install --mode=644 -t ${pkgdir}${_system_dir} ${srcdir}/User.ini

    # Copy the .u and .int files from CD2 to the game's System directory.
    install --mode=644 -t ${pkgdir}${_system_dir} ${srcdir}/cd2/System/*.u
    install --mode=644 -t ${pkgdir}${_system_dir} ${srcdir}/cd2/System/*.int

    #install --mode 755 -d -- ${pkgdir}/usr/bin
    #ln -s ${_system_dir}/ut-bin ${pkgdir}/usr/bin/ut
    install --mode=755 -D -- "${srcdir}/ut-wrapper.sh" "${pkgdir}/usr/bin/ut"
    install --mode=755 -d -- "${pkgdir}/usr/share/pixmaps"
    zstdcat "${srcdir}/ut.svg.zstd" > "${pkgdir}/usr/share/pixmaps/ut.svg"
    install --mode=644 -D -- "${srcdir}/ut.desktop" "${pkgdir}/usr/share/applications/ut.desktop"
    #install --mode=644 -D -- "${srcdir}/ut-wayland.desktop" "${pkgdir}/usr/share/applications/ut-wayland.desktop"
    install --mode=644 -D -- "${pkgdir}/opt/ut/LICENSE.md" "${pkgdir}/usr/share/licenses/unrealtournament/LICENSE.md"

    # fix ownership
    chown -R root:root ${pkgdir}/opt/ut
}

