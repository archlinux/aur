# Maintainer: Glucy2 <glucy-2@outlook.com>
pkgname=sast-evento

pkgver=2.0.74
pkgrel=1
pkgdesc='An event management system developed and used by NJUPT SAST'
license=("${srcdir}/sast-evento/LICENSE")
url="https://github.com/NJUPT-SAST/sast-evento"
conflicts=("${pkgname}-git" "${pkgname}-bin")

makedepends=(
    'git'
    'base-devel'
    'cmake'
    'qt5-base'
    'boost'
    'nlohmann-json'
    'spdlog'
    'liburing'
    'libsecret'
    'tomlplusplus'
    'autoconf-archive'
    'libxcb'
    'libxrender'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    )
depends=('boost' 'qt6-base' 'slint-cpp-bin')
arch=('x86_64')

prepare() {
    rm -rf "${srcdir}/sast-evento/build" "${srcdir}/build"
    if [[
        -d ${srcdir}/sast-evento

        &&

        $(git -C "${srcdir}/sast-evento" config --get remote.origin.url) \
            = "https://github.com/NJUPT-SAST/sast-evento.git"
        
        &&

        $(git -C "${srcdir}/sast-evento" branch --show-current) = "main"
         ]] ; then
        
        cd "${srcdir}/sast-evento"
        git pull
        git submodule update --init --recursive
    else
        rm -rf "${srcdir}/sast-evento"
        cd "${srcdir}"
        git clone --recursive -b main https://github.com/NJUPT-SAST/sast-evento.git
    fi
}

build() {
    cd "${srcdir}/sast-evento"
    cmake -B build \
        -DSLINT_FEATURE_RENDERER_SKIA=ON \
        -DSLINT_FEATURE_RENDERER_FEMTOVG=OFF \
        -DSlint_DIR=${srcdir}/Slint-cpp-${_slintver}-Linux-x86_64/lib/cmake/Slint
    cmake --build build
    cmake --install ./build --prefix "${srcdir}/build"
}

package() {
    rm "${srcdir}/build/sast-evento-version.txt"
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/build/bin/"*
    install -Dm644 -t "${pkgdir}/usr/lib" "${srcdir}/build/lib/"*
    install -Dm644 "${srcdir}/build/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r "${srcdir}/build/include" "${pkgdir}/usr/"
    cp -r "${srcdir}/build/locale" "${pkgdir}/usr/share/locale/"
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=SAST Evento
Version=$pkgver
Comment=An event management system developed and used by NJUPT SAST
Exec=sast-evento
Icon=sast-evento
Terminal=false
Type=Application
Categories=Education;
Terminal=false
EOF
    chmod -R 644 \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/sast-evento/ui/assets/image/icon/evento.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sast-evento.svg"
}
