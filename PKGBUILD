# Maintainer: jlucaso <jlucaso at users dot noreply dot github dot com>
pkgname=lightburn-on-linux-git
pkgver=0.r5.g2424aab
pkgrel=1
pkgdesc="Unofficial Wine compatibility wrapper for LightBurn; install LightBurn separately"
arch=('x86_64')
url="https://github.com/jlucaso1/lightburn-on-linux"
license=('MIT')
depends=('bash' 'coreutils' 'wine')
makedepends=('git' 'mingw-w64-gcc')
checkdepends=('shellcheck' 'desktop-file-utils')
optdepends=('xorg-server-xvfb: headless setup with xvfb-run and its xorg-xauth dependency'
            'xorg-xwayland: graphical launch on Wayland with DISPLAY')
provides=("lightburn-on-linux=${pkgver}")
conflicts=('lightburn-on-linux')
options=('!strip' '!debug')
source=("upstream::git+${url}.git#branch=main"
        'lightburn-on-linux'
        'lightburn-on-linux-setup'
        'lightburn-on-linux-map-serial'
        'lightburn-on-linux.desktop'
        'check-wrappers.sh'
        'mock-bash.sh'
        'README.md')
sha256sums=('SKIP'
            '9de0d748fe486876e09418fedce5a4a25aaafdf28928795d28f842b3c84b42ca'
            '98cfce43faed522093313df81bcd7dad4beac52d82717dfcd5b034e73736e71f'
            '86c1a450a2f18a73378f597b05087a5ea783e2df885583ff022c6f39a06c8029'
            '31ea737b27595ead2c0975b1cba6cf2de53fb7cd24dc285c5d78b778cc541c87'
            'ef953f3914551cb4149e6a63023f4737099536ed2edd43835188463905b000ad'
            'c6db6763d055691a69a8940868fa7c9fd3f426e4183a9ba1a463c25155501664'
            'b5403d7a11fb16e0b43ac4d5b6c89fd5311efd88f0f763508859e3ecf7bb7148')

pkgver() {
    cd upstream
    printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd upstream
    mkdir -p build
    CC=x86_64-w64-mingw32-gcc bash shim/build.sh "$PWD/build/winrtcamstub.dll"
    CC=x86_64-w64-mingw32-gcc bash scripts/build-launcher.sh "$PWD/build/start-lightburn.exe"
}

check() {
    cd upstream
    local script binary
    for script in scripts/*.sh shim/*.sh tests/*.sh versions.env; do
        bash -n "$script"
    done
    shellcheck --shell=bash --external-sources --source-path=SCRIPTDIR \
        scripts/*.sh shim/*.sh tests/*.sh versions.env
    bash tests/run.sh
    x86_64-w64-mingw32-gcc -Wall -Wextra -Werror -O2 \
        -o build/helper-service.exe tests/helper-service.c -ladvapi32
    x86_64-w64-mingw32-gcc -Wall -Wextra -Werror -O2 \
        -o build/start-lightburn-tests.exe tests/start-lightburn.c -ladvapi32
    x86_64-w64-mingw32-gcc -Wall -Wextra -Werror -O2 \
        -o build/shim-com.exe tests/shim-com.c -lwindowsapp -luser32 -lkernel32
    for binary in winrtcamstub.dll start-lightburn.exe; do
        x86_64-w64-mingw32-objdump -p "build/$binary" > "build/$binary.pe"
        grep -q 'file format pei-x86-64' "build/$binary.pe"
    done
    awk '
        /^\[Ordinal\/Name Pointer\]/ { exports = 1; next }
        exports && NF == 0 { exports = 0 }
        exports && $NF == "DllGetActivationFactory" { found = 1 }
        END { exit !found }
    ' build/winrtcamstub.dll.pe
    cd "$srcdir"
    for script in lightburn-on-linux lightburn-on-linux-setup lightburn-on-linux-map-serial check-wrappers.sh mock-bash.sh; do
        bash -n "$script"
        shellcheck --shell=bash "$script"
    done
    bash check-wrappers.sh
    desktop-file-validate lightburn-on-linux.desktop
}

package() {
    local script
    for script in lightburn-on-linux lightburn-on-linux-setup lightburn-on-linux-map-serial; do
        install -Dm755 "$script" "$pkgdir/usr/bin/$script"
    done
    install -Dm644 lightburn-on-linux.desktop "$pkgdir/usr/share/applications/lightburn-on-linux.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lightburn-on-linux/README.arch.md"
    cd upstream
    for script in common.sh install.sh run.sh map-serial.sh; do
        install -Dm644 "scripts/$script" "$pkgdir/usr/share/lightburn-on-linux/scripts/$script"
    done
    install -Dm644 versions.env "$pkgdir/usr/share/lightburn-on-linux/versions.env"
    install -Dm644 build/winrtcamstub.dll "$pkgdir/usr/lib/lightburn-on-linux/winrtcamstub.dll"
    install -Dm644 build/start-lightburn.exe "$pkgdir/usr/lib/lightburn-on-linux/start-lightburn.exe"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /usr/share/licenses/mingw-w64-crt/COPYING.MinGW-w64-runtime.txt \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.MinGW-w64-runtime.txt"
    install -Dm644 /usr/share/licenses/gcc/RUNTIME.LIBRARY.EXCEPTION \
        "$pkgdir/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION"
    install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later.txt "$pkgdir/usr/share/licenses/$pkgname/GPL3"
    install -Dm644 README.md LEGAL.md COMPATIBILITY.md -t "$pkgdir/usr/share/doc/lightburn-on-linux/"
}
