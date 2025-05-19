# Maintainer: Your Name <your_email@example.com>
# Contributor: 程式夥伴 (AI Assistant)

pkgname=scrcpy-launcher
pkgver=1.9.0 # 請在更新時修改此版本號
pkgrel=1
pkgdesc="A simple launcher for scrcpy, built with NW.js."
arch=('x86_64')
url="https://github.com/velade/scrcpy-launcher"
license=('MIT')

# 依賴: gtk3, nss, alsa-lib, libxtst, libxss 是 NW.js 的常見依賴
# scrcpy 和 android-tools (提供 adb) 是此啟動器功能所需的
depends=('gtk3' 'nss' 'alsa-lib' 'libxtst' 'libxss' 'scrcpy' 'android-tools')
makedepends=() # 預編譯的 NW.js 通常不需要

# 來源檔案
# 1. 從 GitHub Release 下載的預編譯 NW.js 應用程式壓縮檔
# 2. 你本地的 .desktop 檔案
# 3. 從 GitHub 下載的 LICENSE 檔案
_archive_filename="Scrcpy_Launcher_Linux64.tar.gz"
source=("${pkgname}-v${pkgver}-${_archive_filename}::https://github.com/velade/scrcpy-launcher/releases/download/${pkgver}/${_archive_filename}"
        "${pkgname}.desktop"
        "LICENSE::https://raw.githubusercontent.com/velade/scrcpy-launcher/${pkgver}/LICENSE")

# 校驗和 - 請務必在更新 pkgver 或修改 .desktop 檔案後更新這些值
# Scrcpy_Launcher_Linux64.tar.gz (v0.1.8) 的 SHA256 校驗和
# LICENSE (for v0.1.8) 的 SHA256 校驗和
sha256sums=('8acc1b01a3131db7de3153b4b0fad674d03546f9477efcb256283549972cfecf'
            '93b6dd07d33b0153bcfba6721797290839410870b8f7a379998b4e5fe306de46'
            'a6f3cabbef34490c82cf1eaaadfe3591c5dc8f3924c11c9da74609b660c7c72d')

# prepare() 函數用於整理原始碼，因為 .tar.gz 檔案解壓縮後沒有根目錄
prepare() {
  cd "${srcdir}"
  # 建立一個臨時目錄來存放解壓縮後的應用程式檔案，避免與 .desktop 和 LICENSE 檔案混淆
  mkdir -p "${srcdir}/app_extracted_contents"

  # 將 .tar.gz 解壓縮到臨時目錄
  # makepkg 已經自動解壓縮了 source[0] (我們的 .tar.gz) 到 $srcdir
  # 我們需要將這些檔案移動到 app_extracted_contents/

  mv "${srcdir}/app" \
     "${srcdir}/lib" \
     "${srcdir}/locales" \
     "${srcdir}/swiftshader" \
     "${srcdir}/chrome_crashpad_handler" \
     "${srcdir}/credits.html" \
     "${srcdir}/icudtl.dat" \
     "${srcdir}/nw_100_percent.pak" \
     "${srcdir}/nw_200_percent.pak" \
     "${srcdir}/package.json" \
     "${srcdir}/resources.pak" \
     "${srcdir}/Scrcpy_logo.png" \
     "${srcdir}/Scrcpy啟動器" \
     "${srcdir}/user_config.json.org" \
     "${srcdir}/v8_context_snapshot.bin" \
     "${srcdir}/app_extracted_contents/"
}

# build() 函數對於預編譯的二進位檔案通常是空的
build() {
  # 不需要編譯步驟
  : # Bash 'no-op' (什麼都不做)
}

package() {
  # 建立目標安裝目錄 /opt/scrcpy-launcher
  install -d "${pkgdir}/opt/${pkgname}"

  # 從 prepare() 中整理好的目錄複製所有應用程式檔案到 /opt/scrcpy-launcher/
  cp -R "${srcdir}/app_extracted_contents/"* "${pkgdir}/opt/${pkgname}/"
  cp "${srcdir}/app_extracted_contents/user_config.json.org" "${pkgdir}/opt/${pkgname}/user_config.json"

  # 批量修正權限：
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +

  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  
  # 確保主執行檔案有執行權限
  chmod +x "${pkgdir}/opt/${pkgname}/Scrcpy啟動器"
  chmod +x "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"
  chmod -c 666 "${pkgdir}/opt/${pkgname}/user_config.json"

  # 安裝 .desktop 檔案到 /usr/share/applications/
  # ${srcdir}/${pkgname}.desktop 是你本地提供的檔案
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # 安裝 LICENSE 檔案
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
