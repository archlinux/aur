# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

_name=atom
pkgname=atom-editor-git
pkgver=1.35.0.r1175.g48ca032eb
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century - git channel'
arch=('x86_64')
url="https://atom.io/"
license=('MIT' 'custom')
depends=('apm' 'electron4' 'libxkbfile' 'ripgrep')
makedepends=('git' 'npm')
optdepends=('ctags: symbol indexing support'
            'git: Git and GitHub integration')
replaces=('atom-editor')
options=(!emptydirs)
source=("git+https://github.com/atom/atom.git"
        'atom.js'
        'dugite-use-system-git.patch'
        'fix-atom-sh.patch'
        'fix-license-path.patch'
        'fix-restart.patch'
        'git-utils.patch'
        'no-unsafe-eval-warning.patch'
        'node-env-production.patch'
        'symbols-view-use-system-ctags.patch'
        'use-system-apm.patch'
        'use-system-electron.patch')
sha256sums=('SKIP'
            'd286e0766e47cfea73cd207abb9d6f7375846688823e72732c871a852b4b261d'
            '530b46d31df0f5e8f5881e1608a66fe75d549092a6db2e72ba3ad69c48714153'
            'b3d3706519556a59ba557b695017c9debe8b23efe2782cdb440131520bc0540d'
            '2894cce31935d45291c5fe4c625473bb83fc51e1b899f162aa6b419491c7ace1'
            'e3c30c03006d23a72f07fa77f4309b16a6059af1179343033a87f74f50124076'
            'e321fdfe880cd465918dd1dbb90e4c7d46fc5310f20666eddf0a41cbca4f8ac8'
            '40d783794d62f12f3c429c624a84265871c7ed95f4120c9db800348896dd5437'
            'a09439c2a908ca174ff3be1f0d85071d12c792ae19748e36fe601e372d6d925b'
            '3c68e6b3751313e1d386e721f8f819fb051351fb2cf8e753b1d773a0f475fef8'
            '8d48dca4571136375b325f4bf94ccfb996e90e57b7fdf83d53c1eb2e69b3b0d4'
            '81af763f05c1afd87705b8c7a6647e35f524b2e952adb2e596de2a7e8fe4e69e')


pkgver() {
    cd ${_name}
    # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_name}

  patch -Np1 -i ../fix-atom-sh.patch
  patch -Np1 -i ../use-system-electron.patch
  patch -Np1 -i ../use-system-apm.patch
  patch -Np1 -i ../fix-license-path.patch
  patch -Np1 -i ../fix-restart.patch
  patch -Np1 -i ../node-env-production.patch
  patch -Np1 -i ../no-unsafe-eval-warning.patch
}

build() {
  cd ${_name}

  ATOM_RESOURCE_PATH="${PWD}" \
  npm_config_build_from_source=true \
  npm_config_target=$(< /usr/lib/electron4/version) \
  apm install

  # Use system ctags
  cd node_modules/symbols-view
  patch -Np1 -i "${srcdir}"/symbols-view-use-system-ctags.patch
  rm -r vendor
  cd ../..

  # Use system git
  cd node_modules/dugite
  patch -Np1 -i "${srcdir}"/dugite-use-system-git.patch
  rm -r git
  cd ../..

  # Fix issue with:
  # build/Release/git.node: undefined symbol: git_net_url_is_default_port
  cd node_modules/git-utils
  patch -Np1 -i "${srcdir}"/git-utils.patch
  env \
    npm_config_disturl=https://electronjs.org/headers \
    npm_config_runtime=electron \
    npm_config_target=$(< /usr/lib/electron4/version) \
    node-gyp rebuild
  cd ../..

  cd script
  # Hack to avoid using Node 12
  env \
    npm_config_disturl=https://electronjs.org/headers \
    npm_config_runtime=electron \
    npm_config_target=$(< /usr/lib/electron4/version) \
    npm install
  # Set ELECTRON_VERSION (see use-system-electron.patch)
  env \
    ELECTRON_RUN_AS_NODE=1 \
    ELECTRON_VERSION=$(< /usr/lib/electron4/version) \
    electron4 \
    build --no-bootstrap
}

package() {
  cd ${_name}

  install -d -m 755 "${pkgdir}"/usr/lib
  cp -r out/app "${pkgdir}"/usr/lib/atom
  install -m 644 out/startup.js "${pkgdir}"/usr/lib/atom
  install -m 755 "${srcdir}/atom.js" "${pkgdir}"/usr/lib/atom/atom

  ln -sf /usr/bin/rg "${pkgdir}/usr/lib/atom/node_modules/vscode-ripgrep/bin/rg"

  install -d -m 755 "${pkgdir}/usr/share/applications"
  sed -e "s|<%= appName %>|Atom|" \
      -e "s/<%= description %>/${pkgdesc}/" \
      -e "s|<%= installDir %>|/usr|" \
      -e "s|<%= appFileName %>|atom|" \
      -e "s|<%= iconPath %>|atom|" \
      resources/linux/atom.desktop.in > "${pkgdir}/usr/share/applications/atom.desktop"

  for size in 16 24 32 48 64 128 256 512 1024; do
    install -D -m 644 resources/app-icons/stable/png/${size}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/atom.png
  done
  ln -sf ../../../share/icons/hicolor/1024x1024/apps/atom.png \
      "${pkgdir}"/usr/lib/atom/resources/atom.png

  install -D -m 755 atom.sh "${pkgdir}/usr/bin/atom"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  node -e "require('./script/lib/get-license-text')().then((licenseText) => require('fs').writeFileSync('${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md', licenseText))"

  # Remove useless stuff
  find "${pkgdir}"/usr/lib/atom/node_modules \
      -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "*.c" -exec rm '{}' \; \
      -or -name "*.cpp" -exec rm '{}' \; \
      -or -name "*.node" -exec chmod a-x '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "scripts" -prune -exec rm -r '{}' \; \
      -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
      -or -path "*/task-lists/src" -prune -exec rm -r '{}' \;
}
