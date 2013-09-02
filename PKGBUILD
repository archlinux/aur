# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: Premysl Janouch <warriant@gmail.com>

pkgname=quake2
pkgver=r0.16.2
pkgrel=5
pkgdesc="Quake 2 engine. You need the retail .pak files to play."
url="http://www.icculus.org/quake2/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'libjpeg' 'sdl' 'libxxf86vm' 'libxxf86dga')
install="quake2.install"
source=("http://www.icculus.org/quake2/files/quake2-${pkgver}.tar.gz" \
    'http://cesium.di.uminho.pt/pub/games/quake2/source/xatrixsrc320.shar.Z' \
    'http://cesium.di.uminho.pt/pub/games/quake2/source/roguesrc320.shar.Z' \
    'ftp://ftp.idsoftware.com/idstuff/quake2/q2-3.20-x86-full-ctf.exe' \
    'http://www.icculus.org/quake2/files/maxpak.pak' \
    'http://www.icculus.org/quake2/files/pak10.pak' \
    'http://www.icculus.org/quake2/files/pak11.pak' \
    'http://www.icculus.org/quake2/files/pak12.pak' \
    'http://www.icculus.org/quake2/files/pak13.pak' \
    'http://www.icculus.org/quake2/files/pak14.pak' \
    'http://www.icculus.org/quake2/files/pak16.pak' \
    'http://www.icculus.org/quake2/files/pak17.pak' \
    'http://www.icculus.org/quake2/files/pak19.pak' \
    'quake2.sh' 'q2ded.sh' 'xatrix.sh' 'rogue.sh' 'ctf.sh' 'snd_alsa.c' \
    'gnusource.patch')
sha256sums=('98cea3cbd70bd1f195e5190d0ae047c636e00e21dbc6cc5bdee4acd52876d3e9'
            '94bf596cd85d38ea294b99ccb0ebb5e4b9776cca335001b3803e2d8407395589'
            'ceefb2fd748961cb0bc3244220f3eb09d8f7b8ca2eb32cdf9b284727a2fdc919'
            'f82197c8c8089202a4b3a85d8833b0c2e827a709d205c760369407c212488baa'
            '653569fe880f1ed5f7529483ac961b22078482e6ff0e83f4d9d1bc503c866770'
            '196dc096c1f4fd620c19a09593e5b770ddbeed7d864ca3a95383f7bf9538fbc3'
            'dcddd989b568cb28aa6c2a877d81df50a71fd9a649ce6dd44f454efe13e26a73'
            '170af42c090940c89f1bf16e8518733bc39dac070e0d42e4eacad727b37de256'
            '085b22e5a9f23299e6f0519e402711725cdac51fc399ce577d0d701df0a72681'
            '78d3b02d20f856b3a0680035b0d67a80a16bede372eef3330b58c755387ff1ff'
            'eb21fbc6d0bcd69fb1d3768bcb7f0bbff03e28c18c67f239497d15749913ded3'
            'e9585c18ec1f53b95dad833f76ac2df54586d3171e0f3a93ba7c2acce8d915be'
            'ee7d5aaee977a8dd198c61a2bcca446b2ab421ee6eaa3a18159671dd742a9540'
            'df049ce47922b5d13784f24f7e0457ec48ee1ff19254c3d6c473da684474e490'
            '238f2efc57f1dc04f604932afda4da5332c3798b689bb9edff951b8e405e8fc5'
            'ca832709e8b9dd92ff95959a884127be1804d85381f494b14713c860ae6db471'
            '8655b4216ea95d2408dcc28de53e53df587aa6959a95c62cc6d7f3eb63492202'
            'ea50ae5cca9d633fe2ad30c59beb2ad350130bdd2a78f773639794f2c12d1ed1'
            'fd434189a6242ad288e5827c8285e0dca3f26fe447be50204d4b6817cb1ae624'
            '9ac34f2bebbb6d4a19c590e00db8e5b0034b3ffe2a245a595e28ab43d65d7617')
PKGEXT='.pkg.tar'

# Computer Architecture Variable used by Quake2
[ "${CARCH}" = "i686" ] && _dirarch=i386
[ "${CARCH}" = "x86_64" ] && _dirarch=x86_64

build() {
    cd ${srcdir}

    # Create Temporary Directories
    install -d ${pkgname}-${pkgver}/src/xatrix ${pkgname}-${pkgver}/src/rogue

    # Decompress and patch The Reckoning (xatrix) and Ground Zero (rouge) Expansions
    for _addon in xatrix rogue; do
        _shar=${_addon}src320.shar

        cp ${srcdir}/${_shar}.Z ${srcdir}/${pkgname}-${pkgver}/src/${_addon}
        cd ${srcdir}/${pkgname}-${pkgver}/src/${_addon}

        # Decompress
        msg "Unpacking ${_shar}.Z"
        uncompress ${_shar}.Z

        # Remove Prompts
        /bin/sed -i -e 's:^read ans:ans=yes :' ${_shar}
        /bin/sed -i -e 's:^more <<EOF:cat <<EOF:' ${_shar}

        # Run Installer
        msg "Running ${_shar}"
        sh ${_shar}

        msg "Patching ${_addon}"

        # Patch (rogue-only)
        if [ ${_addon} = "rogue" ]; then
            /bin/sed -e "s/#include <nan.h>/#include <bits\/nan.h>/" -i g_local.h
        fi

        # Patches (Both Expansions)
        /bin/sed -e "s/extern\tint\tjacket_armor_index/static\tint\tjacket_armor_index/" -i g_local.h
        /bin/sed -e "s/extern\tint\tcombat_armor_index/static\tint\tcombat_armor_index/" -i g_local.h
        /bin/sed -e "s/extern\tint\tbody_armor_index/static\tint\tbody_armor_index/" -i g_local.h
    done

    msg "The Reckoning and Ground Zero Expansion install complete"

    cd ${srcdir}/${pkgname}-${pkgver}/

    # Patch from SVN
    cp ${srcdir}/snd_alsa.c ./src/linux/snd_alsa.c

    # x86_64 patch from Gentoo
    patch -p1 < ${srcdir}/gnusource.patch

    # libjpeg Fix
    /bin/sed -i -e 's:jpeg_mem_src:_&:' \
        ${srcdir}/${pkgname}-${pkgver}/src/ref_candygl/gl_image.c

    msg "Compiling Quake 2"

    # Compile Quake 2
    make -s BUILD_XATRIX=YES BUILD_ROGUE=YES BUILD_DEDICATED=YES BUILD_CTF=YES BUILD_QMAX=YES build_release
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/release${_dirarch}

    # Create Destination Directories
    install -d ${pkgdir}/opt/quake2/{baseq2,ctf,xatrix,rogue}

    # Install Binary
    install -m 755 quake2 ${pkgdir}/opt/quake2/quake2

    # Install Binary (SDL)
    install -m 755 sdlquake2 ${pkgdir}/opt/quake2/sdlquake2

    # Install Base Game Library
    install -m 755 game${_dirarch}.so ${pkgdir}/opt/quake2/baseq2/

    # Install CTF Library
    install -m 755 ctf/game${_dirarch}.so ${pkgdir}/opt/quake2/ctf/

    # Install Xatrix Library
    install -m 755 xatrix/game${_dirarch}.so ${pkgdir}/opt/quake2/xatrix/

    # Install Rogue Library
    install -m 755 rogue/game${_dirarch}.so ${pkgdir}/opt/quake2/rogue/

    # Install Additional Libraries
    cp ref_*.so ${pkgdir}/opt/quake2/

    cd ${srcdir}

    # Decompress and Install CTF Patch Data
    mkdir ${srcdir}/q2
    cp ${srcdir}/q2-3.20-x86-full-ctf.exe ${srcdir}/q2
    cd ${srcdir}/q2
    unzip -L q2-3.20-x86-full-ctf.exe
    cp baseq2/pak1.pak baseq2/pak2.pak ${pkgdir}/opt/quake2/baseq2/
    cp -r baseq2/players ${pkgdir}/opt/quake2/baseq2/
    cp ctf/* ${pkgdir}/opt/quake2/ctf/

    # Install Q2Max Pak File
    install ${srcdir}/maxpak.pak ${pkgdir}/opt/quake2/baseq2/

    # Install Additional pak Files
    for i in {10,11,12,13,14,16,17,19}; do
        install -m 644 ${srcdir}/pak${i}.pak \
            ${pkgdir}/opt/quake2/baseq2/pak${i}.pak
    done;

    # Install Game Launchers
    install -D -m 755 ${srcdir}/quake2.sh ${pkgdir}/usr/bin/quake2
    install -D -m 755 ${srcdir}/q2ded.sh  ${pkgdir}/usr/bin/q2ded
    install -D -m 755 ${srcdir}/xatrix.sh ${pkgdir}/usr/bin/quake2-the-reckoning
    install -D -m 755 ${srcdir}/rogue.sh  ${pkgdir}/usr/bin/quake2-ground-zero
    install -D -m 755 ${srcdir}/ctf.sh    ${pkgdir}/usr/bin/quake2-ctf
}

