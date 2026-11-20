# Maintainer: leoneii comdir@infonix.info

# Госплагин ("Gosplugin") - локальный модуль (native messaging host) для работы
# с электронной подписью на Госуслугах. Современная замена устаревшему IFCPlugin
# (тот - отдельный продукт, может стоять параллельно, конфликта нет).
#
# Апстрим не публикует ни .rpm, ни «голый» .deb, ни apt-репозиторий - только
# zip с самораспаковывающимся инсталлятором Gosplugin_Linux-Debian_Installer.deb.sh
# (bash-скрипт с приклеенным tar-архивом после маркера PAYLOAD:, внутри один
# gosuslugi-plugin_<версия>_amd64.deb). Версии в URL тоже нет, поэтому она
# зафиксирована здесь вручную и обновляется локальным check-update.sh (в
# AUR-репозиторий не входит): он качает zip, достаёт версию из имени .deb и
# вызывает updpkgsums. В самом PKGBUILD никакой сетевой логики при сборке нет.
#
# ВНИМАНИЕ: по старому адресу .../Gosplugin_Linux-Debian_Installer.deb.sh до сих
# пор лежит протухшая сборка 1.3.19.0 (март 2025). Актуальная раздача - .deb.zip.

pkgname=gosplugin-bin
_debname=gosuslugi-plugin
pkgver=1.3.43.1
pkgrel=1
pkgdesc="Госплагин - локальный модуль для работы с электронной подписью на портале Госуслуг (native messaging host для браузерного расширения)"
arch=('x86_64')
url="https://www.gosuslugi.ru/landing/gosplugin"
license=('LicenseRef-proprietary')

provides=("${_debname}=${pkgver}")
conflicts=("${_debname}")

# Сборка полностью самодостаточная: своя Qt 5.11, boost, OpenSSL 3,
# xerces/xalan, даже libxcb-util лежат в /opt/iitrust/gosuslugi_plugin/lib и
# подхватываются через LD_LIBRARY_PATH в bin/gosuslugi_plugin.sh. Снаружи нужно
# только то, что реально остаётся неразрешённым (посчитано по DT_NEEDED всех ELF
# в бандле за вычетом того, что он несёт с собой).
depends=(
  'glibc'
  'gcc-libs'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'harfbuzz'
  'libglvnd'
  'libice'
  'libpng'
  'libsm'
  'libx11'
  'libxcb'
  'libxi'
  'libxrender'
  'pcsclite'
  'zlib'
)

optdepends=(
  'pcsc-tools: диагностика смарт-карт и USB-токенов'
  'ccid: драйвер CCID для большинства USB-токенов'
  'libjpeg6-turbo: поддержка JPEG в интерфейсе плагина (Qt-плагин imageformats требует libjpeg.so.62)'
  'libcups: печать из окон плагина'
)

# Вендорная сборка - ничего не трогаем: strip может испортить бинарники,
# а debug-пакет из чужих .so всё равно бессмысленен.
options=('!strip' '!debug' '!lto')

install="${pkgname}.install"

# zip распаковывает сам makepkg, так что в $srcdir оказывается .sh-инсталлятор
# с фиксированным (без версии) именем.
_installer="Gosplugin_Linux-Debian_Installer.deb.sh"
source=("Gosplugin_Linux-Debian_Installer-${pkgver}.deb.zip::https://gu-st.ru/content/Gosplugin/Gosplugin_Linux-Debian_Installer.deb.zip")
sha256sums=('f7ab21f9ef21b2090a189ff7df2147074f4252e1255930df689d3f31acc258f2')

package() {
  cd "${srcdir}"

  # 1. Вытаскиваем .deb из инсталлятора. Сам скрипт НЕ запускаем (он зовёт
  #    dpkg и ставит мимо пакетного менеджера) - повторяем только его
  #    install_payload(): всё после строки "PAYLOAD:" - это tar.
  echo "  -> Извлечение payload из инсталлятора..."
  local _offset
  _offset=$(grep --text --line-number '^PAYLOAD:$' "${_installer}" | cut -d: -f1)
  if [ -z "${_offset}" ]; then
    echo "!! Маркер PAYLOAD не найден в ${_installer} - формат инсталлятора изменился." >&2
    return 1
  fi

  mkdir -p "${srcdir}/payload"
  tail -n +$((_offset + 1)) "${_installer}" | tar -xC "${srcdir}/payload"

  local _deb
  _deb=$(find "${srcdir}/payload" -type f -name "${_debname}_*_amd64.deb" | head -n1)
  if [ -z "${_deb}" ]; then
    echo "!! Внутри payload не найден ${_debname}_*_amd64.deb" >&2
    return 1
  fi
  echo "  -> Найден пакет: $(basename "${_deb}")"

  # 2. Разворачиваем data.tar.* прямо в $pkgdir (в 1.3.43.1 это .xz, в прежних
  #    сборках был .gz - перебираем варианты). Из maintainer-скриптов в .deb
  #    есть только preinst/prerm, и оба лишь прибивают запущенный процесс
  #    плагина - это воспроизведено в ${pkgname}.install, раскладка файлов
  #    ничего больше не требует.
  echo "  -> Распаковка data.tar..."
  bsdtar -O -xf "${_deb}" data.tar.gz | bsdtar -xf - -C "${pkgdir}" 2>/dev/null || \
  bsdtar -O -xf "${_deb}" data.tar.xz | bsdtar -xf - -C "${pkgdir}" 2>/dev/null || \
  bsdtar -O -xf "${_deb}" data.tar.zst | bsdtar -xf - -C "${pkgdir}"

  # 3. В Arch /usr/lib64 - это симлинк на /usr/lib (пакет filesystem), а .deb
  #    кладёт туда НАСТОЯЩИЙ каталог с манифестом для Firefox. Оставить его
  #    нельзя - pacman выдаст конфликт с filesystem. Тот же самый манифест
  #    уже есть в /usr/lib/mozilla и /usr/share/mozilla, так что просто
  #    выбрасываем дубль.
  if [ -d "${pkgdir}/usr/lib64" ]; then
    echo "  -> Удаление /usr/lib64 (в Arch это симлинк на /usr/lib)..."
    rm -rf "${pkgdir}/usr/lib64"
  fi

  # 4. Манифесты native messaging host уже разложены самим .deb:
  #      /etc/opt/chrome/native-messaging-hosts  - Chrome
  #      /etc/chromium/native-messaging-hosts    - Chromium, Яндекс.Браузер, Vivaldi
  #      /usr/lib/mozilla/native-messaging-hosts - Firefox
  #    (проверено: и yandex_browser, и vivaldi-bin ищут именно в
  #    /etc/chromium/native-messaging-hosts, отдельные пути им не нужны).
}
