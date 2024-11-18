# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=napcatqq-git
_pkgname=NapCatQQ
pkgver=r3054.0222664d
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64')
url="https://github.com/NapNeko/NapCatQQ"
license=('GPL3')
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
    find "${pkgdir}/opt/QQ/resources/app/napcat" -name "*.bat" -delete
    find "${pkgdir}/opt/QQ/resources/app/napcat" -name "*.dll" -delete
    find "${pkgdir}/opt/QQ/resources/app/napcat" -name "*.exe" -delete

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

    install -Dm644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-patch.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
Target=napcatqq-git
Target=linuxqq

[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
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
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/napcatqq-patcher.sh restore; echo "Unpatch done, but it\'s recommended to reinstall linuxqq.";'
EOF
}
