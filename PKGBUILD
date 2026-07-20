# Maintainer: leoneii comdir@infonix.info

# Версии всех трёх продуктов зафиксированы (НЕ "master") - обновляются вручную
# локальным скриптом check-update.sh (не входит в AUR-репозиторий), который
# проверяет апстрим через лёгкие JSON-манифесты update.saby.ru/rules/<Продукт>.json
# и сам вызывает updpkgsums для пересчёта чек-сумм. Здесь, в PKGBUILD,
# никакой сетевой логики во время сборки нет - только фиксированные версии.

name=SabyDesktop
pkgname=sabydesktop
url="https://saby.ru/"
pkgver=26.3239.22
pkgrel=1
pkgdesc="SabyDesktop- приложения от Сбис, включая сбис-плагин, предоставляет доступ к дополнительным инструментам и сервисам saby, например использованию электронной подписи"
arch=('x86_64')
license=('Custom')

# Версии вспомогательных продуктов - могут отличаться от pkgver самого
# SabyDesktop. Обновляются вместе с pkgver в check-update.sh.
_ver_nmh="26.3200.227"
_ver_center="26.3200.247"

# Локальные имена файлов включают версию - иначе при обновлении версии
# новый .deb рискует не перезаписать (или не отличаться от) старого кэша
# с тем же фиксированным именем.
_saby_deb="saby-${pkgver}.deb"
_nmh_deb="nmh-transport-${_ver_nmh}.deb"
_center_deb="sabycenter-${_ver_center}.deb"

source=("${_saby_deb}::https://update.saby.ru/SabyDesktop/${pkgver}/linux/deb_repo/saby.deb"
        "${_nmh_deb}::https://update.saby.ru/NmhTransport/${_ver_nmh}/linux/deb_repo/nmh-transport.deb"
        "${_center_deb}::https://update.saby.ru/SabyCenter/${_ver_center}/linux/deb_repo/sabycenter.deb")
sha256sums=('4497a267f6a60fb91069913505070d5a1464ce8ddcd3f82b48ef34e0401ee570'
            '0d31285d89638b1a470f87ca7c9a03ac0d26b42904a7cd5f08915d213df6c07c'
            'ce223e26e77a1424e19e3b284088b7816981880073e84f52763de2bb9a9240fd')

depends=(
  'glibc'
  'gcc-libs'
  'util-linux-libs'
)

build() {
  echo "Skiping build....."
}

package() {
  # Копируем необходимые файлы в каталог пакета
  echo "Extracting the data.tar.xz..."
    # Перебираем известные .deb файлы (явные переменные, а не basename(source[]) -
    # т.к. локальное имя файла теперь отличается от хвоста URL из-за версии в имени)
    local deb_files=("${_saby_deb}" "${_nmh_deb}" "${_center_deb}")
    for deb_name in "${deb_files[@]}"; do
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
        local src_rel="${pair%%:*}"
        local dst_rel="${pair#*:}"

        local src_dir="${pkgdir}/${src_rel}"
        local dst_dir="${pkgdir}/${dst_rel}"

        msg2 "Перенос файлов из ${src_rel##*/} в основную директорию..."

        if [ -d "${src_dir}" ]; then
            mkdir -p "${dst_dir}"
            cp -ra "${src_dir}/." "${dst_dir}/"
            rm -rf "${src_dir}"
        else
            warning "Директория ${src_rel} не найдена в этой сессии сборки. Пропускаем."
        fi
    done

    # 4. Иконка: .deb уже кладёт её по фиксированному пути (не зависит от версии) —
    #    /opt/Tensor/Saby/icons/, поэтому копировать/искать версию не нужно.
    if [ ! -f "${pkgdir}/opt/Tensor/Saby/icons/default_dark.png" ]; then
        warning "Иконка default_dark.png не найдена по ожидаемому пути — .desktop будет без своей иконки."
    fi

    # 5. Помечаем версию как "проверенную" — маркер, который .deb обычно создаёт
    #    в postinst-скрипте (integrity.checked). Без него бинарник saby
    #    отказывается запускаться, тихо завершаясь с кодом 1.
    _verdir=$(find "${pkgdir}/opt/Tensor/Saby" -maxdepth 1 -type d -regextype posix-extended \
        -regex '.*/[0-9]+\.[0-9]+\.[0-9]+' 2>/dev/null | sort -V | tail -n1)

    if [ -n "${_verdir}" ]; then
        touch "${_verdir}/integrity.checked"
    else
        warning "Версионная директория не найдена — integrity.checked не создан, saby может не запуститься."
    fi

    # 6. Создаём .desktop-файл (ярлык в меню приложений) — запускаем saby напрямую,
    #    без обёртки: бинарник сам находит свою версию и LD_LIBRARY_PATH не требуется.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=SabyDesktop
Comment=${pkgdesc}
Exec=/opt/Tensor/Saby/saby
Icon=/opt/Tensor/Saby/icons/default_dark.png
Terminal=false
Type=Application
Categories=Office;Network;
EOF
}
