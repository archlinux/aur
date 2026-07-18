# Maintainer: leoneii comdir@infonix.info

#для установки необходимо скачать официальный Appimage с сайта, запустить, проигрнорировать неизвестный дистрибутив и попытаться установить, получив в итоге ошибку
#после этого в папке /home/имя пользователя/.tmp/Tensor/Saby/ останутся необходимые файлы установка
#если кто-то знает прямые пути - буду рад исправить

name=SabyDesktop
pkgname=sabydesktop
url="https://saby.ru/"
pkgver=26.2232.38
pkgrel=3
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
  #bsdtar -xf data.tar.xz -C "$pkgdir/"
}

