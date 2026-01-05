# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=steamcommunity302
pkgver=14.0.01
pkgreldate=2025/12
pkgrel=1
#epoch=
pkgdesc="羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动"
url="https://www.dogfight360.com/blog/18682/"
arch=('x86_64' 'aarch64')
license=('CC-BY-NC-4.0')
depends=('nss' 'gtk3' 'glibc' 'gcc-libs' 'zlib' 'xorg-xhost')
source_x86_64=("https://www.dogfight360.com/blog/wp-content/uploads/${pkgreldate}/steamcommunity_302_Linux_AMD64_V${pkgver}.tar.gz")
source_aarch64=("https://www.dogfight360.com/blog/wp-content/uploads/${pkgreldate}/steamcommunity_302_Linux_ARM64_V${pkgver}.tar.gz")
md5sums_x86_64=('29c22dc38906954115d75556d9e3f303')
md5sums_aarch64=('cc2f951d4c632cba3a615d8d26815947')
options=(!strip)
backup=(
  opt/steamcommunity302/S302.ini
  opt/steamcommunity302/steamcommunity.key
  opt/steamcommunity302/steamcommunity.crt
  opt/steamcommunity302/steamcommunity.csr
  opt/steamcommunity302/steamcommunityCA.pem
  opt/steamcommunity302/steamcommunityCA.key
  opt/steamcommunity302/steamcommunityCA.crl
)
package() {
  # 1. 建立目标目录
  install -d "${pkgdir}/opt/steamcommunity302"

  # 2. 把二进制及运行所需文件全部放进去
  cp -a "${srcdir}/Steamcommunity_302"/* "${pkgdir}/opt/steamcommunity302/"

  # 3. 给可执行文件加可执行权限
  chmod 755 "${pkgdir}"/opt/steamcommunity302/{Steamcommunity_302,steamcommunity_302.cli,steamcommunity_302.caddy}

  # 4. /usr/bin 下的启动包装脚本
  install -d "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/s302" <<'EOF'
#!/bin/bash
clear
echo ""
# sudo chmod +x /opt/steamcommunity302/{Steamcommunity_302,steamcommunity_302.cli,steamcommunity_302.caddy}
echo -e "\033[31m 首次使用请进入设置保存设置后再启动服务! \033[0m"
if ! xhost | grep -q "SI:localuser:root"; then
    xhost +SI:localuser:root >/dev/null
fi
sudo /opt/steamcommunity302/Steamcommunity_302
EOF
  chmod 755 "${pkgdir}/usr/bin/s302"

}
