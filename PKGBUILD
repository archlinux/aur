# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>
# 感谢 https://aur.archlinux.org/packages/liteloader-qqnt-git 的hook参考

pkgname=napcatqq-git
_pkgname=NapCatQQ
pkgver=r3404.02a89994
pkgrel=1
pkgdesc="现代化的基于 NTQQ 的 Bot 协议端实现"
arch=('x86_64'
      'aarch64'
      'loong64')
url="https://github.com/NapNeko/NapCatQQ"
license=('GPL2')
depends=('linuxqq' 'xorg-server-xvfb')
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

build() {
    echo -e "\e[32m注意：构建时间可能会有点长，请耐心等待...\e[0m"
    cd "${srcdir}/${_pkgname}"

    npm i && cd napcat.webui && npm i && cd .. || exit 1
    npm run build:shell && cd dist && npm i --omit=dev || exit 1
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

    install -Dm0755 /dev/stdin "${pkgdir}/opt/QQ/resources/app/napcat/update-config.sh" << 'EOF'
#!/bin/bash

function log() {
    echo -e "\e[32m[NapCat] $1\e[0m"
}

function get_real_home() {
    local real_user=$(who | grep -m1 "(:0)" | cut -d' ' -f1)
    if [ -z "$real_user" ]; then
        real_user=$(logname 2>/dev/null)
    fi
    if [ -z "$real_user" ]; then
        real_user=$SUDO_USER
    fi
    echo "/home/$real_user"
}

function create_config_if_missing() {
    local real_home=$(get_real_home)
    local conf_dir="${real_home}/.config/QQ/versions"
    local conf="${conf_dir}/config.json"

    if [ ! -f "$conf" ]; then
        log "未找到配置文件，正在创建..."
        log "配置目录: ${conf_dir}"
        
        # 确保目录权限正确
        if [ -d "${conf_dir}" ]; then
            log "修正目录权限..."
            chown -R $(logname):$(logname) "${real_home}/.config/QQ"
        fi
        
        log "启动QQ进程..."
        sudo -u $(logname) xvfb-run -a linuxqq >/dev/null 2>&1 &
        QQ_PID=$!
        log "QQ进程ID: ${QQ_PID}"
        
        if [ -f "$conf" ]; then
            kill $QQ_PID 2>/dev/null
            wait $QQ_PID 2>/dev/null
            log "配置文件创建成功"
            return 0
        fi
        
        log "开始等待配置文件生成..."
        for i in {1..10}; do
            log "第 ${i} 次检查..."
            if [ -f "$conf" ]; then
                log "检测到配置文件"
                kill $QQ_PID 2>/dev/null
                wait $QQ_PID 2>/dev/null
                log "配置文件创建成功"
                return 0
            fi
            sleep 1
        done
        
        kill $QQ_PID 2>/dev/null
        wait $QQ_PID 2>/dev/null
        
        if [ ! -f "$conf" ]; then
            log "等待配置文件生成超时"
            return 1
        fi
    fi
}

function update_configs() {
    local target_ver=$(jq -r '.linuxVersion' /opt/QQ/resources/app/napcat/qqnt.json)
    local build_id=$(jq -r '.linuxVerHash' /opt/QQ/resources/app/napcat/qqnt.json)
    local real_home=$(get_real_home)
    local conf_dir="${real_home}/.config/QQ/versions"
    local conf="${conf_dir}/config.json"
    
    # 如果配置文件不存在，尝试创建
    create_config_if_missing
    
    if [ -f "$conf" ]; then
        log "正在修改配置文件: ${conf}"
        if [ ! -f "${conf}.napcatbak" ]; then
            cp "${conf}" "${conf}.napcatbak"
        fi
        jq --arg targetVer "${target_ver}" --arg buildId "${build_id}" \
        '.baseVersion = $targetVer | .curVersion = $targetVer | .buildId = $buildId' "${conf}" > "${conf}.tmp" && \
        mv "${conf}.tmp" "${conf}" || { log "QQ配置更新失败!"; exit 1; }
        log "更新用户QQ配置成功"
    else
        log "无法创建或找到QQ配置文件: ${conf}"
        exit 1
    fi
}

function restore_configs() {
    local real_home=$(get_real_home)
    
    local conf_dir="${real_home}/.config/QQ/versions"
    local backup="${conf_dir}/config.json.napcatbak"
    local conf="${conf_dir}/config.json"
    
    if [ -f "$backup" ]; then
        log "正在还原配置文件: ${conf}"
        mv "${backup}" "${conf}" || { log "QQ配置还原失败!"; exit 1; }
        log "还原用户QQ配置成功"
    else
        log "未找到配置备份文件: ${backup}"
    fi
}

case "$1" in
    "update")
        update_configs
        ;;
    "restore")
        restore_configs
        ;;
    *)
esac
EOF


    install -Dm0644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/50-napcatqq-config.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Install
Operation=Upgrade
Target=napcatqq-git
Target=linuxqq

[Action]
Description=Update QQ config.json for NapCat
When=PostTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/update-config.sh update'
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

    install -Dm0644 /dev/stdin "${pkgdir}/etc/pacman.d/hooks/napcatqq-config-restore.hook" << 'EOF'
[Trigger]
Type=Package
Operation=Remove
Target=napcatqq-git

[Action]
Description=Restore QQ config.json
When=PreTransaction
Exec=/bin/sh -c '/opt/QQ/resources/app/napcat/update-config.sh restore'
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
