# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

# Build with the recommended fmodex version:
_fmodex=4.26.36
# Build with the currently installed fmodex version:
#_fmodex=$(LC_ALL=C pacman -Q fmodex | grep -Po '(?<= ).+(?=-)')
# Build without fmodex:
#_fmodex=

# Build with OpenAL:
_openal=1
# Build without OpenAL:
#_openal=

_name=gzdoom
pkgname=${_name}
pkgver=2.1.1
pkgrel=1
_label='GZDoom'
_desc='Advanced Doom source port with OpenGL support'
pkgdesc="${_desc}"
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=('fluidsynth'
         ${_fmodex:+"fmodex=$_fmodex"}
         'gtk2'
         'gxmessage'
         'libgl'
         'libgme'
         ${_openal:+'libsndfile'}
         ${_openal:+'mpg123'}
         ${_openal:+'openal'}
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
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data')
install=install
source=("${_name}::git://github.com/coelckers/${_name}.git#tag=g${pkgver}"
        'desktop.template'
        '0001-Mark-stack-as-not-executable-in-assembler-sources.patch'
        '0002-Include-SHARE_DIR-in-IWADSearch.Directories.patch')
_srcsubdir="${_name}"
sha256sums=('SKIP'
            'f2c58925238fe0d01e630527c8c4431681ccaec2d763ba075429b747d1a98a8c'
            '695a17860f7f71789f085da02022f9926a098b570c4672c6c9bf23556caceb72'
            '23ded6a031724252d4ba442dabd4c79dcbec053594adc9fd6a91e8871ce69f85')

prepare() {
    cd "${_srcsubdir}"

    local _file
    for _file in "${source[@]}"; do
        if [[ "${_file}" == *.patch ]]; then
            patch -p1 <"${srcdir}/${_file}"
        fi
    done
}

build() {
    cd "${_srcsubdir}"

    cat >"${_name}.sh" <<EOF
#!/bin/sh
exec /usr/lib/${_name}/${_name} "\$@"
EOF

    local _nofmod _noopenal _fmodincdir

    if [[ -n "${_fmodex}" ]]; then
        _nofmod=OFF

        _fmodincdir="/usr/include/fmodex-${_fmodex}"
        if [[ ! -e "${_fmodincdir}" ]]; then
            _fmodincdir='/usr/include/fmodex'
        fi
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
          -DFMOD_LIBRARY="/usr/lib/libfmodex-${_fmodex}.so" \
          -DFORCE_INTERNAL_GME=OFF \
          -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          .
    make

    sed -n '/\*\*-/,/\*\*-/p' 'src/version.h' >'bsd.txt'

    cp "${srcdir}/desktop.template" "${_name}.desktop"
    desktop-file-edit --set-name="${_label}" \
                      --set-generic-name="${_desc}" \
                      --set-icon="${_name}" \
                      --set-key=Exec --set-value="${_name} %F" \
                      "${_name}.desktop"

    mkdir 'icons'
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

    mkdir -p "${pkgdir}/usr/share/${_name}"
    install -m644 'brightmaps.pk3' "${pkgdir}/usr/share/${_name}/"
    install -m644 'lights.pk3' "${pkgdir}/usr/share/${_name}/"
    ln -s '/usr/share/doom/doom.wad' "${pkgdir}/usr/share/${_name}/freedoomu.wad"
    ln -s '/usr/share/doom/doom2.wad' "${pkgdir}/usr/share/${_name}/freedoom.wad"
    ln -s '/usr/share/doom/heretic.wad' "${pkgdir}/usr/share/${_name}/blasphemer.wad"
    ln -s '/usr/share/doom/hexen.wad' "${pkgdir}/usr/share/${_name}/hexendemo.wad"

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
