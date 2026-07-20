# Maintainer: leoneii comdir@infonix.info

#для установки необходимо скачать официальный Appimage с сайта, запустить, проигрнорировать неизвестный дистрибутив и попытаться установить, получив в итоге ошибку
#после этого в папке /home/имя пользователя/.tmp/Tensor/Saby/ останутся необходимые файлы установка
#если кто-то знает прямые пути - буду рад исправить

name=SabyDesktop
pkgname=sabydesktop
url="https://saby.ru/"
pkgver=26.3239.22
pkgrel=1
pkgdesc="SabyDesktop- приложения от Сбис, включая сбис-плагин, предоставляет доступ к дополнительным инструментам и сервисам saby, например использованию электронной подписи"
arch=('x86_64')
license=('Custom')
_debsdir="${HOME}/.tmp/Tensor/Saby"
source=("saby.deb::file://${_debsdir}/saby.deb"
         "nmh-transport.deb::file://${_debsdir}/nmh-transport.deb"
         "sabycenter.deb::file://${_debsdir}/sabycenter.deb")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

makedepends=(
)
depends=(
)

build() {
  echo "Skiping build....."

}

package() {
  # Копируем необходимые файлы в каталог пакета
  echo "Extracting the data.tar.xz..."
    # Перебираем все .deb файлы из массива source
    for file in "${source[@]}"; do
        # Очищаем путь, оставляя только имя файла (например, app1.deb)
        deb_name=$(basename "${file}")

        msg2 "Распаковка пакета: ${deb_name}"

        # Извлекаем внутренний архив и СРАЗУ распаковываем его содержимое в $pkgdir
        # bsdtar умеет читать поток из stdout через '-'
        bsdtar -O -xf "${srcdir}/${deb_name}" data.tar.xz | bsdtar -xf - -C "${pkgdir}" 2>/dev/null || \
        bsdtar -O -xf "${srcdir}/${deb_name}" data.tar.gz | bsdtar -xf - -C "${pkgdir}" 2>/dev/null || \
        bsdtar -O -xf "${srcdir}/${deb_name}" data.tar.zst | bsdtar -xf - -C "${pkgdir}"
    done

        # 2. Описание папок для переноса (в формате "откуда:куда")
    local paths_to_move=(
        "opt/Tensor/Saby/temp_saby:opt/Tensor/Saby"
        "opt/Tensor/Saby Center/temp_sabycenter:opt/Tensor/Saby Center"
        "opt/nmh-transport/temp_nmh:opt/nmh-transport"
    )

    # 3. Перенос содержимого в цикле
    for pair in "${paths_to_move[@]}"; do
        # Разделяем строку по двоеточию на исходный и целевой каталоги
        local src_rel="${pair%%:*}"
        local dst_rel="${pair#*:}"

        local src_dir="${pkgdir}/${src_rel}"
        local dst_dir="${pkgdir}/${dst_rel}"

        msg2 "Перенос файлов из ${src_rel##*/} в основную директорию..."

        if [ -d "${src_dir}" ]; then
            # Создаем целевую папку, если она вдруг не создалась при распаковке
            mkdir -p "${dst_dir}"
            # Копируем всё содержимое (включая скрытые файлы) с сохранением прав
            cp -ra "${src_dir}/." "${dst_dir}/"
            # Удаляем временную папку
            rm -rf "${src_dir}"
        else
            # Используем warning вместо error, чтобы сборка не падала,
            # если какой-то из deb-пакетов не содержит одну из этих папок
            warning "Директория ${src_rel} не найдена в этой сессии сборки. Пропускаем."
        fi
    done

    # 4. Копируем иконку в фиксированное место — путь к ней "плавает" вместе с версией
    _icon_verdir=$(find "${pkgdir}/opt/Tensor/Saby" -maxdepth 1 -type d -regextype posix-extended \
        -regex '.*/[0-9]+\.[0-9]+\.[0-9]+' 2>/dev/null | sort -V | tail -n1)

    if [ -n "${_icon_verdir}" ] && [ -f "${_icon_verdir}/service/icons/default_light.ico" ]; then
        install -Dm644 "${_icon_verdir}/service/icons/default_light.ico" \
            "${pkgdir}/opt/Tensor/Saby/sabydesktop.ico"
    else
        warning "Иконка default_light.ico не найдена — .desktop будет без своей иконки."
    fi

    # 5. Создаём wrapper-скрипт: находит последнюю версию в /opt/Tensor/Saby
    #    и запускает saby с LD_LIBRARY_PATH, указывающим на .../service/
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sabydesktop" <<'EOF'
#!/usr/bin/env bash
BASEDIR="/opt/Tensor/Saby"

# Ищем директории вида "26.3239.22" (версионные подпапки) и берём самую свежую
VERDIR=$(find "${BASEDIR}" -maxdepth 1 -type d -regextype posix-extended \
    -regex '.*/[0-9]+\.[0-9]+\.[0-9]+' 2>/dev/null | sort -V | tail -n1)

if [ -n "${VERDIR}" ] && [ -d "${VERDIR}/service" ]; then
    export LD_LIBRARY_PATH="${VERDIR}/service:${LD_LIBRARY_PATH}"
fi

exec "${BASEDIR}/saby" "$@"
EOF

    # 6. Создаём .desktop-файл (ярлык в меню приложений), указывающий на wrapper
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=SabyDesktop
Comment=${pkgdesc}
Exec=/usr/bin/sabydesktop
Icon=/opt/Tensor/Saby/sabydesktop.ico
Terminal=false
Type=Application
Categories=Office;Network;
EOF
  #bsdtar -xf data.tar.xz -C "$pkgdir/"
}

