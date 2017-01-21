# Maintainer: Jan Cholasta <grubber at grubber cz>

# Build without fmodex:
_fmodex=
# Build with fmodex:
#_fmodex=fmodex

_name=qzdoom
pkgname=${_name}
pkgver=1.2.2
pkgrel=1
pkgdesc='Advanced Doom source port with true color renderer'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=(${_fmodex:+$(LC_ALL=C pacman -Q $_fmodex | sed -r 's/ /=/;s/-.*$//')}
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libgme'
         'libsndfile'
         'mpg123'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'git'
             'gtk3'
             'imagemagick'
             'llvm'
             'openal'
             'xdg-utils')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'fluidsynth: FluidSynth MIDI device'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'gtk3: IWAD selection dialog'
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
source=("${_name}::git://github.com/raa-eruanna/${_name}.git#tag=q${pkgver}"
        'launcher.desktop')
sha256sums=('SKIP'
            '0b3bcbe2cdebda2fed887b796f4ff0fa51f3d544e80cab16b3b1cbd7813b7e04')

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
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DINSTALL_PATH=lib/$_name \
          -DINSTALL_PK3_PATH=share/$_name \
          .
    make

    cat >"${_name}.sh" <<EOF
#!/bin/sh
exec /usr/lib/${_name}/${_name} "\$@"
EOF

    cp "${srcdir}/launcher.desktop" "${_name}.desktop"

    mkdir -p 'icons'
    convert 'src/win32/icon1.ico[2]' 'icons/48.png'
    convert 'src/win32/icon1.ico[3]' 'icons/32.png'
    convert 'src/win32/icon1.ico[4]' 'icons/16.png'
}

package() {
    cd $_name

    install -D "${_name}.sh" "${pkgdir}/usr/bin/${_name}"

    make install DESTDIR="$pkgdir"

    ln -s /usr/share/$_name/${_name}.pk3 "$pkgdir"/usr/lib/$_name/${_name}.pk3
    if [[ -n "${_fmodex}" ]]; then
        install 'liboutput_sdl.so' "${pkgdir}/usr/lib/${_name}/"
    fi

    mkdir -p "$pkgdir"/usr/share/licenses
    ln -s /usr/share/doc/$_name/licenses "$pkgdir"/usr/share/licenses/$pkgname

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
