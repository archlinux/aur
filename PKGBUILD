# Maintainer: duanluan <duanluan@outlook.com>

pkgname=opensquilla
pkgver=0.5.4
pkgrel=1
pkgdesc='OpenSquilla desktop app repackaged from the official macOS release'
arch=('x86_64')
url='https://opensquilla.cn/zh/'
license=('Apache-2.0')
depends=(
  'electron42'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=(
  '7zip'
  'python'
  'python-pillow'
)
options=('!strip' '!lto')
source=(
  "OpenSquilla-${pkgver}-mac-arm64.dmg::https://github.com/TokenRhythm/opensquilla/releases/download/v${pkgver}/OpenSquilla-${pkgver}-mac-arm64.dmg"
  "opensquilla-${pkgver}-py3-none-any.whl::https://github.com/TokenRhythm/opensquilla/releases/download/v${pkgver}/opensquilla-${pkgver}-py3-none-any.whl"
  'opensquilla.sh'
  'opensquilla-gateway.sh'
  'opensquilla.desktop'
)
noextract=("OpenSquilla-${pkgver}-mac-arm64.dmg")
sha256sums=(
  '0be553894467c1887090da965fcceab8a2e908c05fc9b890966d5882de3600d3'
  '79a8644b6e62d9dbab602684189cff0350c2d6637d0df050d49c9a7a98b8f3f6'
  'c101ed4bf5ff25352e2fc6136b7c5e4f542ec9c8724354f3afade11bbf6de939'
  'SKIP'
  'a5e72781a32dec1ac68ce5ab9d09539c8919d2785667996b8d7ffc2c1c0ad5f3'
)

prepare() {
  cd "${srcdir}"
  rm -rf dmg resources app.asar boot.html runtime app-update.yml opensquilla.png
  mkdir -p dmg resources

  7z x -bd -y "OpenSquilla-${pkgver}-mac-arm64.dmg" -odmg >/dev/null

  local appdir resources_dir icon_path asar_tmpdir
  appdir="$(find dmg -maxdepth 4 -type d -name 'OpenSquilla.app' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${appdir}" ]] || {
    echo 'Could not find OpenSquilla.app in upstream dmg' >&2
    return 1
  }

  resources_dir="${appdir}/Contents/Resources"
  icon_path="${resources_dir}/icon.icns"

  install -Dm644 "${resources_dir}/app.asar" app.asar
  install -Dm644 "${resources_dir}/boot.html" boot.html

  if [[ -d "${resources_dir}/runtime" ]]; then
    cp -a "${resources_dir}/runtime" .
    find runtime -type f \( -name '.DS_Store' -o -name '._*' -o -name '*:com.apple.*' \) -delete
  fi


  if [[ -f "${resources_dir}/app-update.yml" ]]; then
    install -Dm644 "${resources_dir}/app-update.yml" app-update.yml
  fi

  asar_tmpdir="$(mktemp -d)"
  trap 'rm -rf "${asar_tmpdir}"' RETURN
  npx --yes asar extract app.asar "${asar_tmpdir}/app" >/dev/null
  python - "${asar_tmpdir}/app/dist/main.js" <<'PY'
from pathlib import Path
import sys
path = Path(sys.argv[1])
text = path.read_text()
text = text.replace('process.resourcesPath', 'dirname(app.getAppPath())')
text = text.replace('app.isPackaged', 'true')
path.write_text(text)
PY
  npx --yes asar pack "${asar_tmpdir}/app" app.asar >/dev/null

  python - "${icon_path}" <<'PY'
from pathlib import Path
from PIL import Image
import sys
img = Image.open(Path(sys.argv[1]))
img.save('opensquilla.png')
PY
}

package() {
  cd "${srcdir}"

  install -dm755 \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}/resources" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

  install -Dm755 "${srcdir}/opensquilla.sh" \
    "${pkgdir}/usr/bin/opensquilla"
  install -Dm644 "${srcdir}/opensquilla.desktop" \
    "${pkgdir}/usr/share/applications/opensquilla.desktop"

  install -Dm644 app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"
  install -Dm644 boot.html \
    "${pkgdir}/usr/lib/${pkgname}/resources/boot.html"

  if [[ -d runtime ]]; then
    cp -a runtime \
      "${pkgdir}/usr/lib/${pkgname}/resources/"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/resources/runtime/gateway/opensquilla-gateway"
  fi

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/resources/runtime/gateway"
  install -Dm755 "${srcdir}/opensquilla-gateway.sh" \
    "${pkgdir}/usr/lib/${pkgname}/resources/runtime/gateway/opensquilla-gateway"
  install -Dm644 "${srcdir}/opensquilla-${pkgver}-py3-none-any.whl" \
    "${pkgdir}/usr/lib/${pkgname}/resources/runtime/gateway/opensquilla-${pkgver}-py3-none-any.whl"

  if [[ -f app-update.yml ]]; then
    install -Dm644 app-update.yml \
      "${pkgdir}/usr/lib/${pkgname}/resources/app-update.yml"
  fi

  install -Dm644 opensquilla.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/opensquilla.png"
}

