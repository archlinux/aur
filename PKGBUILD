# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.7.0.0
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
_ghurl="https://github.com/JakubMelka/PDF4QT"
license=('LGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'openssl'
    'libjpeg-turbo'
    'qt6-speech'
    'qt6-svg'
    'qt6-base'
    'openjpeg2'
    'onetbb'
    'lcms2'
    'blend2d'
    'clipper2'
    'sane'
)
makedepends=(
    'git'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'flite: Text-To-Speech using flite synthesizer'
    'libspeechd: Text-To-Speech using speechd synthesizer'
)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01da732d172092a80a325f09cc3f64ed1298bccc76bcc2d7e108b3accccea931')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		[ -f "$d/CMakeLists.txt" ] && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 2 -mindepth 1 -type d ! -name '.*' 2>/dev/null)
}
_set_c_build_env() {
	export HOME="${srcdir}/.home"
	mkdir -p "${HOME}"
	export CCACHE_DIR="${HOME}/.ccache"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_c_build_env
    sed -i "s/OpenJPEG CONFIG REQUIRED/OpenJPEG REQUIRED/g" "$(_get_project_dir)/CMakeLists.txt"
    sed -i "s/PDF4QT_PLUGINS_DIR \${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/PDF4QT_PLUGINS_DIR \/\${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/g" \
        "$(_get_project_dir)/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i "24i\message(PDF4QT_PLUGINS_DIR=\${PDF4QT_PLUGINS_DIR})" "$(_get_project_dir)/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i 's|\./%1|/usr/bin/%1|g' "$(_get_project_dir)/Pdf4QtLaunchPad/launchapplication.cpp"
    cmake -B "$(_get_project_dir)/build" \
        -S "$(_get_project_dir)" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/' \
        -Wno-dev \
        -DCMAKE_MODULE_PATH="${srcdir}" \
        -DPDF4QT_INSTALL_DEPENDENCIES=0 \
        -DPDF4QT_LINUX=1
}
build() {
    cd "$(_get_project_dir)"
    _set_c_build_env
    cmake --build "$(_get_project_dir)/build"
}
package() {
    DESTDIR="${pkgdir}" cmake --install "$(_get_project_dir)/build"
}
