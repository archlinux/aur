# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>
# 感谢 https://aur.archlinux.org/packages/liteloader-qqnt-git 的hook参考

pkgname=napcatqq-git
_pkgname=NapCatQQ
pkgver=r4389.d5b8f886
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64'
      'aarch64'
      'loong64')
url="https://github.com/NapNeko/NapCatQQ"
license=('GPL2')
depends=('linuxqq' 'xorg-server-xvfb' 'execstack')
makedepends=('git' 'npm' 'jq')
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

prepare() {
    cd "${srcdir}/${_pkgname}"
    # 删除转发消息深度限制
    find . -name "SendMsg.ts" -exec sed -i '/if (dp >= 3) {/,/}/d' {} \;
    # 修改卡片消息返回值
    find . -name "element.ts" -exec sed -i "s/return '\[卡片消息\]';/return '\[聊天记录\]';/g" {} \;
}

build() {
    echo -e "\e[32m注意：构建时间可能会有点长，并且会占用大量内存\e[0m"
    cd "${srcdir}/${_pkgname}"
    
    npm i && cd napcat.webui && npm i && cd .. || exit 1
    npm run build:shell && npm run depend  || exit 1
    rm dist/package-lock.json
    # 动态库 GNU_STACK 段为 RWE 触发了 W^X 所以临时禁用掉
    execstack -c dist/native/packet/MoeHoo.linux.x64.node
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
