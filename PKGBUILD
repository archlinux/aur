# Maintainer: YourName <your@email.com>
pkgname=asus-fa401km-acpi-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Fix slow boot (36s delay) for ASUS TUF Air 2025 (FA401KM) via DSDT override"
pkgdesc_cn="通过 DSDT 覆盖修复 ASUS TUF Air 2025 (FA401KM) 启动缓慢（36秒延迟）问题"
arch=('x86_64')
url="https://gist.github.com/HiFiPhile/324c330b204ef038ef8b3ff2aff7bb6c"
license=('unknown')
depends=('mkinitcpio')
install="${pkgname}.install"
source=(
    "dsdt.aml::https://gist.githubusercontent.com/HiFiPhile/324c330b204ef038ef8b3ff2aff7bb6c/raw/791afbad504a61e28738a6ad147f08471d1a583a/dsdt.aml"
    "acpi_override"
    "enable-fix.sh"
)
sha256sums=('71794b35aa86d3a1accc54eb8cbf93f27454386ce53551d2c579daafa9519905'
            '8650e21e4e96c9da7f83b267e6f057ce06cc28dfe0b6491735fef8b096e102ad'
            'e3e80198630e9ff644651c53bd2d891f4fd8d5b8e3e3d41c4857db9d1df349ff')

package() {
    # 1. 安装 DSDT 文件到指定覆盖目录
    install -Dm644 "dsdt.aml" "${pkgdir}/etc/initcpio/acpi_override/dsdt.aml"

    # 2. 安装 mkinitcpio hook (确保用户拥有此 hook)
    # 注意：此文件放置于 /usr/lib/initcpio/install/，这是 mkinitcpio 查找 hook 的标准路径
    install -Dm644 "acpi_override" "${pkgdir}/usr/lib/initcpio/install/acpi_override"

    # 3. 安装一键启用脚本
    install -Dm755 "enable-fix.sh" "${pkgdir}/usr/bin/fa401km-fix-enable"

    msg2 "DSDT file and hooks installed."
}
