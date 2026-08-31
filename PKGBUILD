pkgname=milkup
pkgver=1.0.18
pkgrel=2
pkgdesc="Cross-platform instant-rendering desktop Markdown editor"
arch=('x86_64')
url="https://github.com/Auto-Plugin/milkup"
license=('MIT')

_electron=electron43
_srcdir="${pkgname}-${pkgver}"

depends=(
  "${_electron}"
  'hicolor-icon-theme'
)

makedepends=(
  'nodejs'
  'pnpm'
  'python'
  'node-gyp'
)

conflicts=(
  'milkup-git'
  'milkup-bin'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('c8e35e003680fde5f5da229949fbbc2cd676ba7028e473fe5782be3342a365f3')

prepare() {
  cd "${srcdir}/${_srcdir}"

  local electron_dist="/usr/lib/${_electron}"
  local electron_version

  if [[ ! -r "${electron_dist}/version" ]]; then
    echo "error: ${electron_dist}/version not found"
    exit 1
  fi

  electron_version="$(<"${electron_dist}/version")"

  ELECTRON_DIST="${electron_dist}" \
    ELECTRON_VERSION="${electron_version}" \
    node <<'EOF'
const fs = require('fs');

const p = JSON.parse(fs.readFileSync('package.json', 'utf8'));

p.scripts ??= {};

p.scripts.preinstall = 'true';
p.scripts.prepare = 'true';

p.devDependencies ??= {};
p.devDependencies.electron = process.env.ELECTRON_VERSION;

p.build ??= {};
p.build.electronDist = process.env.ELECTRON_DIST;
p.build.electronVersion = process.env.ELECTRON_VERSION;
p.build.asar = true;

p.build.linux ??= {};
p.build.linux.target = 'dir';

fs.writeFileSync('package.json', JSON.stringify(p, null, 2) + '\n');
EOF
}

build() {
  cd "${srcdir}/${_srcdir}"

  export HOME="${srcdir}/home"
  export XDG_CACHE_HOME="${srcdir}/xdg-cache"
  export npm_config_cache="${srcdir}/npm-cache"
  export PNPM_HOME="${srcdir}/pnpm-home"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export SKIP_INSTALL_SIMPLE_GIT_HOOKS=1
  export npm_config_nodedir=/usr
  export SHARP_IGNORE_GLOBAL_LIBVIPS=1
  export NODE_ENV=production

  mkdir -p \
    "${HOME}" \
    "${XDG_CACHE_HOME}" \
    "${npm_config_cache}" \
    "${PNPM_HOME}" \
    "${srcdir}/pnpm-store"

  pnpm install --no-frozen-lockfile --store-dir "${srcdir}/pnpm-store"

  pnpm run generate-icons
  pnpm run build

  pnpm exec electron-builder --dir --linux --x64 --publish never
}

package() {
  cd "${srcdir}/${_srcdir}"

  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh

electron="/usr/bin/${_electron}"
app="/usr/lib/${pkgname}/app.asar"

if [ ! -x "\$electron" ]; then
  printf '%s\n' "milkup: missing runtime Electron executable: \$electron" >&2
  exit 1
fi

if [ ! -f "\$app" ]; then
  printf '%s\n' "milkup: missing application archive: \$app" >&2
  exit 1
fi

exec "\$electron" --disable-setuid-sandbox --enable-wayland-ime "\$app" "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 \
    "dist/linux-unpacked/resources/app.asar" \
    "${pkgdir}/usr/lib/${pkgname}/app.asar"

  if [[ -d "dist/linux-unpacked/resources/app.asar.unpacked" ]]; then
    cp -a --no-preserve=ownership \
      "dist/linux-unpacked/resources/app.asar.unpacked" \
      "${pkgdir}/usr/lib/${pkgname}/"
  fi

  install -Dm644 "src/renderer/public/logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 "src/renderer/public/logo.svg" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat >"${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=milkup
Comment=Cross-platform instant-rendering desktop Markdown editor
Comment[zh_CN]=一个跨平台的、即时渲染桌面端 Markdown 编辑器
Exec=milkup %F
Terminal=false
Type=Application
Icon=milkup
Categories=Office;TextEditor;
MimeType=text/markdown;text/x-markdown;
StartupNotify=true
StartupWMClass=milkup
EOF
  chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
