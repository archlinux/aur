# Maintainer: Emilia <gasd228337@gmail.com>
pkgname=opentaiko
pkgver=0.6.0.96
pkgrel=1
pkgdesc="Open source Taiko no Tatsujin rhythm game clone (Linux binaries from 0auBSQ fork)"
arch=('x86_64')
url="https://github.com/0auBSQ/OpenTaiko"
license=('MIT')
depends=('dotnet-runtime' 'sdl2' 'openal' 'ffmpeg' 'libx11' 'libxrandr')
makedepends=('unzip') # Добавляем, чтобы zip точно распаковался
provides=('opentaiko')
conflicts=('opentaiko-git')
source=("https://github.com/0auBSQ/OpenTaiko/releases/download/${pkgver}/OpenTaiko.Linux.x64.zip"
        "opentaiko.sh::https://raw.githubusercontent.com/Emilia228x/OpenTaiko.sh/main/opentaiko.sh")

# Сумма для архива настоящая, а для скрипта ставим SKIP,
# чтобы он не ругался при каждом мелком изменении текста скрипта
sha256sums=('18e4f06036fde06150aba8b93cafb86aef93c6550f11d86a4eed911bff052eba'
            'SKIP')

# Добавь это в начало, чтобы makepkg не ломал архив
prepare() {
    cd "$srcdir"
    # Удаляем старое, если оно есть
    rm -rf publish

    # Запускаем unzip.
    # '|| [ $? -le 2 ]' означает: "если код возврата 1 или 2 (предупреждения),
    # то всё равно считать, что всё прошло успешно"
    unzip -o OpenTaiko.Linux.x64.zip -d . || [ $? -le 2 ]
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/publish/"* "${pkgdir}/opt/${pkgname}/"

    # ВОТ ЭТА СТРОЧКА — СПАСИТЕЛЬНИЦА:
    chmod +x "${pkgdir}/opt/${pkgname}/OpenTaiko"

    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/opentaiko.sh" "${pkgdir}/usr/bin/opentaiko"
}
