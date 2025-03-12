# Contributor: quantax -- contact via Arch Linux forum or AUR
#              M0Rf30
# Mantainer: XenGi
pkgname=unrealtournament
pkgver=469e_rc7
pkgrel=6
pkgdesc="The classic Unreal Tournament from 1999 (GOTY + OldUnreal patches)"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.unrealtournament.com/"
license=('custom')
conflicts=('unrealtournament-bonuspack1' 'unrealtournament-bonuspack2' 'unrealtournament-bonuspack3')
depends=('libfmod' 'libxmp' 'mpg123' 'openal' 'sdl2' 'sdl2_ttf')
makedepends=('libarchive' # bsdtar: unpack ISO
             'zstd') # zstdcat: unpack SVG
source=("ut.desktop"
        "ut.svg.zstd"
        "https://archive.org/download/ut-goty/UT_GOTY_CD1.iso"
        "https://archive.org/download/ut-goty/UT_GOTY_CD2.iso")
source_i686=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-x86.tar.bz2")
source_x86_64=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-amd64.tar.bz2")
source_aarch64=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver//_/-}/OldUnreal-UTPatch${pkgver%%_*}-Linux-arm64.tar.bz2")
noextract=("OldUnreal-UTPatch${pkgver%%_*}-Linux-x86.tar.bz2"
           "OldUnreal-UTPatch${pkgver%%_*}-Linux-amd64.tar.bz2"
           "OldUnreal-UTPatch${pkgver%%_*}-Linux-arm64.tar.bz2")
sha256sums=('fea5efdcac67564f2b5b8ef215115990739243a53a5f86e67f9414081d5b28dc'
            '8fc6bc71f20b8395d75fad8b30d18fc6c9d39fee1f9633be090ad8fd779e8827'
            'e184984ca88f001c5ddd52035d76cd64e266e26c74975161b5ed72366c74704f'
            'd95d8ee1cf95562ee023fd54035ec8813d4275f63d1847423220986edc8d00d8')
sha256sums_i686=('3742e1f281ea47f9d47dcef91b4fb6b36a55a0581128b48b782c84b2e960a408')
sha256sums_x86_64=('65359b2b1778a6c24c380dbab04a3fb0ebe345252d450a63fbc3a6b8789bc3a4')
sha256sums_aarch64=('927e4fa6e8b5c6ac0aa6fa9f2af76404644e103815832ccfa9bb16b7425193e6')

package() {
    # Create game directory
    install --mode=755 -d -- ${pkgdir}/opt/ut/{Music,Sounds,Maps}

    # Set system directory and unpack patch into game directory
    if [ "$CARCH" = "i686" ]; then
        _system_dir=/opt/ut/System
        tar xaf ${srcdir}/OldUnreal-UTPatch${pkgver%%_*}-Linux-x86.tar.bz2 -C ${pkgdir}/opt/ut
    elif [ "$CARCH" = "x86_64" ]; then
        _system_dir=/opt/ut/System64
        tar xaf ${srcdir}/OldUnreal-UTPatch${pkgver%%_*}-Linux-amd64.tar.bz2 -C ${pkgdir}/opt/ut
    elif [ "$CARCH" = "aarch64" ]; then
        _system_dir=/opt/ut/System64
        tar xaf ${srcdir}/OldUnreal-UTPatch${pkgver%%_*}-Linux-arm64.tar.bz2 -C ${pkgdir}/opt/ut
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

    # Copy the Music and Sounds directories from the iso into the game directory
    install --mode=644 -t ${pkgdir}/opt/ut/Music ${srcdir}/Music/*
    install --mode=644 -t ${pkgdir}/opt/ut/Sounds ${srcdir}/Sounds/*

    # Copy the contents of the Textures directory from the distribution directory into the existing Textures directory
    # within your game directory WITHOUT REPLACING the existing files
    cp -n ${srcdir}/Textures/* ${pkgdir}/opt/ut/Textures/ || true
    # fix permissions
    chmod 644 ${pkgdir}/opt/ut/Textures/*

    # Create a Maps directory within the game directory and copy over the unpacked Maps (i.e., map files with a .unr
    # extension) from the distribution directory
    install --mode=644 -t ${pkgdir}/opt/ut/Maps ${srcdir}/Maps/*.unr

    # Extract all compressed maps (i.e., maps with a .uz extension) into your game's Maps directory as follows.
    # If there are no compressed maps in your game distribution folder, you may ignore this step.
    #for i in /mnt/Maps/*.uz; do ./System64/ucc-bin decompress $i; done
    find ${srcdir}/Maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} -nohomedir \;
    set -- ${pkgdir}${_system_dir}/*.unr
    [ -f "$1" ] && mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}/opt/ut/Maps
    # CD2 has a lower case maps directory
    find ${srcdir}/maps/ -name "*.uz" -exec ${pkgdir}${_system_dir}/ucc-bin decompress {} -nohomedir \;
    set -- ${pkgdir}${_system_dir}/*.unr
    [ -f "$1" ] && mv ${pkgdir}${_system_dir}/*.unr ${pkgdir}/opt/ut/Maps

    # cleanup
    rm ${pkgdir}${_system_dir}/ucc.log

    install --mode 755 -d -- ${pkgdir}/usr/bin
    ln -s ${_system_dir}/ut-bin ${pkgdir}/usr/bin/ut
    install --mode=755 -d -- "${pkgdir}/usr/share/pixmaps"
    zstdcat "${srcdir}/ut.svg.zstd" > "${pkgdir}/usr/share/pixmaps/ut.svg"
    install --mode=644 -D -- "${srcdir}/ut.desktop" "${pkgdir}/usr/share/applications/ut.desktop"
    install --mode=644 -D -- "${pkgdir}/opt/ut/LICENSE.md" "${pkgdir}/usr/share/licenses/unrealtournament/LICENSE.md"

    # fix ownership
    chown -R root:root ${pkgdir}/opt/ut
}

