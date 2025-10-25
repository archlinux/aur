# Maintainer: Fredon Menu Team <contact@fredon-menu.org>

pkgname=turbo-chainsaw
pkgver=r8.4f0e1b4
pkgrel=1
pkgdesc="A modern, customizable application launcher for Hyprland/Wayland (git version)"
arch=('x86_64')
url="https://github.com/patrik-fredon/turbo-chainsaw"
license=('MIT')
depends=(
    'python>=3.11'
    'python-gobject>=3.42.0'
    'gtk3>=3.24.0'
    'gtk-layer-shell>=0.8.0'
    'gdk-pixbuf2>=2.42.0'
    'python-pillow>=9.0.0'
    'python-watchdog>=2.1.0'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
optdepends=(
    'libnotify: Desktop notifications'
    'xdg-utils: Default application launching'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "$pkgname::git+https://github.com/patrik-fredon/turbo-chainsaw.git#branch=main"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-//g'
    else
        # Fallback when no tags exist
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$pkgname"

    # Build the package
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install the package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop entry
    install -Dm644 packaging/fredon-menu.desktop \
        "$pkgdir/usr/share/applications/fredon-menu.desktop"

    # Install systemd user service
    install -Dm644 packaging/fredon-menu.service \
        "$pkgdir/usr/lib/systemd/user/fredon-menu.service"

    # Install default configuration
    install -Dm644 src/data/default.json \
        "$pkgdir/usr/share/fredon-menu/default.json"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create directories
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Create a simple default icon if not available
    if [ ! -f "src/data/icons/fredon-menu.png" ]; then
        # Generate a simple icon using ImageMagick if available
        if command -v convert >/dev/null 2>&1; then
            convert -size 256x256 xc:transparent \
                -fill "#2a2a2a" -draw "rectangle 32,32 224,224" \
                -fill "#ffffff" -pointsize 24 -gravity center \
                -annotate +0+0 "FM" \
                "$pkgdir/usr/share/icons/hicolor/256x256/apps/fredon-menu.png" 2>/dev/null || true
        else
            # Create a simple placeholder icon using Python
            python3 << 'EOF'
from PIL import Image, ImageDraw, ImageFont
import os

# Create simple icon
img = Image.new('RGBA', (256, 256), (42, 42, 42, 200))
draw = ImageDraw.Draw(img)

# Draw border
draw.rectangle([32, 32, 224, 224], outline=(255, 255, 255, 255), width=2)

# Add text
try:
    # Try to use a nice font
    font = ImageFont.truetype("/usr/share/fonts/TTF/DejaVuSans.ttf", 48)
except:
    # Fallback to default font
    font = ImageFont.load_default()

text = "FM"
bbox = draw.textbbox((0, 0), text, font=font)
text_width = bbox[2] - bbox[0]
text_height = bbox[3] - bbox[1]

# Center the text
x = (256 - text_width) // 2
y = (256 - text_height) // 2

draw.text((x, y), text, fill=(255, 255, 255, 255), font=font)

# Save the image
img.save('/usr/share/icons/hicolor/256x256/apps/fredon-menu.png')
EOF
        fi
    else
        install -m644 src/data/icons/fredon-menu.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/fredon-menu.png"
    fi

    # Install shell completion
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    # Generate shell completions
    cat > "$pkgdir/usr/share/bash-completion/completions/fredon-menu" << 'EOF'
_fredon_menu_completion() {
    local cur prev words cword
    COMPREPLY=(${COMPREPLY-[@]})
    _init_completion || return

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "--config --debug --version --help --toggle" -- "$cur"))
        return
    fi

    COMPREPLY=($(compgen -W "config debug version help toggle" -- "$cur"))
}

complete -F _fredon_menu_completion fredon-menu
EOF

    cat > "$pkgdir/usr/share/zsh/site-functions/_fredon-menu" << 'EOF'
#compdef _fredon_menu
_fredon_menu() {
    local -a commands
    commands=(
        '--config:Set custom configuration file'
        '--debug:Enable debug logging'
        '--version:Show version information'
        '--help:Show help message'
        '--toggle:Toggle menu visibility'
    )

    if (( CURRENT == 1 )); then
        _describe 'commands' && compadd "$commands[@]"
        return
    fi

    case $words[1] in
        --config)
            _description 'configuration file'
            _files
            ;;
    esac
}
compdef _fredon_menu fredon-menu
EOF

    cat > "$pkgdir/usr/share/fish/vendor_completions.d/fredon-menu.fish" << 'EOF'
function __fish_fredon_menu_complete
    set -l commands config debug version help toggle

    complete -c fredon-menu -n fredon-menu -d "Description of the command"

    for cmd in $commands
        complete -c fredon-menu -n __fish_no_subcommand -a $cmd
    end
end

complete -f -c fredon-menu -n __fish_fredon_menu_complete fredon-menu
EOF
}

post_install() {
    # Reload systemd user daemon to recognize new service
    systemctl --user daemon-reload 2>/dev/null || true

    # Enable the service (user can disable if desired)
    echo "To enable Fredon Menu to start automatically:"
    echo "    systemctl --user enable --now fredon-menu.service"
    echo ""
    echo "Add to your Hyprland configuration (~/.config/hypr/hyprland.conf):"
    echo "    bind = \$mainMod, space, exec, fredon-menu"
}