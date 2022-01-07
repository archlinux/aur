# Maintainer: tas <tasgon_@out/look.com>
# Maintainer: QuantMint <qua/ntmint@/protonm/ail.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=${_pkgname}-mono-git
pkgver=4.0.r1.897afb6
pkgrel=1
pkgdesc="Godot Game Engine: An advanced, feature packed, multi-platform 2D and 3D game engine. (C#/Mono integration)"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'scons' 'pulseaudio' 'pkgconf' 'xorg-xrandr' 'yasm')                                                                                                          
depends=('glu' 'libxcursor' 'libxinerama' 'alsa-lib' 'freetype2' 'mesa' 'mono')
optdepends=()
conflicts=("godot-mono")
provides=("godot-mono")
_arch=''
if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi

source=(
	godot-mono.desktop
	icon.png
)
sha256sums=(
	'9e5c418d381aaf954c058701b4b4eadbdd767f318af0898d458a74aae111aed5'
	'99f9d17c4355b274ef0c08069cf6e756a98cd5c9d9d22d1b39f79538134277e1'
)

prepare() {
    if [ ! -d "${srcdir}/${_pkgname}" ]
    then
        cd ${srcdir}
        git clone https://github.com/godotengine/godot.git --branch master --single-branch --depth 1
    else
        cd "${srcdir}/${_pkgname}"
        git fetch --depth 1 origin master
        git reset --hard origin/master
    fi
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _major=$(cat version.py|grep "major" | sed 's/major = //')
    _minor=$(cat version.py|grep "minor" | sed 's/minor = //')
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "${_major}.${_minor}.${_revision}"
    
}

build() {
    cd "${srcdir}"/${_pkgname}
    sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE
    scons platform=linuxbsd werror=no tools=yes module_mono_enabled=yes mono_glue=no $MAKEFLAGS
    ./bin/godot.linuxbsd.tools.${_arch}.mono --generate-mono-glue modules/mono/glue
    scons platform=linuxbsd target=release_debug werror=no tools=yes module_mono_enabled=yes mono_glue=yes $MAKEFLAGS
    scons platform=linuxbsd target=release_debug werror=no tools=no module_mono_enabled=yes mono_glue=yes $MAKEFLAGS
}

package() {

    cd "${srcdir}"    

    install -Dm644 godot-mono.desktop "${pkgdir}"/usr/share/applications/godot-mono.desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot-mono.png
    
    cd "${srcdir}"/${_pkgname}

    # install -D -m755 bin/godot.linuxbsd.opt.tools.${_arch}.mono "${pkgdir}"/usr/bin/godot
    mkdir "${pkgdir}"/opt
    mkdir "${pkgdir}"/usr/bin
    cp -R bin/ "${pkgdir}"/opt/godot-mono
    chmod -R 755 "${pkgdir}"/opt/godot-mono
    ln -s /opt/godot-mono/godot.linuxbsd.opt.tools.${_arch}.mono "${pkgdir}"/usr/bin/godot-mono 
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot-mono-git/LICENSE
}

