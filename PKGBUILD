# Maintainer: taotieren <admin@taotieren.com>

pkgname=modbustools
pkgver=0.5.0
pkgrel=2
pkgdesc="ModbusTools are cross-platform Modbus simulator tools with GUI to work with Modbus protocol (TCP,RTU,ASCII)"
arch=($CARCH)
url="https://github.com/serhmarch/ModbusTools"
license=(GPL-3.0-only)
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc
    libstdc++
    hicolor-icon-theme
    qt5-base
    qt5-tools
    python
    python-pyqt5
)
makedepends=(
    cmake
    ninja
    git
    doxygen
    graphviz
    imagemagick
)
optdepends=()
backup=()
options=()
install=
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "modbus::git+https://github.com/serhmarch/ModbusLib.git"
)
sha256sums=('cbb2e7c250e7e90ae0de650d33906f4340ad5d8d47ee1a56bb9eceaf63c69155'
            'SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx

    cd "${srcdir}/${pkgname}"
    git cherry-pick -n 4d0a7408e12d28930d4aedb9356f8a42bb47685a
    git submodule init
    git config submodule.modbus.url "$srcdir/modbus"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}/"

    cmake -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=OFF \
        -Wdeprecated-declarations \
        -Wno-dev \
        -Bbuild \
        -GNinja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"

    apps=("client" "server")
    for app in "${apps[@]}"; do
        app_upper="${app^}" 
        app_name="mb${app}"
        
        ico_path="src/${app}/gui/icons/${app_name}.ico"
        install -vdm755 ${pkgdir}/usr/share/icons/hicolor/256x256/apps/
        if [ -f "$ico_path" ]; then
            magick "${ico_path}[0]" -resize 256x256 \
                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${app_name}.png"
        fi
        
        install -vdm755 ${pkgdir}/usr/share/doc/${pkgname}/${app}
        if [ -d "build/doc/output/${app}" ]; then
            cp -R "build/doc/output/${app}/" "${pkgdir}/usr/share/doc/${pkgname}/${app}/"
        fi
        
        for bin_file in build/${app_name}-*; do
            if [ -f "$bin_file" ]; then
                install -vDm0755 "$bin_file" "${pkgdir}/usr/bin/${app_name}"
                break
            fi
        done
        
        install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.serhmarch.${app_name}.desktop" <<EOF
[Desktop Entry]
Name=${app_name}
Comment=${pkgdesc} -- ${app}
Exec=${app_name}
Icon=${app_name}
Categories=Development;
Terminal=false
Type=Application
EOF
    done

    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0755 src/server/python/*.py -t "${pkgdir}/usr/bin/"
    install -vDm0755 build/libmbcore.* -t "${pkgdir}/usr/lib"
    install -vDm0644 build/libmodbus.* -t "${pkgdir}/usr/lib"

    cd "${pkgdir}/usr/lib"
    find . -maxdepth 1 -name "lib*.so.*.*.*" -type f | while read -r file; do
        file="${file#./}"
        if [[ "$file" =~ ^(lib[^.]+\.[^.]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
            base="${BASH_REMATCH[1]}"
            major="${BASH_REMATCH[2]}"
            
            ln -sf "$file" "${base}.${major}"
            ln -sf "$file" "$base"
        fi
    done
}
