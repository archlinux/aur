# Maintainer: lone-cloud <hoboman313@proton.me>
pkgname=gerbil
pkgver=1.5.5
pkgrel=1
pkgdesc="Run Large Language Models locally"
arch=('x86_64')
url="https://github.com/lone-cloud/gerbil"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss')
optdepends=('alsa-lib: Audio support for sound effects'
           'libxss: Screen saver detection support')
provides=('gerbil')
conflicts=('gerbil-git')
source=("gerbil-${pkgver}.AppImage::https://github.com/lone-cloud/gerbil/releases/download/v1.5.5/Gerbil-1.5.5.AppImage")
sha256sums=('a900bdcbf43859c3748d7e29ad54c60c6d8f84c3ca9edc1c8c9be030596f0091')

prepare() {
    chmod +x "gerbil-${pkgver}.AppImage"
    "./gerbil-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the application
    install -dm755 "${pkgdir}/opt/gerbil"
    cp -r squashfs-root/* "${pkgdir}/opt/gerbil/"
    
    # Fix permissions on extracted files
    chmod -R 755 "${pkgdir}/opt/gerbil/"
    
    # Rename the main executable to lowercase
    mv "${pkgdir}/opt/gerbil/Gerbil" "${pkgdir}/opt/gerbil/gerbil"
    
    # Create executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/gerbil" << 'WRAPPER'
#!/bin/bash
exec "/opt/gerbil/gerbil" "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/gerbil"
    
    # Install desktop file, AppStream metadata, and license
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/metainfo"
    install -dm755 "${pkgdir}/usr/share/licenses/gerbil"
    install -m644 "${startdir}/gerbil.desktop" "${pkgdir}/usr/share/applications/"
    install -m644 "${startdir}/gerbil.metainfo.xml" "${pkgdir}/usr/share/metainfo/"
    install -m644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/gerbil/"
    
    # Install icon to hicolor theme directory and pixmaps as fallback
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    if [ -f "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" ]; then
        cp "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gerbil.png"
        cp "${pkgdir}/opt/gerbil/usr/share/icons/hicolor/512x512/apps/Gerbil.png" "${pkgdir}/usr/share/pixmaps/gerbil.png"
    else
        echo "Warning: Could not find Gerbil.png in expected locations"
        find "${pkgdir}/opt/gerbil" -name "*erbil*.png" -type f | head -1 | while read icon_file; do
            if [ -n "$icon_file" ]; then
                echo "Found icon at: $icon_file"
                cp "$icon_file" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gerbil.png"
                cp "$icon_file" "${pkgdir}/usr/share/pixmaps/gerbil.png"
            fi
        done
    fi
    
    # Install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    
    # Bash completion
    cat > "${pkgdir}/usr/share/bash-completion/completions/gerbil" << 'BASH_COMP'
_gerbil() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="--version --cli"

    case "${prev}" in
        --cli)
            # Don't complete after --cli, let user type kobold args
            return 0
            ;;
        *)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
    esac
}
complete -F _gerbil gerbil
BASH_COMP
    
    # Zsh completion
    cat > "${pkgdir}/usr/share/zsh/site-functions/_gerbil" << 'ZSH_COMP'
#compdef gerbil

_gerbil() {
    local context state line
    
    _arguments -C \
        '1: :->command' \
        '*: :->args' && return 0
        
    case $state in
        command)
            local commands=(
                '--version:Show version information'
                '--cli:Run in CLI mode (pass remaining args to kobold binary)'
            )
            _describe 'commands' commands
            ;;
        args)
            case ${words[2]} in
                --cli)
                    # Don't complete after --cli, let user type kobold args
                    ;;
            esac
            ;;
    esac
}

_gerbil "$@"
ZSH_COMP
}
