# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=blutter-git
pkgver=r111.528acbe
pkgrel=1
pkgdesc='Flutter/Dart reverse engineering tool — disassembles libapp.so with symbol recovery and Frida script generation'
arch=('x86_64')
url='https://github.com/worawit/blutter'
license=('MIT')
depends=(
    'capstone'
    'cmake'
    'gcc'
    'icu'
    'git'
    'ninja'
    'python'
    'python-pyelftools'
    'python-requests'
)
provides=('blutter')
conflicts=('blutter')
source=('git+https://github.com/worawit/blutter.git')
sha256sums=('SKIP')

pkgver() {
    cd blutter
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd blutter

    # Redirect all mutable state (Dart SDK clones, builds, cached binaries)
    # from the install tree to ~/.cache/blutter/ so the package lives
    # cleanly in /usr/ while runtime compilation goes to user space.

    # blutter.py: redirect BIN_DIR, PKG_INC_DIR, PKG_LIB_DIR, BUILD_DIR
    sed -i \
        -e "s|^SCRIPT_DIR = .*|SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))|" \
        -e "/^SCRIPT_DIR/a\\
CACHE_DIR = os.path.join(os.environ.get('XDG_CACHE_HOME', os.path.join(os.path.expanduser('~'), '.cache')), 'blutter')\\
os.makedirs(CACHE_DIR, exist_ok=True)" \
        -e "s|^BIN_DIR = .*|BIN_DIR = os.path.join(CACHE_DIR, 'bin')|" \
        -e "s|^PKG_INC_DIR = .*|PKG_INC_DIR = os.path.join(CACHE_DIR, 'packages', 'include')|" \
        -e "s|^PKG_LIB_DIR = .*|PKG_LIB_DIR = os.path.join(CACHE_DIR, 'packages', 'lib')|" \
        -e "s|^BUILD_DIR = .*|BUILD_DIR = os.path.join(CACHE_DIR, 'build')|" \
        blutter.py

    # dartvm_fetch_build.py: redirect SDK_DIR, BUILD_DIR
    sed -i \
        -e "/^SCRIPT_DIR/a\\
CACHE_DIR = os.path.join(os.environ.get('XDG_CACHE_HOME', os.path.join(os.path.expanduser('~'), '.cache')), 'blutter')\\
os.makedirs(CACHE_DIR, exist_ok=True)" \
        -e "s|^SDK_DIR = .*|SDK_DIR = os.path.join(CACHE_DIR, 'dartsdk')|" \
        -e "s|^BUILD_DIR = .*|BUILD_DIR = os.path.join(CACHE_DIR, 'build')|" \
        dartvm_fetch_build.py

    # blutter/CMakeLists.txt: accept BLUTTER_CACHE_DIR for install prefix
    # and BLUTTER_DATA_DIR for frida template, use packages from cache dir
    sed -i \
        -e 's|set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}/../bin"|set(CMAKE_INSTALL_PREFIX "${BLUTTER_CACHE_DIR}/bin"|' \
        -e 's|find_package(${DARTLIB} REQUIRED PATHS "${PROJECT_SOURCE_DIR}/../packages")|find_package(${DARTLIB} REQUIRED PATHS "${BLUTTER_CACHE_DIR}/packages")|' \
        -e 's|get_filename_component(FRIDA_TEMPLATE_DIR "${PROJECT_SOURCE_DIR}/../scripts/" ABSOLUTE)|set(FRIDA_TEMPLATE_DIR "${BLUTTER_DATA_DIR}/scripts")|' \
        blutter/CMakeLists.txt

    # scripts/CMakeLists.txt: accept BLUTTER_CACHE_DIR for install prefix
    sed -i \
        's|set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}/../../packages"|set(CMAKE_INSTALL_PREFIX "${BLUTTER_CACHE_DIR}/packages"|' \
        scripts/CMakeLists.txt

    # blutter.py: pass BLUTTER_CACHE_DIR and BLUTTER_DATA_DIR to cmake
    sed -i \
        "s|'-DCMAKE_BUILD_TYPE=Release', '--log-level=NOTICE'\]|'-DCMAKE_BUILD_TYPE=Release', f'-DBLUTTER_CACHE_DIR={CACHE_DIR}', f'-DBLUTTER_DATA_DIR={SCRIPT_DIR}', '--log-level=NOTICE']|" \
        blutter.py

    # dartvm_fetch_build.py: pass BLUTTER_CACHE_DIR to cmake
    sed -i \
        "s|'-DCMAKE_BUILD_TYPE=Release', '--log-level=NOTICE'\]|'-DCMAKE_BUILD_TYPE=Release', f'-DBLUTTER_CACHE_DIR={CACHE_DIR}', '--log-level=NOTICE']|" \
        dartvm_fetch_build.py
}

package() {
    cd blutter

    # Python scripts and C++ source → /usr/lib/blutter/
    install -d "${pkgdir}/usr/lib/blutter"
    cp -a blutter.py dartvm_fetch_build.py extract_dart_info.py "${pkgdir}/usr/lib/blutter/"
    cp -a blutter/ "${pkgdir}/usr/lib/blutter/blutter"
    cp -a scripts/ "${pkgdir}/usr/lib/blutter/scripts"

    # Launcher script → /usr/bin/blutter
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/blutter" <<'LAUNCHER'
#!/bin/bash
exec python3 /usr/lib/blutter/blutter.py "$@"
LAUNCHER

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
