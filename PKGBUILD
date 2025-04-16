# Maintainer: RAMA <nooviex@gmail.com>
pkgname=mpvlock-git
pkgver=r14.148b887
pkgrel=1
pkgdesc="A simple, GPU-accelerated screen locking utility for Hyprland with video background support"
arch=('x86_64')
url="https://github.com/nomadxxxx/mpvlock"
license=('BSD')
depends=('wayland' 'wayland-protocols' 'mesa' 'hyprwayland-scanner' 'cairo' 'libdrm' 'pango' 'libxkbcommon' 'pam' 'hyprlang' 'hyprutils' 'hyprgraphics' 'file' 'mpv' 'mpvpaper')
makedepends=('cmake' 'ninja' 'git')
optdepends=('hypridle: for idle timeout integration')
provides=('mpvlock' 'hyprlock')
conflicts=('mpvlock' 'hyprlock' 'hyprlock-git')
source=("git+$url.git")
sha256sums=('SKIP')
backup=('etc/xdg/hypr/hypridle.conf' 'etc/pam.d/mpvlock')

pkgver() {
  cd "$srcdir/mpvlock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/mpvlock"
  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build -G Ninja
  cmake --build ./build --config Release --target mpvlock -j$(nproc)
}

package() {
  cd "$srcdir/mpvlock"

  # Install the binary
  install -Dm755 build/mpvlock "$pkgdir/usr/bin/mpvlock"

  # Install themes, scripts, assets, and fonts to a system-wide location
  install -d "$pkgdir/usr/share/mpvlock/themes/neon_jinx"
  install -Dm644 .config/mpvlock/themes/neon_jinx/mpvlock.conf "$pkgdir/usr/share/mpvlock/themes/neon_jinx/mpvlock.conf"
  install -Dm644 .config/mpvlock/themes/neon_jinx/neon_jinx.mp4 "$pkgdir/usr/share/mpvlock/themes/neon_jinx/neon_jinx.mp4"

  install -d "$pkgdir/usr/share/mpvlock/themes/solitude"
  install -Dm644 .config/mpvlock/themes/solitude/mpvlock.conf "$pkgdir/usr/share/mpvlock/themes/solitude/mpvlock.conf"
  install -Dm644 .config/mpvlock/themes/solitude/1.mp4 "$pkgdir/usr/share/mpvlock/themes/solitude/1.mp4"

  install -d "$pkgdir/usr/share/mpvlock/scripts"
  install -Dm755 .config/mpvlock/scripts/*.sh "$pkgdir/usr/share/mpvlock/scripts/"

  # Install fonts
  install -d "$pkgdir/usr/share/fonts/mpvlock"
  install -Dm644 .config/mpvlock/fonts/*.ttf "$pkgdir/usr/share/fonts/mpvlock/"
  install -Dm644 .config/mpvlock/fonts/*.otf "$pkgdir/usr/share/fonts/mpvlock/"

  # Install the default mpvlock.conf to a system-wide location
  install -d "$pkgdir/usr/share/mpvlock"
  install -Dm644 .config/mpvlock/mpvlock.conf "$pkgdir/usr/share/mpvlock/mpvlock.conf"

  # Install license file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install a default hypridle.conf that uses mpvlock
  install -d "$pkgdir/etc/xdg/hypr"
  cat > "$pkgdir/etc/xdg/hypr/hypridle.conf" << 'EOF'
general {
    lock_cmd = pidof mpvlock || mpvlock  # Lock screen when idle
    before_sleep_cmd = loginctl lock-session  # Lock before sleep
    after_sleep_cmd = hyprctl dispatch dpms on  # Turn on display after sleep
    ignore_dbus_inhibit = false  # Respect DBus inhibition (e.g., don't lock during video playback)
}

listener {
    timeout = 300  # 5 minutes
    on-timeout = pidof mpvlock || mpvlock  # Lock screen after timeout
}

listener {
    timeout = 600  # 10 minutes
    on-timeout = hyprctl dispatch dpms off  # Turn off screen after longer timeout
}
EOF

  # Install PAM configuration
  install -d "$pkgdir/etc/pam.d"
  cat > "$pkgdir/etc/pam.d/mpvlock" << 'EOF'
auth include system-auth
account include system-auth
password include system-auth
session include system-auth
EOF

  # Create a post-install script to copy the entire .config/mpvlock/ structure to user's $HOME/.config/mpvlock
  install -d "$pkgdir/usr/share/mpvlock"
  cat > "$pkgdir/usr/share/mpvlock/install-config.sh" << 'EOF'
#!/bin/bash
# Copy the entire .config/mpvlock/ structure to user's $HOME/.config/mpvlock
CONFIG_DIR="$HOME/.config/mpvlock"

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the entire mpvlock configuration directory
if [ ! -d "$CONFIG_DIR" ] || [ -z "$(ls -A "$CONFIG_DIR")" ]; then
  cp -r /usr/share/mpvlock/* "$CONFIG_DIR/"
else
  # Copy mpvlock.conf, prompt to overwrite if it exists
  if [ -f "$CONFIG_DIR/mpvlock.conf" ]; then
    if ! cmp -s "$CONFIG_DIR/mpvlock.conf" "/usr/share/mpvlock/mpvlock.conf"; then
      echo "Existing $CONFIG_DIR/mpvlock.conf differs from the default version."
      echo "Do you want to overwrite it with the default mpvlock.conf? (y/N)"
      read -r overwrite
      if [ "$overwrite" = "y" ] || [ "$overwrite" = "Y" ]; then
        cp /usr/share/mpvlock/mpvlock.conf "$CONFIG_DIR/"
        echo "mpvlock.conf has been overwritten with the default version."
      else
        echo "Keeping existing mpvlock.conf. You can manually replace it with:"
        echo "  cp /usr/share/mpvlock/mpvlock.conf $CONFIG_DIR/mpvlock.conf"
      fi
    fi
  else
    cp /usr/share/mpvlock/mpvlock.conf "$CONFIG_DIR/"
  fi

  # Copy themes directory
  if [ ! -d "$CONFIG_DIR/themes" ]; then
    cp -r /usr/share/mpvlock/themes "$CONFIG_DIR/"
  else
    # Copy theme subdirectories
    if [ ! -d "$CONFIG_DIR/themes/neon_jinx" ]; then
      cp -r /usr/share/mpvlock/themes/neon_jinx "$CONFIG_DIR/themes/"
    else
      for file in /usr/share/mpvlock/themes/neon_jinx/*; do
        file_name=$(basename "$file")
        if [ ! -f "$CONFIG_DIR/themes/neon_jinx/$file_name" ]; then
          cp "$file" "$CONFIG_DIR/themes/neon_jinx/"
        fi
      done
    fi
    if [ ! -d "$CONFIG_DIR/themes/solitude" ]; then
      cp -r /usr/share/mpvlock/themes/solitude "$CONFIG_DIR/themes/"
    else
      for file in /usr/share/mpvlock/themes/solitude/*; do
        file_name=$(basename "$file")
        if [ ! -f "$CONFIG_DIR/themes/solitude/$file_name" ]; then
          cp "$file" "$CONFIG_DIR/themes/solitude/"
        fi
      done
    fi
  fi

  # Copy scripts directory
  if [ ! -d "$CONFIG_DIR/scripts" ]; then
    cp -r /usr/share/mpvlock/scripts "$CONFIG_DIR/"
  else
    for script in /usr/share/mpvlock/scripts/*.sh; do
      script_name=$(basename "$script")
      if [ ! -f "$CONFIG_DIR/scripts/$script_name" ]; then
        cp "$script" "$CONFIG_DIR/scripts/"
      fi
    done
  fi
fi

# Install fonts to user's font directory
mkdir -p "$HOME/.local/share/fonts/mpvlock"
cp -r /usr/share/fonts/mpvlock/*.ttf "$HOME/.local/share/fonts/mpvlock/"
cp -r /usr/share/fonts/mpvlock/*.otf "$HOME/.local/share/fonts/mpvlock/"
fc-cache -f

echo "mpvlock configuration files have been copied to $CONFIG_DIR"
echo "Alternative theme configurations are available in $CONFIG_DIR/themes/neon_jinx/mpvlock.conf and $CONFIG_DIR/themes/solitude/mpvlock.conf."
echo "To use a theme, copy its config to $CONFIG_DIR/mpvlock.conf, e.g.:"
echo "  cp $CONFIG_DIR/themes/neon_jinx/mpvlock.conf $CONFIG_DIR/mpvlock.conf"
echo "You may need to adjust paths or settings in $CONFIG_DIR/mpvlock.conf for your setup."

# Notify about hypridle configuration
echo "A default hypridle configuration has been installed to /etc/xdg/hypr/hypridle.conf"
echo "It has been updated to use mpvlock instead of hyprlock."
echo "If you have a user-specific hypridle.conf at $HOME/.config/hypr/hypridle.conf, you may need to update it manually."
EOF

  chmod +x "$pkgdir/usr/share/mpvlock/install-config.sh"

  # Create a post-install scriptlet to run the config installer
  install -d "$pkgdir/usr/lib/mpvlock"
  cat > "$pkgdir/usr/lib/mpvlock/post-install.sh" << 'EOF'
#!/bin/bash
/usr/share/mpvlock/install-config.sh
EOF

  chmod +x "$pkgdir/usr/lib/mpvlock/post-install.sh"
}

post_install() {
  /usr/share/mpvlock/install-config.sh
}

post_upgrade() {
  /usr/share/mpvlock/install-config.sh
}
