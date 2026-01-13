# Maintainer: neycrol <330578697@qq.com>
pkgname=prismlauncher-zlib-compat-git
_pkgname=PrismLauncher
pkgver=10.0.0.pre1.r154.gc2fc0a3 # 这里的默认值会被 pkgver() 自动覆盖
pkgrel=2
pkgdesc="Prism Launcher (Git) bundled with vanilla zlib. Fixes 'invalid outputs' on CachyOS/zlib-ng systems."
arch=('x86_64')
url="https://prismlauncher.org/"
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-5compat'
    'qt6-svg'
    'qt6-networkauth'
    'qt6-imageformats'
    'java-runtime'
    'glibc'
    'gcc-libs'
    'hicolor-icon-theme'
    'cmark'
    'tomlplusplus'
    'quazip-qt6'
    'gamemode'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
    'jdk8-openjdk'   # Essential: Compiles legacy Java components correctly
    'scdoc'
    'clang'
    'ninja'
    'vulkan-headers'
)
provides=('prismlauncher')
conflicts=('prismlauncher' 'prismlauncher-git' 'prismlauncher-bin')
source=(
    "${_pkgname}::git+https://github.com/PrismLauncher/PrismLauncher.git"
    "zlib::git+https://github.com/madler/zlib.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname"
    # Standard Arch git versioning: 8.4.r123.gabcdef
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
}

build() {
    # --- 1. Build vanilla zlib ---
    msg2 "Building vanilla zlib for compatibility..."
    cd "$srcdir/zlib"
    git clean -dfx
    # Build zlib in subshell to avoid polluting environment
    (
        export CFLAGS="-O2 -fPIC"
        export LDFLAGS=""
        ./configure --prefix="$srcdir/zlib_build"
        # Fix: Remove NO_STRERROR and NO_vsnprintf flags that break errno.h inclusion
        sed -i 's/-DNO_STRERROR//g; s/-DNO_vsnprintf//g' Makefile
        # Build only static and shared libs, skip test programs
        make libz.a libz.so libz.so.1 libz.so.1.3.1.1-motley 2>/dev/null || make libz.a
        # Create shared lib manually if needed
        if [ ! -f libz.so ]; then
            gcc -shared -o libz.so.1 -Wl,-soname,libz.so.1 *.o
            ln -sf libz.so.1 libz.so
        fi
        mkdir -p "$srcdir/zlib_build/lib"
        cp -a libz.* "$srcdir/zlib_build/lib/" 2>/dev/null || true
        mkdir -p "$srcdir/zlib_build/include"
        cp zlib.h zconf.h "$srcdir/zlib_build/include/"
    )

    # --- 2. Build Prism Launcher ---
    msg2 "Building Prism Launcher..."
    cd "$srcdir/$_pkgname"
    
    # Use JDK 8 to support -source 7 / -target 7 in CMakeLists
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"
    
    # Let CMake drive IPO/LTO to avoid link failures from partial -flto flags.
    # We only enable LTO if the user/toolchain requests it via -flto.
    local _enable_lto=OFF
    if [[ "${CFLAGS} ${CXXFLAGS} ${LDFLAGS} ${LTOFLAGS}" == *-flto* ]]; then
        _enable_lto=ON
        export CFLAGS="${CFLAGS//-flto=auto/}"
        export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
        export LDFLAGS="${LDFLAGS//-flto=auto/}"
        # LLD cannot link GCC LTO objects; force ld.bfd when LTO is enabled.
        if ld --version 2>/dev/null | head -n 1 | grep -q "LLD"; then
            export LDFLAGS="${LDFLAGS} -fuse-ld=bfd"
        fi
        export AR=gcc-ar
        export RANLIB=gcc-ranlib
        export NM=gcc-nm
    fi
    
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_LTO="${_enable_lto}" \
        -DBUILD_TESTING=OFF \
        -DLauncher_BUILD_PLATFORM="Archlinux/CachyOS" \
        -DLauncher_QT_VERSION_MAJOR="6" \
        -DJAVA_HOME="$JAVA_HOME" \
        -DCMAKE_INSTALL_DATADIR="share" \
        -DJARS_DEST_DIR="share/PrismLauncher" \
        -Wno-dev

    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # --- Manual Fixes & Structuring ---
    
    # 1. Enforce JAR placement (Fix "JavaCheck not found")
    # We look for JARs in build dir and ensure they are in /usr/share/PrismLauncher/
    # This matches the path expected by the binary relative to /usr/bin
    msg2 "Ensuring JARs are in correct location..."
    install -dm755 "$pkgdir/usr/share/PrismLauncher"
    find build -name "JavaCheck.jar" -exec install -Dm644 {} "$pkgdir/usr/share/PrismLauncher/JavaCheck.jar" \;
    find build -name "NewLaunch.jar" -exec install -Dm644 {} "$pkgdir/usr/share/PrismLauncher/NewLaunch.jar" \;
    find build -name "NewLaunchLegacy.jar" -exec install -Dm644 {} "$pkgdir/usr/share/PrismLauncher/NewLaunchLegacy.jar" \;

    # 2. Rename binary (In-place)
    # We keep it in /usr/bin so relative lookup "../share/PrismLauncher" works
    cd "$pkgdir/usr/bin"
    if [ -f prismlauncher ]; then
        mv prismlauncher prismlauncher-bin
    fi

    # 3. Install private zlib
    install -dm755 "$pkgdir/usr/lib/prismlauncher/libs"
    cp -a "$srcdir/zlib_build/lib"/libz.so* "$pkgdir/usr/lib/prismlauncher/libs/"

    # 4. Create LD_LIBRARY_PATH wrapper
    msg2 "Creating wrapper script..."
    cat > prismlauncher <<EOF
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/prismlauncher/libs\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec /usr/bin/prismlauncher-bin "\$@"
EOF
    chmod 755 prismlauncher

    # 5. License
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
