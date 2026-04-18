# Maintainer: taotieren <admin@taotieren.com>

pkgbase=scopehal-apps
pkgname=scopehal-apps
_tagname=0.1.1
pkgver=${_tagname//-/_}
pkgrel=4
epoch=
pkgdesc="ngscopeclient and other client applications for libscopehal"
arch=($CARCH)
url="https://github.com/ngscopeclient/scopehal-apps"
license=('BSD-3-Clause')
provides=(${pkgname})
conflicts=(${pkgname})
groups=()
depends=(
    glib2
    glibc
    gtk3
    libgcc
    libgomp
    liblxi
    libpng
    libsigc++-3.0
    libstdc++
    libtirpc
    libx11
    glfw
    glslang 
    hicolor-icon-theme
    hidapi
    vulkan-icd-loader
    yaml-cpp
)
makedepends=(
    cmake
    git
    ninja
    catch2
    fftw
    lsb-release
    nvtx
    openmp
    pkgconf
    shaderc
    vulkan-headers
    wayland
)
checkdepends=()
optdepends=(
    spirv-tools
    linux-gpib
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}::git+${url}.git#tag=v${_tagname}"
    "lib::git+https://github.com/ngscopeclient/scopehal.git"
    "xptools::git+https://github.com/ngscopeclient/xptools.git"
    "log::git+https://github.com/ngscopeclient/logtools.git"
    "VkFFT::git+https://github.com/ngscopeclient/VkFFT.git"
    "canvas_ity::git+https://github.com/a-e-k/canvas_ity.git"
    "doc::git+https://github.com/ngscopeclient/scopehal-docs.git"
    "imgui::git+https://github.com/ngscopeclient/imgui.git"
    "imgui-node-editor::git+https://github.com/ngscopeclient/imgui-node-editor.git"
    "ImGuiFileDialog::git+https://github.com/aiekick/ImGuiFileDialog.git"
    "nativefiledialog-extended::git+https://github.com/btzy/nativefiledialog-extended.git"
    "wayland-protocols::git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
    "imgui_markdown::git+https://github.com/juliettef/imgui_markdown.git"
)
sha256sums=('8c8203c03e10160a922b5b5104761089b79693d6ea585be32be5a07707142cf5'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
# validpgpkeys=()
# noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    git -C "${srcdir}/lib" clean -dfx
    git -C "${srcdir}/nativefiledialog-extended" clean -dfx
    
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.lib.url "$srcdir/lib"
    git config submodule.doc.url "$srcdir/doc"
    git config submodule.src/imgui.url "$srcdir/imgui"
    git config submodule.src/imgui-node-editor.url "$srcdir/imgui-node-editor"
    git config submodule.src/ImGuiFileDialog.url "$srcdir/ImGuiFileDialog"
    git config submodule.src/nativefiledialog-extended.url "$srcdir/nativefiledialog-extended"
    git config submodule.src/imgui_markdown.url "$srcdir/imgui_markdown"
    git -c protocol.file.allow=always submodule update
    
    cd "${srcdir}/${pkgname}/lib"
    git submodule init
    git config submodule.xptools.url "$srcdir/xptools"
    git config submodule.log.url "$srcdir/log"
    git config submodule.VkFFT.url "$srcdir/VkFFT"
    git config submodule.canvas_ity.url "$srcdir/canvas_ity"
    git -c protocol.file.allow=always submodule update

    cd "${srcdir}/${pkgname}/src/nativefiledialog-extended"
    git submodule init
    git config submodule.3ps/wayland-protocols.url "$srcdir/wayland-protocols"
    git -c protocol.file.allow=always submodule update
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cmake -S ${srcdir}/${pkgname} \
        -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -GNinja \
        -Wno-dev
        # -DBUILD_DOC=ON \

    ninja -C ${srcdir}/build
}

package() {
  install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}
