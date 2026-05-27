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

    # 2. Распаковываем содержимое в pkgdir
    bsdtar -xf "${data_tar}" -C "${pkgdir}/"

    # 3. Удаляем Debian-специфичные файлы
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -f "${pkgdir}/etc/init.d/kerio-kvc"

    # 4. Распаковываем EULA (он в .gz формате) — ИСПРАВЛЕННАЯ ВЕРСИЯ
    local eula_gz="${pkgdir}/usr/share/doc/kerio-control-vpnclient/EULA.txt.gz"
    if [[ -f "$eula_gz" ]]; then
        # Создаём целевую директорию явно
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
        # Распаковываем и копируем
        gunzip -c "$eula_gz" > "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
        chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
        # Опционально: удаляем оригинальный .gz, чтобы не дублировать
        # rm -f "$eula_gz"
    else
        echo "WARNING: EULA.txt.gz not found at expected path, skipping license install"
    fi

    # 5. Фиксим права на исполняемые файлы
    chmod 755 "${pkgdir}/usr/sbin/kvpncsvc" 2>/dev/null || true
    find "${pkgdir}/usr/lib" -name "*.so*" -exec chmod 755 {} \; 2>/dev/null || true
}
