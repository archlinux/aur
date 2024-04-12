# Maintainer: Cross Nastasi <cross@dill.moe>

# Note: If you have nothing better to do than play pretend package police because this doesn't meet your personal requirements, seethe away. Actual inquiries welcome.

pkgname=pacmancleaner
pkgver=1.0
pkgrel=1
pkgdesc="A script to clean orphaned packages using pacman"
arch=('any')
license=('GPL')
depends=('pacman')

# The script content
_pacmancleaner_script=$(cat <<EOF
#!/bin/bash

cleanup() {
  # Clean orphaned packages
  sudo pacman -Sc --noconfirm &> /dev/null

  # Remove orphaned dependencies
  orphaned=\$(pacman -Qdtq)
  while [[ -n \$orphaned ]]; do
    echo 'Cleaning orphaned dependencies...'
    echo "\$orphaned"  # List orphaned packages
    read -p 'Do you want to remove these packages? (y/N) ' choice
    case \$choice in
      [yY]|[yY][eE][sS])
        sudo pacman -Rns \$orphaned --noconfirm &> /dev/null
        ;;
      *)
        echo 'Skipping removal of orphaned packages.'
        break
        ;;
    esac
    orphaned=\$(pacman -Qdtq)
  done

  echo 'No more orphaned packages or dependencies.'
}

echo 'Cleaning orphaned packages...'
cleanup
EOF
)

package() {
  # Create the directory structure
  mkdir -p "${pkgdir}/usr/bin"

  # Write the script content to the destination
  echo "$_pacmancleaner_script" > "${pkgdir}/usr/bin/pacmancleaner"

  # Set the script permissions
  chmod +x "${pkgdir}/usr/bin/pacmancleaner"
}