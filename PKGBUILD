# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Based on mmtrt's snap package

pkgname=acroread-dc-wine
pkgver=26.002.21900
pkgrel=1
pkgdesc="Adobe Acrobat Reader DC - PDF viewer (via Wine)"
arch=('x86_64')
url="https://www.adobe.com/products/reader.html"
license=('LicenseRef-proprietary' 'LGPL-2.1-or-later')
depends=(
    'bash'
    'wine'
    'wine-mono'
    'wine-gecko'
    'winetricks'
    '7zip'
    'hicolor-icon-theme'
)
optdepends=(
    'cups: printing support'
    'lib32-libcups: 32-bit printing support'
    'lib32-gnutls: HTTPS support'
    'lib32-libpulse: audio support'
    'xorg-xrandr: screen resolution detection for virtual desktop'
)
makedepends=(
    'bison'
    'cabextract'
    'desktop-file-utils'
    'flex'
    'icoutils'
    'mingw-w64-gcc'
)
checkdepends=('xorg-server-xvfb')
install=acroread-dc-wine.install
options=('!debug')

# Language selection - change this to your preferred language
# Available: en_US, fr_FR, de_DE, es_ES, ja_JP, it_IT, nl_NL, pt_BR, fi_FI, da_DK, nb_NO, sv_SE
_lang="en_US"

_pkgver_nodots="${pkgver//./}"
_installer="AcroRdrDCx64${_pkgver_nodots}_${_lang}.exe"
_wine_commit="11a9c08f0acdd7d3cac863d90f6670840c778c34"
_wine_srcdir="wine-${_wine_commit}"
source=(
    "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/${_pkgver_nodots}/${_installer}"
    "${_wine_srcdir}.tar.bz2::https://gitlab.winehq.org/ajkhoury/wine/-/archive/${_wine_commit}/${_wine_srcdir}.tar.bz2"
    "mspatcha-pe-validation.patch"
    "acroread-dc.sh"
    "acroread-dc-setup.sh"
    "acroread-dc.desktop"
    "acroread-dc.reg"
)
sha256sums=('7164487442ca3b198ec8b395499939ca658c750030be227c2112ba78ed6da7c2'
            '349941ca58b0bc175161716234a4eda3fe3ec5c5b1f3d256e327da2b66aa7107'
            'a0eec4268a0b990aa31eac35f007d9fd58d2a2f58e70a448ef27ceca6ec99e8b'
            'a69382a6c60b16e84ec10c65e0f0bcb771e739976d0ee503fd284bea621d48fc'
            'ee0b3e2aabcbedbc26c708235fc337b4850d1eb588b5e463faeca7bf245ecbb4'
            'e04eacab60902549a0de3aa72c3bdb64f78a71b508bb942fc9a1117716376275'
            '2be03c810ba30b402e0406910ce7db5bee2588bfab8b7f60fda003c0c929e134')
noextract=("$_installer")

prepare() {
    cd "$_wine_srcdir"
    patch -Np1 -i "$srcdir/mspatcha-pe-validation.patch"
}

build() {
    local _configure_flags=(
        '--enable-archs=i386,x86_64'
        '--without-alsa'
        '--without-cups'
        '--without-dbus'
        '--without-fontconfig'
        '--without-freetype'
        '--without-gnutls'
        '--without-gstreamer'
        '--without-opencl'
        '--without-pcap'
        '--without-pulse'
        '--without-sdl'
        '--without-udev'
        '--without-unwind'
        '--without-usb'
        '--without-vulkan'
        '--without-wayland'
        '--without-x'
    )

    mkdir -p build-mspatcha
    cd build-mspatcha
    "../$_wine_srcdir/configure" "${_configure_flags[@]}"

    make \
        dlls/mspatcha/i386-windows/mspatcha.dll \
        dlls/mspatcha/x86_64-windows/mspatcha.dll

    tools/winegcc/winegcc \
        -o "$srcdir/mspatcha-x64.dll" \
        --wine-objdir . \
        -b x86_64-w64-mingw32 \
        -shared \
        "../$_wine_srcdir/dlls/mspatcha/mspatcha.spec" \
        dlls/mspatcha/x86_64-windows/lzxd_dec.o \
        dlls/mspatcha/x86_64-windows/md5.o \
        dlls/mspatcha/x86_64-windows/mspatcha_main.o \
        dlls/mspatcha/x86_64-windows/pa19.o \
        dlls/mspatcha/version.res \
        dlls/winecrt0/x86_64-windows/libwinecrt0.a \
        dlls/ucrtbase/x86_64-windows/libucrtbase.a \
        dlls/kernel32/x86_64-windows/libkernel32.a \
        dlls/ntdll/x86_64-windows/libntdll.a

    tools/winegcc/winegcc \
        -o "$srcdir/mspatcha-x86.dll" \
        --wine-objdir . \
        -b i686-w64-mingw32 \
        -shared \
        "../$_wine_srcdir/dlls/mspatcha/mspatcha.spec" \
        dlls/mspatcha/i386-windows/lzxd_dec.o \
        dlls/mspatcha/i386-windows/md5.o \
        dlls/mspatcha/i386-windows/mspatcha_main.o \
        dlls/mspatcha/i386-windows/pa19.o \
        dlls/mspatcha/version.res \
        dlls/winecrt0/i386-windows/libwinecrt0.a \
        dlls/ucrtbase/i386-windows/libucrtbase.a \
        dlls/kernel32/i386-windows/libkernel32.a \
        dlls/ntdll/i386-windows/libntdll.a \
        -Wl,--disable-stdcall-fixup

    x86_64-w64-mingw32-strip --strip-unneeded "$srcdir/mspatcha-x64.dll"
    i686-w64-mingw32-strip --strip-unneeded "$srcdir/mspatcha-x86.dll"
}

check() {
    cd "$srcdir"

    bash -n acroread-dc.sh acroread-dc-setup.sh
    desktop-file-validate acroread-dc.desktop

    local _listing
    _listing="$(7z l "$_installer")"
    grep -Fq "FileVersion: ${pkgver/002/2}.0" <<< "$_listing"
    grep -Fq "AcroRdrDCx64Upd${_pkgver_nodots}.msp" <<< "$_listing"
    grep -Fq "setup.exe" <<< "$_listing"
    7z t "$_installer" >/dev/null

    make -C build-mspatcha \
        dlls/mspatcha/tests/i386-windows/mspatcha_test.exe \
        dlls/mspatcha/tests/x86_64-windows/mspatcha_test.exe

    # Wine rejects prefixes with mismatched ownership on root-mapped FUSE
    # mounts. Create the test prefix on a native temporary filesystem.
    local _test_root
    _test_root="$(mktemp -d "${TMPDIR:-/tmp}/mspatcha-test.XXXXXXXX")"
    local _test_prefix="$_test_root/prefix"
    local _test_runtime="$_test_root/runtime"
    install -dm700 "$_test_runtime"
    install -dm755 "$_test_root/x86" "$_test_root/x64"
    install -m755 mspatcha-x86.dll "$_test_root/x86/mspatcha.dll"
    install -m755 mspatcha-x64.dll "$_test_root/x64/mspatcha.dll"
    install -m755 \
        build-mspatcha/dlls/mspatcha/tests/i386-windows/mspatcha_test.exe \
        "$_test_root/x86/"
    install -m755 \
        build-mspatcha/dlls/mspatcha/tests/x86_64-windows/mspatcha_test.exe \
        "$_test_root/x64/"

    export WINEPREFIX="$_test_prefix"
    export WINEARCH='win64'
    export WINEDEBUG='-all'
    export XDG_RUNTIME_DIR="$_test_runtime"
    xvfb-run -a \
        -s '-screen 0 1280x1024x24 -extension GLX -nolisten tcp' \
        wineboot -u
    wineserver -w
    install -m755 mspatcha-x64.dll \
        "$_test_prefix/drive_c/windows/system32/mspatcha.dll"
    install -m755 mspatcha-x86.dll \
        "$_test_prefix/drive_c/windows/syswow64/mspatcha.dll"
    export WINEDLLOVERRIDES='mspatcha=n,b'

    local _arch _suite
    for _arch in x64 x86; do
        for _suite in apply_patch signature; do
            xvfb-run -a \
                -s '-screen 0 1280x1024x24 -extension GLX -nolisten tcp' \
                wine "$_test_root/$_arch/mspatcha_test.exe" "$_suite"
        done
    done
    wineserver -w
    rm -rf "$_test_root"
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "$_installer" "$pkgdir/opt/$pkgname/$_installer"
    install -Dm644 mspatcha-x64.dll "$pkgdir/opt/$pkgname/mspatcha-x64.dll"
    install -Dm644 mspatcha-x86.dll "$pkgdir/opt/$pkgname/mspatcha-x86.dll"
    install -Dm755 acroread-dc.sh "$pkgdir/opt/$pkgname/acroread-dc.sh"
    install -Dm755 acroread-dc-setup.sh "$pkgdir/opt/$pkgname/acroread-dc-setup.sh"
    install -Dm644 acroread-dc.reg "$pkgdir/opt/$pkgname/acroread-dc.reg"
    install -Dm644 "$_wine_srcdir/COPYING.LIB" \
        "$pkgdir/usr/share/licenses/$pkgname/Wine-COPYING.LIB"

    wrestool -x -t 14 -n 128 -o AcroRead.ico "$_installer"
    icotool -x AcroRead.ico -o "$srcdir"
    install -Dm644 AcroRead_1_256x256x32.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/acroread-dc.png"

    mkdir -p eula
    7z e "$_installer" -oeula Core.cab -y >/dev/null
    cabextract -q -F license.html_A207C02C2B9D452BA2534E38026A90BF \
        -d eula eula/Core.cab
    install -Dm644 eula/license.html_A207C02C2B9D452BA2534E38026A90BF \
        "$pkgdir/usr/share/licenses/$pkgname/Adobe-EULA.html"

    install -Dm644 acroread-dc.desktop "$pkgdir/usr/share/applications/acroread-dc.desktop"
    ln -s "/opt/$pkgname/acroread-dc.sh" "$pkgdir/usr/bin/acroread-dc"
}
