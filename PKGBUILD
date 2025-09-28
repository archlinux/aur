# Maintainer: Velade <support@velhlkj.com>
# Contributor: 程式夥伴 (AI Assistant)

pkgname=scrcpy-launcher
pkgver=3.3.1
pkgrel=1
pkgdesc="A simple launcher for scrcpy, built with NW.js."
arch=('x86_64')
url="https://github.com/velade/scrcpy-launcher"
license=('MIT')

depends=('gtk3' 'nss' 'alsa-lib' 'libxtst' 'libxss' 'scrcpy' 'android-tools')
makedepends=()

_archive_filename="Scrcpy_Launcher_Linux64.tar.gz"
source=("${pkgname}-v${pkgver}-${_archive_filename}::https://github.com/velade/scrcpy-launcher/releases/download/${pkgver}/${_archive_filename}"
        "${pkgname}.desktop"
        "LICENSE::https://raw.githubusercontent.com/velade/scrcpy-launcher/${pkgver}/LICENSE")

sha256sums=('62778fe298a1fafd49c585fda14b3ab392d6aa0ac363a0578cf3d5d6eb635a05'
            'e50cde4a31dbfa162da8305734ba85ff8ed0026e52303c9f8c8bddd4318ae6d9'
            'a6f3cabbef34490c82cf1eaaadfe3591c5dc8f3924c11c9da74609b660c7c72d')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/app_extracted_contents"

  mv "${srcdir}/app" \
     "${srcdir}/lib" \
     "${srcdir}/locales" \
     "${srcdir}/swiftshader" \
     "${srcdir}/node_modules" \
     "${srcdir}/chrome_crashpad_handler" \
     "${srcdir}/credits.html" \
     "${srcdir}/icudtl.dat" \
     "${srcdir}/nw_100_percent.pak" \
     "${srcdir}/nw_200_percent.pak" \
     "${srcdir}/package.json" \
     "${srcdir}/resources.pak" \
     "${srcdir}/Scrcpy_logo.png" \
     "${srcdir}/ScrcpyLauncher" \
     "${srcdir}/v8_context_snapshot.bin" \
     "${srcdir}/app_extracted_contents/"
  rm "${srcdir}/app_extracted_contents/app/tmp/wallpaper.webp"
}

build() {
  :
}

package() {
  # 建立目標安裝目錄 /opt/scrcpy-launcher
  install -d "${pkgdir}/opt/${pkgname}"

  # 從 prepare() 中整理好的目錄複製所有應用程式檔案到 /opt/scrcpy-launcher/
  cp -R "${srcdir}/app_extracted_contents/"* "${pkgdir}/opt/${pkgname}/"

  # 批量修正權限：
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +

  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  
  # 確保tmp檔案夾有創建和刪除權限
  chmod -c 777 "${pkgdir}/opt/${pkgname}/app/tmp/"
  
  # 確保主執行檔案有執行權限
  chmod +x "${pkgdir}/opt/${pkgname}/ScrcpyLauncher"
  chmod +x "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"

  # 安裝 .desktop 檔案到 /usr/share/applications/
  # ${srcdir}/${pkgname}.desktop 是你本地提供的檔案
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # 安裝 LICENSE 檔案
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
