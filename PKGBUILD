# Maintainer: Xingkai Wang <bittervan@zju.edu.cn>
pkgname=wecom-bin
pkgrel=1
pkgdesc='企业微信 Linux 桌面端（腾讯官方原生构建，非 Wine）'
arch=('x86_64' 'aarch64')
url='https://work.weixin.qq.com/'
license=('LicenseRef-proprietary')
depends=('libxcb' 'libx11' 'noto-fonts' 'noto-fonts-cjk')
provides=('wecom')
conflicts=('wecom' 'com.qq.weixin.work.deepin' 'com.qq.weixin.work.deepin.gitee')
options=('!strip' '!debug')

# 腾讯给两个架构的构建号不同（x86_64: 3.5.0.2599，aarch64: 3.5.0.2603），
# 所以 pkgver 按 $CARCH 取值。为了 .SRCINFO 与 PKGBUILD 保持一致，这里用
# 架构无关的 source/sha256sums 数组，而不是 source_x86_64/source_aarch64。
if [[ $CARCH == 'aarch64' ]]; then
  pkgver=3.5.0.2603
  _platform='linux_arm'
  _suffix='arm64'
  _deb="weworklocal-${pkgver}.${_suffix}.deb"
  _sha256='233cc50111647aeecaec45b3002c7a5efcc41ef1d2cc6f5fa72322a75d8b75b1'
else
  pkgver=3.5.0.2599
  _platform='linux_x86'
  _suffix="${CARCH}"
  _deb="weworklocal-${pkgver}.${_suffix}.deb"
  _sha256='682a1c2ee2fb88375c610355eabb3e3cde65b795af10834698490bf4092c8aa6'
fi

source=("${_deb}::https://work.weixin.qq.com/wework_admin/local_download/realdownload?platform=${_platform}&app_logo=qywx&package_type=deb")
sha256sums=("${_sha256}")

package() {
  # deb 里的路径是中文（/opt/企业微信）。makepkg 默认 LC_ALL=C 会让 bsdtar 刷
  # "Can't translate pathname ... to UTF-8" 警告，这里显式给出 UTF-8 locale。
  LC_ALL=C.UTF-8 bsdtar -xOf "${srcdir}/${_deb}" data.tar.gz |
    LC_ALL=C.UTF-8 bsdtar -xf - -C "${pkgdir}"

  # 二进制被 deb 以 0755 打进去了，这里显式确认一次
  chmod 755 "${pkgdir}/opt/企业微信/wwlocal"

  # 命令行入口（可选，方便 wecom 直接起）
  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/企业微信/wwlocal' "${pkgdir}/usr/bin/wecom"
}
