# Maintainer: Tommy Juhl <me@enbyte.dev>
pkgname=dotctl-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to manage dotfiles"
arch=('any')
url="https://github.com/enbytedev/dotctl"
license=('MIT')
depends=('stow' 'jq')
makedepends=('git')
source=("${pkgname}::git+https://github.com/enbytedev/dotctl.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

package() {
  # Define user home directory and username
  USER_HOME=$(eval echo ~$USER)
  USER_NAME=$USER

  # Create necessary directories with appropriate permissions
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/base"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/intermediate"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/patches"

  # Create base subdirectories with appropriate permissions
  for dir in home dot-local dot-config etc usr; do
    install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/base/$dir"
  done

  # Copy scripts to the .dotctl directory with appropriate permissions
  install -m 755 "$srcdir/$pkgname/sync-dots.sh" "$pkgdir/$USER_HOME/.dotctl/sync-dots.sh"
  install -m 755 "$srcdir/$pkgname/generate-patches.sh" "$pkgdir/$USER_HOME/.dotctl/generate-patches.sh"

  # Create default config if it doesn't exist
  if [ ! -f "$pkgdir/$USER_HOME/.dotctl/sync_config.json" ]; then
    cat <<EOL > "$pkgdir/$USER_HOME/.dotctl/sync_config.json"
{
  "home": "$USER_HOME/",
  "dot-local": "$USER_HOME/.local/",
  "dot-config": "$USER_HOME/.config/",
  "etc": "/etc/",
  "usr": "/usr/"
}
EOL
    chmod 644 "$pkgdir/$USER_HOME/.dotctl/sync_config.json"
  fi

  # Change ownership of all created files to the user
  chown -R $USER_NAME:$USER_NAME "$pkgdir/$USER_HOME/.dotctl"

  # Ensure the /usr/bin directory exists
  install -d -m 755 "$pkgdir/usr/bin"

  # Create the wrapper script with appropriate permissions
  cat << 'EOF' > "$pkgdir/usr/bin/dotctl"
#!/bin/bash

# Path to the scripts and config file
SYNC_SCRIPT_PATH="$HOME/.dotctl/sync-dots.sh"
PATCHES_SCRIPT_PATH="$HOME/.dotctl/generate-patches.sh"
CONFIG_PATH="$HOME/.dotctl/sync_config.json"
INTERMEDIATE_DIR="$HOME/.dotctl/intermediate"
PATCHES_DIR="$HOME/.dotctl/patches"
BASE_DIR="$HOME/.dotctl/base"

# Function to display help menu
show_help() {
    echo "Usage: dotctl [OPTION]"
    echo "Options:"
    echo "  --help, -h                   Display this help menu"
    echo "  --sync, -s                   Run the sync-dots.sh script"
    echo "  --gen-patches, -p            Run the generate-patches.sh script"
    echo "  --config, -c                 Open sync_config.json in nano"
    echo "  --intermediate-dir, -id      Open ~/.dotctl/intermediate in the file manager"
    echo "  --patches-dir, -pd           Open ~/.dotctl/patches in the file manager"
    echo "  --base-dir, -bd              Open ~/.dotctl/base in the file manager"
}

# Parse command line arguments
case "$1" in
    --help|-h)
        show_help
        ;;
    --sync|-s)
        if [ -f "$SYNC_SCRIPT_PATH" ]; then
            chmod +x "$SYNC_SCRIPT_PATH"
            "$SYNC_SCRIPT_PATH"
        else
            echo "Error: $SYNC_SCRIPT_PATH does not exist."
            exit 1
        fi
        ;;
    --gen-patches|-p)
        if [ -f "$PATCHES_SCRIPT_PATH" ]; then
            chmod +x "$PATCHES_SCRIPT_PATH"
            "$PATCHES_SCRIPT_PATH"
        else
            echo "Error: $PATCHES_SCRIPT_PATH does not exist."
            exit 1
        fi
        ;;
    --config|-c)
        if [ -f "$CONFIG_PATH" ]; then
            nano "$CONFIG_PATH"
        else
            echo "Error: $CONFIG_PATH does not exist."
            exit 1
        fi
        ;;
    --intermediate-dir|-id)
        if [ -d "$INTERMEDIATE_DIR" ]; then
            xdg-open "$INTERMEDIATE_DIR"
        else
            echo "Error: $INTERMEDIATE_DIR does not exist."
            exit 1
        fi
        ;;
    --patches-dir|-pd)
        if [ -d "$PATCHES_DIR" ]; then
            xdg-open "$PATCHES_DIR"
        else
            echo "Error: $PATCHES_DIR does not exist."
            exit 1
        fi
        ;;
    --base-dir|-bd)
        if [ -d "$BASE_DIR" ]; then
            xdg-open "$BASE_DIR"
        else
            echo "Error: $BASE_DIR does not exist."
            exit 1
        fi
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        exit 1
        ;;
esac
EOF

  chmod 755 "$pkgdir/usr/bin/dotctl"
}

