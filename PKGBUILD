# Maintainer: leoneii comdir@infonix.info

# Госплагин ("Gosplugin") - локальный модуль (native messaging host) для работы
# с электронной подписью на Госуслугах. Современная замена устаревшему IFCPlugin
# (тот - отдельный продукт, может стоять параллельно, конфликта нет).
#
# Апстрим не публикует ни .rpm, ни «голый» .deb и ни apt-репозиторий - только
# самораспаковывающийся инсталлятор Gosplugin_Linux-Debian_Installer.deb.sh
# (bash-скрипт с приклеенным tar-архивом после маркера PAYLOAD:, внутри один
# gosuslugi-plugin_<версия>_amd64.deb). Поэтому версия здесь зафиксирована
# вручную и обновляется локальным check-update.sh (не входит в AUR-репозиторий),
# который перекачивает инсталлятор, вытаскивает версию из имени .deb и вызывает
# updpkgsums. В самом PKGBUILD никакой сетевой логики во время сборки нет.

pkgname=gosplugin-bin
_debname=gosuslugi-plugin
pkgver=1.3.19.0
pkgrel=1
pkgdesc="Госплагин - локальный модуль для работы с электронной подписью на портале Госуслуг (native messaging host для браузерного расширения)"
arch=('x86_64')
url="https://www.gosuslugi.ru/landing/gosplugin"
license=('LicenseRef-proprietary')

provides=("${_debname}=${pkgver}")
conflicts=("${_debname}")

# Сборка полностью самодостаточная: своя Qt 5.11, boost 1.83, OpenSSL 3, xerces/xalan
# и прочее лежат в /opt/iitrust/gosuslugi_plugin/lib и подхватываются через
# LD_LIBRARY_PATH в bin/gosuslugi_plugin.sh. Снаружи нужны только те библиотеки,
# которые реально остаются неразрешёнными (посчитано по DT_NEEDED основного
# бинарника, ядра Qt и xcb-плагина платформы).
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
  'xcb-util'
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

_installer="Gosplugin_Linux-Debian_Installer-${pkgver}.deb.sh"
source=("${_installer}::https://gu-st.ru/content/Gosplugin/Gosplugin_Linux-Debian_Installer.deb.sh")
noextract=("${_installer}")
sha256sums=('f9de0a3eebc853c10133d040d9ab39963b509dff3ea3ca63621a8e163a6ce3f5')

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

  # 2. Разворачиваем data.tar.* прямо в $pkgdir. Maintainer-скриптов
  #    (postinst и т.п.) в .deb нет - только md5sums и control, так что
  #    установка сводится к раскладке файлов.
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

  # 4. xcb-плагин платформы Qt тянет libxcb-util.so.0, а в Arch пакет xcb-util
  #    (0.4.x) даёт только libxcb-util.so.1. Нужный плагину символ
  #    (xcb_aux_create_gc) в новой версии на месте, поэтому кладём compat-симлинк
  #    в собственный lib-каталог плагина - он первым в LD_LIBRARY_PATH и
  #    на систему не влияет. Без этого не грузится платформа xcb, и плагин
  #    падает при попытке показать окно ввода пароля к контейнеру.
  echo "  -> Добавление compat-симлинка libxcb-util.so.0 -> libxcb-util.so.1..."
  ln -sf /usr/lib/libxcb-util.so.1 \
     "${pkgdir}/opt/iitrust/gosuslugi_plugin/lib/libxcb-util.so.0"

  # 5. Манифесты native messaging host уже разложены самим .deb:
  #      /etc/opt/chrome/native-messaging-hosts  - Chrome
  #      /etc/chromium/native-messaging-hosts    - Chromium, Яндекс.Браузер, Vivaldi
  #      /usr/lib/mozilla/native-messaging-hosts - Firefox
  #    (проверено: и yandex_browser, и vivaldi-bin ищут именно в
  #    /etc/chromium/native-messaging-hosts, отдельные пути им не нужны).
}
