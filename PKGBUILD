# Maintainer: Dima <your.email@example.com>
pkgname=kerio-control-vpnclient-9.5-p3
pkgver=9.5.0.9017
pkgrel=6
pkgdesc="Kerio Control VPN Client 9.5 (corporate patch 3)"
arch=('x86_64')
url="https://www.kerio.com/products/kerio-control"
license=('custom:EULA')
depends=('systemd' 'openssl' 'libnl')
optdepends=('networkmanager: for GUI integration')
provides=('kerio-control-vpnclient')
conflicts=('kerio-control-vpnclient')

# ⚠️ ЗАМЕНИ НА РЕАЛЬНУЮ ПУБЛИЧНУЮ ССЫЛКУ!
source=("https://cdn.kerio.com/dwn/control/control-9.5.0-9017/kerio-control-vpnclient-9.5.0-9017-p3-linux-amd64.deb")
sha256sums=('bcfa7919d0a944a150097e7a0942f191d7e6d00b306c2707270223e9d8b91475')

# Бинарный пакет — компиляция не нужна
build() {
    :
}

package() {
    cd "${srcdir}"

    # 1. Находим data.tar.* внутри .deb
    local data_tar
    data_tar=$(bsdtar -tf *.deb | grep -E "^data\.tar\.(gz|xz|zst)$" | head -1)

    if [[ -z "$data_tar" ]]; then
        echo "ERROR: Could not find data.tar in .deb"
        return 1
    fi

    # 2. Распаковываем во временную папку
    local tmp_extract="${srcdir}/_extract"
    mkdir -p "$tmp_extract"
    bsdtar -xf "${data_tar}" -C "$tmp_extract"

    # 3. Копируем файлы поштучно через install -D
    # Это создаёт нужные директории, но НЕ добавляет их в манифест пакета как "владельца"
    cd "$tmp_extract"
    find . -type f | while read -r file; do
        local relpath="${file#./}"  # убираем "./" в начале
        install -Dm644 "$file" "${pkgdir}/${relpath}"
    done

    # 4. Исправляем права на исполняемые файлы и библиотеки
    find "${pkgdir}" -type f \( \
        -name "*.so*" -o \
        -path "*/sbin/*" -o \
        -path "*/bin/*" -o \
        -path "*/systemd/*" \
    \) -exec chmod 755 {} \;

    # 5. Распаковываем EULA (он в .gz)
    local eula_gz="${pkgdir}/usr/share/doc/kerio-control-vpnclient/EULA.txt.gz"
    if [[ -f "$eula_gz" ]]; then
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
        gunzip -c "$eula_gz" > "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
        chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
    fi

    # 6. Удаляем Debian-специфичный мусор
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -f "${pkgdir}/etc/init.d/kerio-kvc"

    # 7. Чистим временные файлы
    rm -rf "$tmp_extract"
}
