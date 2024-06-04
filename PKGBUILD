# Maintainer: Tommy Juhl <me@enbyte.dev>
pkgname=dotctl-git
pkgver=1.0.3
pkgrel=1
pkgdesc="A tool to manage dotfiles"
arch=('any')
url="https://github.com/enbytedev/dotctl"
license=('MIT')
depends=('stow' 'jq' 'git')
makedepends=('git')
source=("${pkgname}::git+https://github.com/enbytedev/dotctl.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # Define user home directory and username
  USER_HOME=$(eval echo ~$USER)
  USER_NAME=$USER

  # Set versions
  # NOTE: pkgver is NOT tied to a version of dotctl.
  VERSION=$(cat VERSION)
  FORMAT_VERSION="1b"

  # Create necessary directories with appropriate permissions
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/base"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/intermediate"
  install -d -m 755 "$pkgdir/$USER_HOME/.dotctl/changes"
  install -d -m 755 "$pkgdir/usr/local/share/dotctl"
  install -d -m 755 "$pkgdir/usr/local/bin"

  # Ensure the scripts directory exists and copy scripts to the /usr/local/share/dotctl directory with appropriate permissions
  if [ -d "$srcdir/$pkgname/scripts" ]; then
    cp -r "$srcdir/$pkgname/scripts/"* "$pkgdir/usr/local/share/dotctl/"
    chmod +x "$pkgdir/usr/local/share/dotctl"/*.sh
  else
    echo "Error: scripts directory does not exist."
    exit 1
  fi

  # Create the wrapper script with appropriate permissions
  install -m 755 "$srcdir/$pkgname/scripts/dotctl-wrapper.sh" "$pkgdir/usr/local/bin/dotctl"

  # Add version tag to all scripts
  for file in "$pkgdir/usr/local/share/dotctl"/*.sh; do
    if [[ -f $file ]]; then
      # Check if the file already has a version tag
      if ! grep -q "dotctl version" "$file"; then
        # Add the version tag after the shebang line
        sed -i "2i # dotctl version $VERSION" "$file"
      else
        # Update the existing version tag
        sed -i "s/^# dotctl version .*/# dotctl version $VERSION/" "$file"
      fi
    fi
  done

  # Create default config if it doesn't exist
  if [ ! -f "$pkgdir/$USER_HOME/.dotctl/config.json" ]; then
    cat <<EOL > "$pkgdir/$USER_HOME/.dotctl/config.json"
{
    "format_version": "$FORMAT_VERSION",
    "structure": {
        "home": "$USER_HOME/",
        "dot-local": "$USER_HOME/.local/",
        "dot-config": "$USER_HOME/.config/",
        "etc": "/etc/",
        "usr": "/usr/"
    }
}
EOL
    chmod 644 "$pkgdir/$USER_HOME/.dotctl/config.json"
  fi

  # Change ownership of all created files to the user
  chown -R $USER_NAME:$USER_NAME "$pkgdir/$USER_HOME/.dotctl"
}
