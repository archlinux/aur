# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>
# 感谢 https://aur.archlinux.org/packages/liteloader-qqnt-git 的参考

pkgname=napcatqq-git
_pkgname=NapCatQQ
pkgver=r3054.0222664d
pkgrel=4
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64'
      'aarch64'
      'loong64')
url="https://github.com/NapNeko/NapCatQQ"
license=('GPL2')
depends=('linuxqq')
makedepends=('git' 'nodejs')
options=('!strip')
conflicts=('napcatqq')
provides=('napcatqq')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    npm i
    cd napcat.webui && npm i && cd ..
    npm run build:shell
    npm run depend
    rm package-lock.json
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
if [ -z "$1" ]; then
    sed -i 's#"main": *"[^"]*"#"main": "./loadNapCat.js"#' "$TargetFile"
else
    sed -i 's#"main": *"[^"]*"#"main": "./application.asar/app_launcher/index.js"#' "$TargetFile"
fi
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-permission.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
Target=napcatqq-git

[Action]
Description=Fix NapCat permissions
When=PostTransaction
Exec=/bin/sh -c 'chown -R $(logname):$(logname) /opt/QQ/resources/app/napcat /opt/QQ/resources/app/loadNapCat.js'
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-patch.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
Target=napcatqq-git
Target=linuxqq

[Action]
Description=Patch QQ for NapCat
When=PostTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/napcatqq-patcher.sh'
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-depatch.hook" << 'EOF'
[Trigger]
Operation=Remove
Type=Package
Target=napcatqq-git

[Action]
Description=Unpatch QQ for NapCat
When=PreTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/napcatqq-patcher.sh restore && rm -rf /opt/QQ/resources/app/napcat && echo -e "\e[32mUnpatch done, but it\'s recommended to reinstall linuxqq.\e[0m";'
EOF
}
