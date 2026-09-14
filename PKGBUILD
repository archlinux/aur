# Maintainer: Norman Kettler <jagelor@yandex.ru>
# Contributors:
#   Vitaly Lipatov <lav@altlinux.ru>     (ALT Wine, патчи, сборка)
#   Alexey Shabalin <shaba@altlinux.org> (ALT Wine)
#   Aleksei Nikiforov <darktemplar@altlinux.org> (ALT Wine)
#   Wine Staging Team                    (патчи wine-staging)
#   WineHQ                               (upstream Wine)
# Based on: https://git.altlinux.org/gears/w/wine.git
# SRPM:     https://packages.altlinux.org/en/sisyphus/srpms/wine/

pkgname=wine-alt
pkgver=11.7.1
pkgrel=1
pkgdesc="Wine from ALT Linux Sisyphus (staging + ALT patches, new WoW64)"
arch=('x86_64')
url="https://www.altlinux.org/Wine"
license=('LGPL-2.1-or-later')
options=('!strip' '!debug' '!lto')
install='wine-alt.install'

# Runtime-зависимости — только жёстко линкованное.
# Всё остальное — в optdepends (см. ниже).
depends=(
    'glibc' 'libgcc' 'attr'
    'freetype2' 'fontconfig'
    'libx11' 'libxext' 'libxcursor' 'libxi' 'libxrandr'
    'libxkbcommon' 'wayland'
    'libpcap' 'libunwind'
    'hicolor-icon-theme'
)

makedepends=(
    # Инструменты сборки
    'clang' 'llvm' 'lld' 'git' 'autoconf'
    'flex' 'bison' 'pkgconf' 'python'

    # Заголовки для winebus (USB, Bluetooth через BlueZ)
    'systemd' 'dbus'

    # Заголовки для опциональных фич.
    # В Arch нет отдельных -devel-пакетов: заголовки лежат
    # в тех же пакетах, что и runtime.
    'alsa-lib' 'libpulse' 'pipewire-jack' 'libcups'
    'gnutls' 'libgcrypt' 'libsasl' 'krb5' 'unixodbc'
    'vulkan-headers' 'vulkan-icd-loader' 'opencl-headers' 'ocl-icd'
    'libva' 'v4l-utils' 'glu' 'ffmpeg'
    'libgphoto2' 'sane' 'pcsclite' 'libusb' 'sdl2-compat'
    'libpng' 'libjpeg-turbo' 'libtiff' 'libxml2' 'libxslt'
    'samba'

    # Для сборки winex11/winewayland драйверов
    'libx11' 'libxext' 'libxrender' 'libxfixes' 'libxcursor'
    'libxcomposite' 'libxdamage' 'libxrandr' 'libxi' 'libxinerama'
    'libxmu' 'libxpm' 'libxaw' 'libxxf86vm' 'libxxf86dga'
    'libxss' 'libxres' 'libxtst' 'libxkbfile' 'libfontenc'
    'libxv' 'libxvmc' 'libxcb' 'libxau' 'libxdmcp' 'libice' 'libsm'
    'wayland' 'libxkbcommon' 'libpcap' 'libunwind'
    'libpciaccess' 'libxfont2' 'libxft' 'libieee1284' 'gtk3'
    'perl-xml-simple'
)

optdepends=(
    # Звук
    'alsa-lib: звук через ALSA (старые системы)'
    'libpulse: звук через PulseAudio'
    'pipewire-jack: JACK-аудио для профессиональной звукозаписи'
    # Печать
    'libcups: печать через CUPS'
    # Криптография и сетевая аутентификация
    'gnutls: TLS/SSL в приложениях'
    'libgcrypt: криптографические функции'
    'libsasl: SASL-аутентификация (SMTP, LDAP)'
    'krb5: Kerberos (домены Windows/AD)'
    'unixodbc: ODBC-драйверы баз данных'
    # Графика и вычисления
    'vulkan-icd-loader: Vulkan (DirectX 10+, vkd3d)'
    'ocl-icd: OpenCL'
    'libva: аппаратное декодирование видео'
    'v4l-utils: захват видео (веб-камеры)'
    'glu: GLU-утилиты OpenGL'
    'ffmpeg: мультимедиа-кодеки (видео в MF)'
    # Периферия и устройства
    'libgphoto2: цифровые камеры'
    'sane: сканеры'
    'pcsclite: смарт-карты и токены'
    'libusb: USB-устройства'
    'sdl2-compat: геймпады через SDL'
    'dbus: устройства Bluetooth через BlueZ'
    # Кодеки изображений и XML
    'libpng: PNG-изображения'
    'libjpeg-turbo: JPEG-изображения'
    'libtiff: TIFF-изображения'
    'libxml2: XML-парсер'
    'libxslt: XSLT-трансформации'
    # Wine-специфика
    'wine-mono: .NET-приложения (Office, 1С)'
    'wine-gecko: HTML-рендеринг внутри Wine'
    'winetricks: установка Windows-библиотек в префикс'
    'xorg-xwayland: X11-драйвер в Wayland-сессии (рекомендуется)'
    'perl: для winemaker и function_grep.pl (разработка)'
    'samba: netapi32 (интеграция с AD, сетевые SMB-шары)'
)

_srpm_url="https://mirror.yandex.ru/altlinux/Sisyphus/x86_64/SRPMS.classic/wine-11.7.1-alt1.src.rpm"
source=("wine-11.7.1-alt1.src.rpm::${_srpm_url}")

sha256sums=('a745dca21b5bbf65da2d65313faf08da2905a19ed64fc4748dd29850a4793942')

provides=('wine' 'wine-staging' 'wine-common')
conflicts=('wine' 'wine-staging' 'wine-git' 'wine-tkg-git' 'wine-common' 'wine-etersoft' 'wine-stable')

prepare() {
    cd "$srcdir"

    printf '==> %s\n' "Распаковка SRPM..."
    bsdtar -xf wine-11.7.1-alt1.src.rpm

    printf '==> %s\n' "Распаковка исходников Wine..."
    tar xf wine-11.7.1.tar
    cd wine-11.7.1

    tar xf "$srcdir/wine-staging-11.7.1.tar"
    tar xf "$srcdir/wine-patches-11.7.1.tar"

    printf '==> %s\n' "Применение патчей wine-staging..."
    python ./wine-staging/staging/patchinstall.py \
        DESTDIR="$PWD" --all --backend=patch

    printf '==> %s\n' "Применение ALT-патчей..."
    bash ./wine-patches/patchapply.sh

    printf '==> %s\n' "Перегенерация configure..."
    autoconf -f
}

build() {
    cd "$srcdir/wine-11.7.1"

    # clang/lld обязательны для --with-mingw=clang
    export CC=clang
    export CXX=clang++
    export LD=lld

    printf '==> %s\n' "Конфигурация Wine (new WoW64)..."
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --bindir=/usr/bin \
        --with-x \
        --disable-win16 \
        --enable-archs=i386,x86_64 \
        --disable-tests \
        --without-gstreamer \
        --without-oss \
        --with-alsa \
        --with-pulse \
        --with-cups \
        --without-capi \
        --with-opencl \
        --with-pcap \
        --with-mingw=clang \
        --with-vulkan \
        --with-sdl \
        --with-wayland \
        --with-ffmpeg

    printf '==> %s\n' "Сборка (это надолго)..."
    make depend
    make
}

package() {
    cd "$srcdir/wine-11.7.1"

    printf '==> %s\n' "Установка..."
    make DESTDIR="$pkgdir" install

    # Права: как в ALT-спеке.
    # Сначала снимаем +x со всего, потом возвращаем настоящим бинарникам.
    find "$pkgdir/usr/lib/wine/x86_64-unix"    -type f -exec chmod 0644 {} +
    find "$pkgdir/usr/lib/wine/x86_64-windows" -type f -exec chmod 0644 {} +
    find "$pkgdir/usr/lib/wine/i386-windows"   -type f -exec chmod 0644 {} +
    chmod 0755 "$pkgdir/usr/lib/wine/x86_64-unix/"{wine,wine-preloader}

    # wine_make_autoreq_happy — специфичный для ALT трюк для RPM-автозависимостей:
    # линкуется со всеми опциональными библиотеками, чтобы RPM-сканер их заметил.
    # В Arch зависимости объявляются явно; файл только сбивает namcap и даёт ложные E:.
    rm -f "$pkgdir/usr/lib/wine/x86_64-unix/wine_make_autoreq_happy"

    # --- Strip PE-файлов (как в ALT-спеке, ветка x86_64) ---
    printf '==> %s\n' "Strip PE-файлов (i386 + x86_64)..."
    local pe_dirs=(
        "$pkgdir/usr/lib/wine/i386-windows"
        "$pkgdir/usr/lib/wine/x86_64-windows"
    )
    for d in "${pe_dirs[@]}"; do
        [[ -d "$d" ]] || continue
        # DLL и EXE — GNU strip
        find "$d" -maxdepth 1 -type f ! -name '*.a' -exec strip {} + 2>/dev/null || true
    done

    # Импорт-библиотеки (.a с COFF-объектами) — GNU strip их не понимает,
    # используем llvm-strip, который умеет заглядывать внутрь ar-архивов.
    printf '==> %s\n' "Strip импорт-библиотек (.a)..."
    for d in "${pe_dirs[@]}"; do
        [[ -d "$d" ]] || continue
        find "$d" -maxdepth 1 -type f -name '*.a' \
            -exec llvm-strip --strip-debug {} + 2>/dev/null || true
    done

    printf '==> %s\n' "Восстановление builtin-маркеров..."
    local _winebuild="$srcdir/wine-11.7.1/tools/winebuild/winebuild"
    if [[ -x "$_winebuild" ]]; then
        for d in "${pe_dirs[@]}"; do
            [[ -d "$d" ]] || continue
            "$_winebuild" --builtin "$d"/* 2>/dev/null || true
        done
    fi

    # --- Desktop-файлы ---
    printf '==> %s\n' "Установка .desktop-файлов..."
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/desktop-directories"
    tar xf "$srcdir/wine-11.7.1-desktop.tar" -C "$pkgdir/usr/share/applications/"     --wildcards '*.desktop'
    tar xf "$srcdir/wine-11.7.1-desktop.tar" -C "$pkgdir/usr/share/desktop-directories/" --wildcards '*.directory'
    rm -f "$pkgdir/usr/share/applications/wine.desktop"

    # --- Иконки ---
    printf '==> %s\n' "Установка иконок..."
    install -d "$pkgdir/usr/share/icons"
    tar xf "$srcdir/wine-11.7.1-icons.tar" -C "$pkgdir/usr/share/icons/"

    printf '==> %s\n' "Готово."
}
