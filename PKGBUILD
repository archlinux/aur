# Maintainer: neycrol <330578697@qq.com>
pkgname=prismlauncher-zlib-compat-git
_pkgname=PrismLauncher
pkgver=8.0.r2827.gbc68192 # 这里的默认值会被 pkgver() 自动覆盖
pkgrel=1
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
    # -fPIC is required for shared libraries
    CFLAGS="$CFLAGS -fPIC" ./configure --prefix="$srcdir/zlib_build"
    make
    make install

    # --- 2. Build Prism Launcher ---
    msg2 "Building Prism Launcher..."
    cd "$srcdir/$_pkgname"
    
    # Use JDK 8 to support -source 7 / -target 7 in CMakeLists
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    export PATH="$JAVA_HOME/bin:$PATH"
    
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
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
