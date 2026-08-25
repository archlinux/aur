# Maintainer: Zoopotik <zoopotik123467@gmail.com>
# Contributor: Jaja <jaja@mailbox.org>
# Contributor: floriplum <floriplum@mailbox.org>
# Contributor: various people submitting to 'chaotic-aur' repo
# Contributor: barfin (aka RogueGirl) <barfin@protonmail.com>

pkgname=proton-ge-bin
pkgdesc='A fancy custom distribution of Valves Proton with various patches (auto-tracks latest release)'
_repourl='https://github.com/GloriousEggroll/proton-ge-custom'

# Авто-определение последнего релиза
_latesttag=$(curl -s --max-time 10 --retry 2 -o /dev/null -w '%{url_effective}' -L "${_repourl}/releases/latest" | sed 's#.*/tag/##')
pkgver=${_latesttag//-/_}
pkgrel=1
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
url="${_repourl}"

provides=('proton' "proton-ge-custom=${pkgver/_/.}")
conflicts=('proton-ge-custom' 'proton-ge-custom-bin')

depends=('python')
optdepends=(
  'vulkan-icd-loader'
  'lib32-vulkan-icd-loader: dxvk dependency for 32bit prefixes'
  'vulkan-driver: driver to be used by dxvk'
  'lib32-openal'
  'lib32-vkd3d'
  'lib32-libva'
  'lib32-speex'
  'lib32-libtheora'
  'lib32-libvdpau'
  'gst-plugins-bad-libs'
  'lib32-gst-plugins-base-libs'
  'libjpeg-turbo'
  'lib32-libjpeg-turbo'
  'graphene'
  'lib32-libgudev'
  'lib32-mpg123'
  'libsoup'
  'lib32-openssl'
  'lib32-libusb'
  'kdialog: KDE splash dialog support'
  'zenity: GNOME splash dialog support'
  'python-kivy: splash dialog support (big picture mode)'
  'steam: use proton with steam like intended'
  'winetricks: protonfixes backend - highly recommended'
  'wine: support for 32bit prefixes'
  'xboxdrv: gamepad driver service'
)

options=(!strip !debug emptydirs pestrip)
install=pleasenote.install

_pkgver=${pkgver//_/-}
_protondir=usr/share/steam/compatibilitytools.d/${pkgname}
_licensedir=usr/share/licenses/${pkgname}
_execfile=usr/bin/proton-ge
_protoncfg=${_protondir}/user_settings.py

backup=("${_protoncfg}")

# Обрати внимание: файл конфига указан как 'proton-ge-custom-bin.conf',
# чтобы скрипт нашел его в твоей текущей папке без переименования.
source=("${_pkgver}_${pkgrel}-x86_64.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}-x86_64.tar.gz"
  "${_pkgver}-x86_64.sha512sum::${url}/releases/download/${_pkgver}/${_pkgver}-x86_64.sha512sum"
  'user_settings.py'
  'launcher.sh'
  'proton-ge-custom-bin.conf'
  'pam_limits.conf')
sha512sums=('SKIP'
  'SKIP'
  '09b6523516b07ec40b895867ef3cdb5dfb1eda6b188d0edf0acea9c3141583f43b2b5c1a396f4d52eb2ddb3ae6f111b4a7bc6409c003f09ff8c505b81f2a7297'
  '78ede6d50f9c43407da511c8b37dcf60aae2ddbd461c0081f0d0ce3de08ace3a84dee86e9253acbac829b47c5818ef4e1a354ccb05feaa9853ce279dc3f903fd'
  'ac2bd634838ffe6b90f2637e229013f0993fc1013271dbeefd216dc262a8bb79e4a5ce15a75cbfcb0c3b521d32f4ebe1ed25a6b066b99cc327b60bd6d7212e6f'
  '60bcb1ad899d108fca9c6267321d11871feae96b696e44607ef533becc6decb493e93cbe699382e8163ad83f35cfa003a059499c37278f31afeba4700be6e356')

prepare() {
  cd "${srcdir}"
  local _expected _actual
  _expected=$(awk '{print $1}' "${_pkgver}-x86_64.sha512sum")
  _actual=$(sha512sum "${_pkgver}_${pkgrel}-x86_64.tar.gz" | awk '{print $1}')
  if [[ "${_expected}" != "${_actual}" ]]; then
    error "sha512 mismatch: expected ${_expected}, got ${_actual}"
    return 1
  fi
  msg2 "sha512 verified: ${_expected}"
}

build() {
  cd "${srcdir}"
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "launcher.sh"
  sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "${_pkgver}-x86_64/compatibilitytool.vdf"

  # Агрессивный параллельный стрип ВСЕХ бинарников (даже без расширений) > 1MB
  find "${_pkgver}-x86_64/files" -type f -size +1M -print0 \
    | xargs -0 -P "$(nproc)" -I {} bash -c '
        case "$(file -b "$1" 2>/dev/null)" in
          *ELF*|*PE32*|*PE32+*) strip --preserve-dates --strip-unneeded "$1" 2>/dev/null ;;
        esac
      ' _ {} \
    || true
}

package() {
  local _src="${srcdir}/${_pkgver}-x86_64"
  local _dest="${pkgdir}/${_protondir}"

  # Установка (reflink=auto делает мгновенное копирование на BTRFS/XFS)
  install -d "${_dest}"
  cp -a --reflink=auto "${_src}"/. "${_dest}/" 2>/dev/null || cp -a "${_src}"/. "${_dest}/"

  cd "${_dest}"

  # Удаление мусора
  rm -rf ./docs ./doc ./man ./tests ./test ./.github ./.gitlab-ci.yml
  rm -f ./README* ./CHANGELOG* ./CONTRIBUTING* ./.gitignore ./.gitmodules

  find . -type d \( -name '__pycache__' -o -name '.git*' \) -prune -exec rm -rf {} + 2>/dev/null || true
  find . -type f \( -name '*.pyc' -o -name '*.pyo' -o -name '*.orig' \
    -o -name '*.bak' -o -name '*.rej' -o -name '.DS_Store' \) -delete
  find . -type d -empty -delete 2>/dev/null || true

  # Лицензии
  install -d "${pkgdir}/${_licensedir}"
  [[ -f ./LICENSE ]] && mv ./LICENSE "${pkgdir}/${_licensedir}/license"
  [[ -f ./LICENSE.OFL ]] && mv ./LICENSE.OFL "${pkgdir}/${_licensedir}/license_OFL"
  [[ -f ./PATENTS.AV1 ]] && mv ./PATENTS.AV1 "${pkgdir}/${_licensedir}/license_AV1"

  # Конфиги (берем proton-ge-custom-bin.conf, сохраняем как proton-ge-bin.conf)
  install -Dm0775 -g 50 "${srcdir}/user_settings.py" "${pkgdir}/${_protoncfg}"
  install -Dm0644 "${srcdir}/pam_limits.conf" "${pkgdir}/etc/security/limits.d/10-games.conf"
  install -Dm0644 "${srcdir}/proton-ge-custom-bin.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

  # Лаунчер
  install -Dm0755 "${srcdir}/launcher.sh" "${pkgdir}/${_execfile}"
}
