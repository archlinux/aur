# Maintainer: taotieren <admin@taotieren.com>

pkgname=chordnova-git
pkgver=3.0.2021.r14.gf90c32d
pkgrel=1
pkgdesc="ChordNova is a powerful open-source chord progression analysis plus generation software for multiple operating systems."
arch=($CARCH)
url="https://github.com/Chen-and-Sim/ChordNova"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    qt5-base
)
makedepends=(git
    qt5-tools
    cmake
    ninja)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/main"
    sed -i -e 's|/opt/$${TARGET}|/usr/share/chordnova|g' ChordNova.pro
    qmake-qt5 ChordNova.pro
    make
    #     sed -i -e 's#class Chord: public ChordData#class Chord\n{\npublic:\n    void analyse();\n    void substitute();\n    void set_param_center();\n    void set_param_range();\n#' chord.h
    install -Dm0755 /dev/stdin "${srcdir}/${pkgname}/CMakeLists.txt" <<EOF
cmake_minimum_required(VERSION 3.12)
project(ChordNova)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)

# 设置编译选项
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置自定义路径变量
set(CHORDNOVA_INSTALL_PREFIX "/usr/share/chordnova/")

# 添加可执行文件
# add_executable(ChordNova
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/alignmentgui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/analyser.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/analysergui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/chord.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/chorddata.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/functions.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/inversiongui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/main.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/maingui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/moreparamgui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/morerulesgui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/omissiongui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/overallscalegui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/pedalnotesgui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/savesettingsgui.cpp
#     \${CMAKE_CURRENT_SOURCE_DIR}/main/subsettingsgui.cpp
# )

# 添加头文件
# target_include_directories(ChordNova PRIVATE
#     \${CMAKE_CURRENT_SOURCE_DIR}/main
#     \${Qt5Core_INCLUDE_DIRS}
#     \${Qt5Gui_INCLUDE_DIRS}
#     \${Qt5Widgets_INCLUDE_DIRS}
# )

# if(WIN32)
#     target_link_libraries(ProjectName gdi32)
# endif()

# 添加其他依赖库和链接

# 安装可执行文件
# install(TARGETS ChordNova RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/bin)

# 添加子目录
add_subdirectory(utilities)

# 安装 attachments 目录下的 icons 和 presets
install(DIRECTORY \${CMAKE_CURRENT_SOURCE_DIR}/attachments/icons DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/bin)
install(DIRECTORY \${CMAKE_CURRENT_SOURCE_DIR}/attachments/presets DESTINATION \${CHORDNOVA_INSTALL_PREFIX})
EOF

    install -Dm0755 /dev/stdin "${srcdir}/${pkgname}/utilities/CMakeLists.txt" <<EOF
cmake_minimum_required(VERSION 3.12)
project(ChordNovaUtilities)

# 设置编译选项
set(CMAKE_CXX_STANDARD 11)

# 设置自定义路径变量
set(UTILITIES_INSTALL_PREFIX "/usr/share/chordnova/")

# 添加可执行文件
add_executable(CharmingChords \${CMAKE_CURRENT_SOURCE_DIR}/CharmingChords/CharmingChords.cpp)
add_executable(ChordCheck \${CMAKE_CURRENT_SOURCE_DIR}/ChordCheck/ChordCheck.cpp)
add_executable(ChordSect \${CMAKE_CURRENT_SOURCE_DIR}/ChordSect/ChordSect.cpp)
add_executable(ChordStats \${CMAKE_CURRENT_SOURCE_DIR}/ChordStats/ChordStats.cpp)
add_executable(ChordTrans \${CMAKE_CURRENT_SOURCE_DIR}/ChordTrans/ChordTrans.cpp)
add_executable(dbnormal \${CMAKE_CURRENT_SOURCE_DIR}/dbnormal/dbnormal.cpp)
add_executable(dbprime \${CMAKE_CURRENT_SOURCE_DIR}/dbprime/dbprime.cpp)
add_executable(outputconv \${CMAKE_CURRENT_SOURCE_DIR}/outputconv/outputconv.cpp)
add_executable(writealign \${CMAKE_CURRENT_SOURCE_DIR}/writealign/writealign.cpp)
add_executable(writedb \${CMAKE_CURRENT_SOURCE_DIR}/writedb/writedb.cpp)

# 添加其他依赖库和链接

# 安装可执行文件
install(TARGETS CharmingChords RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/CharmingChords)
install(TARGETS ChordCheck RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/ChordCheck)
install(TARGETS ChordSect RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/ChordSect)
install(TARGETS ChordStats RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/ChordStats)
install(TARGETS ChordTrans RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/ChordTrans)
install(TARGETS dbnormal RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/dbnormal)
install(TARGETS dbprime RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/dbprime)
install(TARGETS outputconv RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/outputconv)
install(TARGETS writealign RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/writealign)
install(TARGETS writedb RUNTIME DESTINATION \${CHORDNOVA_INSTALL_PREFIX}/utilities/writedb)

EOF

    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=None \
        -DENABLE_WARNINGS=OFF \
        -DFORCE_EXTERNAL_LIBS=ON \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/main"
    make INSTALL_ROOT="${pkgdir}" install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install

    install -Dm0644 "${srcdir}/${pkgname}/attachments/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"

    #     install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}/utilities"
    #
    #     cd "${srcdir}/${pkgname}/attachments"
    #     cp -rva presets "${pkgdir}/usr/share/${pkgname%-git}"
    #     cp -rva icons "${pkgdir}/usr/share/${pkgname%-git}/bin"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}/bin
./ChordNova \$@
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.gitub.chen-and-sim.${pkgname%-git}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=ChordNova
Nmae[zh_CN]=智弦
Comment=ChordNova - Beyond boundaries!
Comment=智弦 - 和声生成神器！
Categories=Electronics;Music;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
