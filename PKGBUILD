# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Andrew Rabert <arabert@nullsum.net>

# Build without fmodex:
_fmodex=
# Build with fmodex:
#_fmodex=fmodex

_name=zdoom
pkgname=${_name}
pkgver=2.8.1
pkgrel=4
pkgdesc='Advanced Doom source port'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=(${_fmodex:+$(LC_ALL=C pacman -Q $_fmodex | sed -r 's/ /=/;s/-.*$//')}
         'gtk2'
         'libgme'
         'libsndfile'
         'mpg123'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'imagemagick'
             'openal'
             'p7zip'
             'xdg-utils')
makedepends_i686=('nasm')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'fluidsynth: FluidSynth MIDI device'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'openal: OpenAL sound backend'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'timidity++: Timidity MIDI device'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
source=("http://zdoom.org/files/${_name}/${pkgver%.${pkgver#*.*.}}/${_name}-${pkgver}-src.7z"
        'launcher.desktop'
        '0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch')
noextract=("${source[0]##*/}")
sha256sums=('782179d4667d2e56e26e21d7a0872523f8e4262ed176072fef00d0043376a310'
            'e8932a559baf30ecbfc062546ca014c6dfb70f76d1570549654209d39157e350'
            '3de616393fa2eea8540c59c983a4394b29a0a0220095297a3f47e4f721b8d9fb')

prepare() {
    7z x -o${_name} -y "${source[0]##*/}" >/dev/null

    cd $_name

    patch -p 1 -i "$srcdir"/0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch
}

build() {
    cd $_name

    local _nofmod _fmodincdir _fmodlib

    if [[ -n "${_fmodex}" ]]; then
        _nofmod=OFF
        _fmodincdir=$(LC_ALL=C pacman -Ql $_fmodex | grep -Eo '/usr/include/fmodex[^/]*/$')
        _fmodlib=$(LC_ALL=C pacman -Ql $_fmodex | grep -Eo '/usr/lib/libfmodex-[^/]*\.so$')
    else
        _nofmod=ON
    fi

    cmake -DNO_FMOD=${_nofmod} \
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
    cd $_name

    install -D "${_name}.sh" "${pkgdir}/usr/bin/${_name}"

    mkdir -p "${pkgdir}/usr/lib/${_name}"
    install "${_name}" "${pkgdir}/usr/lib/${_name}/"
    install -m644 "${_name}.pk3" "${pkgdir}/usr/lib/${_name}/"
    if [[ -n "${_fmodex}" ]]; then
        install 'liboutput_sdl.so' "${pkgdir}/usr/lib/${_name}/"
    fi

    mkdir -p "${pkgdir}/usr/share/${_name}"

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
