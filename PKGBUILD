# Maintainer: duanluan <duanluan@outlook.com>
# Contributor: Kacper Zybała <zyperpl at gmail dot com> (PKGBUILD 参考 AUR ldtk)

pkgname=ldtk-git
pkgver=1.5.3.r13.g2b7b551
pkgrel=1
pkgdesc='Modern and efficient 2D level editor with a strong focus on user-friendliness (git master)'
arch=('x86_64')
url='https://github.com/deepnight/ldtk'
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxcursor' 'libxi'
         'libxcomposite' 'libxdamage' 'libxfixes' 'libxrandr' 'libxkbcommon'
         'libdrm' 'mesa' 'at-spi2-core' 'cups' 'pango' 'libdbusmenu-glib')
makedepends=('git' 'haxe' 'nodejs' 'npm')
provides=('ldtk')
conflicts=('ldtk')
options=('!strip' '!makeflags')
source=("git+${url}.git"
        'ldtk-git.desktop')
sha256sums=('SKIP'
            '68ff7f1083f03bd93d773cff5edab3e8f7004dbdd0f0accbda69439affd2c008')

pkgver() {
  cd ldtk
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # 在 srcdir 建立本地 haxelib 仓库，避免污染全局 haxelib 安装
  haxelib deleterepo --quiet --always
  haxelib newrepo

  cd ldtk
  # 上游脚本：安装 haxelib 依赖（git 依赖跟随各库默认分支，与 master 构建一致）
  haxe setup.hxml
  haxelib list

  cd app
  npm install --cache "${srcdir}/npm-cache"
  # pack-prepare 编译 Haxe 产物；--dir 只输出 linux-unpacked，跳过 AppImage/snap 安装器打包
  npm run pack-prepare --cache "${srcdir}/npm-cache"
  npx electron-builder build --linux --x64 --dir --publish never
}

package() {
  cd ldtk
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # electron-builder 产物：linux-unpacked 为解包目录，直接安装免去 AppImage 解包
  cd app/redist/linux-unpacked
  install -Dm644 LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  find . -type f -exec install -Dm755 '{}' "${pkgdir}/usr/share/${pkgname}/{}" \;

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/ldtk" "${pkgdir}/usr/bin/ldtk"

  cd "${srcdir}/ldtk"
  install -Dm644 app/assets/appIcon.png "${pkgdir}/usr/share/pixmaps/ldtk.png"
  install -Dm644 "${srcdir}/ldtk-git.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
