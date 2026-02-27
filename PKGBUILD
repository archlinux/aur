# Maintainer: 你的AUR用户名 <你的邮箱>
pkgname=kdwrite  # 包名，小写、无空格，建议唯一
pkgver=1.2.4          # 口袋写作的版本号（和官方一致）
pkgrel=1              # 打包版本（首次发布为1）
pkgdesc="口袋写作 - 跨平台写作工具（Arch Linux通过Wine运行）"
arch=('x86_64')       # 架构（口袋写作大概率是64位）
url="https://www.kdwrite.cn"  # 替换为真实官网
license=('custom:Proprietary')  # 闭源软件的许可证声明
depends=('wine' 'winetricks' 'ttf-dejavu' 'wqy-microhei')   # 运行依赖（Wine核心）后两个是字体包
optdepends=('zenity: 图形化提示' 'xdg-utils: 打开默认浏览器')
source=("${pkgname}-${pkgver}.exe::https://oss.kdwrite.cn/0_app/kdwrite_v1.2.4.exe"  # 替换为真实下载链接
        "${pkgname}.desktop"
        "MicrosoftEdgeWebView2RuntimeInstallerX64.exe::https://go.microsoft.com/fwlink/p/?LinkId=2124703"
        "${pkgname}.png"
        )  # 可选：应用图标（需自己准备）
noextract=("${pkgname}-${pkgver}.exe")  # 不自动解压exe
sha256sums=('2e056ae5c47a32f45ba06df1068d55fa5087a7697f1ff3e1e41a488f889a5a2b'
            'ea89477560caac0a9ddf8a1513e7ad91cb1c430a0beffbc432f8b5e81ce0bbe3'
            '79859394908084c68804bc6c43b5fd090b1d2d76434645ee2f3a76ced4153594'
            '63014613fe9a5b3b747b5175fe37787e3ec07d7bb3c9ae4e354e55b34605bc11')

# 构建阶段（无编译，仅准备文件）
build() {
  export WINEARCH=win64
  export WINEDEBUG=-all
  export LANG=zh_CN.UTF-8

  # 1. 安装.NET 4.8和中文字体
  winetricks -q dotnet48 fontsmooth=rgb cjkfonts

  # 2. 安装VC++ 2015运行库
  winetricks --force vcrun2015

#   # 3. 用winetricks自动安装WebView2（关键修改）
#   winetricks -q webview2

  # 4. 禁用Edge更新服务
  cat > "${srcdir}/disable_edgeupdate.reg" << EOF
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\edgeupdate]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\edgeupdatem]
"Start"=dword:00000004
EOF

  wine regedit "${srcdir}/disable_edgeupdate.reg"
}

# 安装阶段
package() {
  # 1. 创建安装目录
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  # 2. 复制Windows程序到opt目录（Arch标准第三方软件目录）
  cp "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/opt/${pkgname}/"

  # 3. 创建启动脚本（核心：用Wine运行程序）
  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
cd /opt/${pkgname}
wine /opt/${pkgname}/${pkgname}-${pkgver}.exe "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${pkgname}"  # 赋予执行权限

  # 4. 安装桌面文件（让应用出现在系统菜单）
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # 5. 安装图标（可选，提升体验）
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}