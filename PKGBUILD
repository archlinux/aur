# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>
# 感谢 https://aur.archlinux.org/packages/liteloader-qqnt-git 的hook参考

pkgname=napcatqq-git
_pkgname=NapCatQQ
pkgver=r3716.aa3a575c
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64'
      'aarch64'
      'loong64')
url="https://github.com/NapNeko/NapCatQQ"
license=('GPL2')
depends=('linuxqq' 'xorg-server-xvfb')
makedepends=('git' 'npm' 'jq' 'execstack')
options=('!strip')
conflicts=('napcatqq'
           'liteloader-qqnt')
provides=('napcatqq')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    echo -e "\e[32m注意：构建时间可能会有点长，请耐心等待...\e[0m"
    cd "${srcdir}/${_pkgname}"
    
    npm i && cd napcat.webui && npm i && cd .. || exit 1
    npm run build:shell && npm run depend  || exit 1
    rm dist/package-lock.json
    execstack -c dist/moehoo/MoeHoo.linux.x64.node
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    mkdir -p "${pkgdir}/opt/QQ/resources/app"
    mkdir -p "${pkgdir}/etc/pacman.d/hooks"

    mv dist "${pkgdir}/opt/QQ/resources/app/napcat"
    local file_extensions=("bat" "dll" "exe")
    for ext in "${file_extensions[@]}"; do
        find "${pkgdir}/opt/QQ/resources/app/napcat" -name "*.${ext}" -delete
    done

    mv "${pkgdir}/opt/QQ/resources/app/napcat/loadNapCat.js" "${pkgdir}/opt/QQ/resources/app/"
    install -Dm0755 /dev/stdin "${pkgdir}/opt/QQ/resources/app/napcat/napcatqq-patcher.sh" << 'EOF'
#!/bin/bash
TargetFile="/opt/QQ/resources/app/package.json"
if [ "$1" = "patch" ]; then
    sed -i 's#"main": *"[^"]*"#"main": "./loadNapCat.js"#' "$TargetFile"
elif [ "$1" = "unpatch" ]; then
    sed -i 's#"main": *"[^"]*"#"main": "./application.asar/app_launcher/index.js"#' "$TargetFile"
fi
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/70-napcatqq-patch.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
Target=napcatqq-git
Target=linuxqq

[Action]
Description=Patch QQ For NapCat
When=PostTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/napcatqq-patcher.sh patch'
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-unpatch.hook" << 'EOF'
[Trigger]
Operation=Remove
Type=Package
Target=napcatqq-git

[Action]
Description=Unpatch QQ For NapCat
When=PreTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/napcatqq-patcher.sh unpatch && rm -rf /opt/QQ/resources/app/napcat && echo -e "\e[32m[NapCat] 取消修补成功，但是仍旧建议重装linuxqq\e[0m";'
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-permission.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Target=napcatqq-git

[Action]
Description=Fix NapCat Permissions
When=PostTransaction
Exec=/bin/sh -c 'chown -R $(logname):$(logname) /opt/QQ/resources/app/napcat /opt/QQ/resources/app/loadNapCat.js'
EOF
}
