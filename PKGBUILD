# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

# Build with fmodex:
_fmodex=fmodex
# Build without fmodex:
#_fmodex=

# Build with OpenAL:
_openal=openal
# Build without OpenAL:
#_openal=

_name=gzdoom
pkgname=${_name}
pkgver=2.2.0
pkgrel=2
pkgdesc='Advanced Doom source port with OpenGL support'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=('fluidsynth'
         ${_fmodex:+$(LC_ALL=C pacman -Q $_fmodex | sed -r 's/ /=/;s/-.*$//')}
         'gtk2'
         'libgl'
         'libgme'
         ${_openal:+'libsndfile'}
         ${_openal:+'mpg123'}
         ${_openal}
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'git'
             'imagemagick'
             'xdg-utils')
makedepends_i686=('nasm')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedoom: FreeDoom game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdebase-kdialog: crash dialog (KDE)'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
source=("${_name}::git://github.com/coelckers/${_name}.git#tag=g${pkgver}"
        'launcher.desktop')
_srcsubdir="${_name}"
sha256sums=('SKIP'
            '59122e670f72aa2531aff370e7aaab2d886a7642e79e91f27a533d3b4cad4f6d')

build() {
    cd "${_srcsubdir}"

    local _nofmod _noopenal _fmodincdir _fmodlib

    if [[ -n "${_fmodex}" ]]; then
        _nofmod=OFF
        _fmodincdir=$(LC_ALL=C pacman -Ql $_fmodex | grep -Eo '/usr/include/fmodex[^/]*/$')
        _fmodlib=$(LC_ALL=C pacman -Ql $_fmodex | grep -Eo '/usr/lib/libfmodex-[^/]*\.so$')
    else
        _nofmod=ON
    fi

    if [[ -n "${_openal}" ]]; then
        _noopenal=OFF
    else
        _noopenal=ON
    fi

    cmake -DNO_FMOD=${_nofmod} \
          -DNO_OPENAL=${_noopenal} \
          -DGME_INCLUDE_DIR='/usr/include/gme' \
          -DFMOD_INCLUDE_DIR="${_fmodincdir}" \
          -DFMOD_LIBRARY="${_fmodlib}" \
          -DFORCE_INTERNAL_GME=OFF \
          -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          .
    make

    cat >"${_name}.sh" <<EOF
#!/bin/sh
exec /usr/lib/${_name}/${_name} "\$@"
EOF

    sed -n '/\*\*-/,/\*\*-/p' 'src/version.h' >'bsd.txt'

    cp "${srcdir}/launcher.desktop" "${_name}.desktop"

    mkdir -p 'icons'
    convert 'src/win32/icon1.ico[2]' 'icons/48.png'
    convert 'src/win32/icon1.ico[3]' 'icons/32.png'
    convert 'src/win32/icon1.ico[4]' 'icons/16.png'
}

package() {
    cd "${_srcsubdir}"

    install -D "${_name}.sh" "${pkgdir}/usr/bin/${_name}"

    mkdir -p "${pkgdir}/usr/lib/${_name}"
    install "${_name}" "${pkgdir}/usr/lib/${_name}/"
    install -m644 "${_name}.pk3" "${pkgdir}/usr/lib/${_name}/"
    if [[ -n "${_fmodex}" ]]; then
        install 'liboutput_sdl.so' "${pkgdir}/usr/lib/${_name}/"
    fi
    ln -s '/usr/share/doom/doom.wad' "${pkgdir}/usr/lib/${_name}/freedoomu.wad"
    ln -s '/usr/share/doom/doom2.wad' "${pkgdir}/usr/lib/${_name}/freedoom.wad"
    ln -s '/usr/share/doom/heretic.wad' "${pkgdir}/usr/lib/${_name}/blasphemer.wad"
    ln -s '/usr/share/doom/hexen.wad' "${pkgdir}/usr/lib/${_name}/hexendemo.wad"

    mkdir -p "${pkgdir}/usr/share/${_name}"
    install -m644 'brightmaps.pk3' "${pkgdir}/usr/share/${_name}/"
    install -m644 'lights.pk3' "${pkgdir}/usr/share/${_name}/"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 'bsd.txt' "${pkgdir}/usr/share/licenses/${pkgname}/bsd.txt"
    install -m644 'docs/BUILDLIC.TXT' "${pkgdir}/usr/share/licenses/${pkgname}/buildlic.txt"
    install -m644 'docs/doomlic.txt' "${pkgdir}/usr/share/licenses/${pkgname}/doomlic.txt"
    install -m644 'dumb/licence.txt' "${pkgdir}/usr/share/licenses/${pkgname}/dumb.txt"

    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${_name}.desktop"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    (
        cd 'icons'
        export XDG_DATA_DIRS="${pkgdir}/usr/share"

        local _file
        for _file in *.png; do
            xdg-icon-resource install --noupdate \
                                      --novendor \
                                      --size "${_file%.png}" \
                                      "${_file}" \
                                      "${_name}"
        done
    )
}
