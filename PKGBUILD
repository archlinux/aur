# Maintainer: SakuraPuare <sakurapuare@sakurapuare.com>

pkgname=apollo-neo-env-manager-dev
pkgver=10.0.0rc1.r4
pkgrel=3
pkgdesc="Apollo Environment Manager"
arch=('x86_64')
url="https://apollo.baidu.com/"
license=('custom')
depends=('bash-completion' 'python' 'python-requests' 'sudo' 'curl' 'gnupg' 'ca-certificates' 'inetutils')
optdepends=('google-cloud-cli: 对接Google云服务')
makedepends=('binutils')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="${pkgname}.install"
source=("apollo_neo_license::https://github.com/ApolloAuto/apollo/raw/refs/heads/master/LICENSE"
        "apollo-gpg-key::https://apollo-pkg-beta.cdn.bcebos.com/neo/beta/key/deb.gpg.key"
        "${pkgname}-deb::https://apollo-pkg-beta.cdn.bcebos.com/apollo/core/pool/main/a/${pkgname}/${pkgname}_10.0.0-rc1-r4_amd64.deb")
noextract=("${pkgname}-deb")
sha256sums=('SKIP'
            '52fe1c504d1bae9d48f977ef4d181fd7f916747c32d8649a1d290e77dc70800d'
            'a51f016eaf57d0e1d13e838978b6fbd67f7a6275bf271fdca782746edddda9ef')
options=('!strip')

prepare() {
  cd "${srcdir}"
  # 创建提取目录
  mkdir -p extract
  
  # 提取deb包
  bsdtar -xf "${pkgname}-deb" -C extract
  
  # 检查数据包是否存在
  if ! ls extract/data.tar.* >/dev/null 2>&1; then
    echo "错误：无法找到deb包中的数据文件"
    exit 1
  fi
}

package() {
  # 提取deb包内容到目标目录
  cd "${srcdir}"
  
  # 根据deb包中的数据包格式自动决定如何提取
  if tar -tf extract/data.tar.* 2>/dev/null | grep -q .; then
    for archive in extract/data.tar.*; do
      case "$archive" in
        *.tar.xz)
          bsdtar -xf "$archive" -C "${pkgdir}"
          ;;
        *.tar.gz)
          bsdtar -xf "$archive" -C "${pkgdir}"
          ;;
        *.tar.zst)
          bsdtar -xf "$archive" -C "${pkgdir}"
          ;;
        *)
          echo "未知的压缩格式: $archive"
          exit 1
          ;;
      esac
    done
  else
    echo "无法识别deb包中的数据文件格式"
    exit 1
  fi
  
  # 安装GPG密钥
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/apollo-gpg-key" "${pkgdir}/usr/share/${pkgname}/apollo.gpg.key"
  
  # 安装许可证文件
  install -Dm644 "${srcdir}/apollo_neo_license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
