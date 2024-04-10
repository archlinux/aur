# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=pacmanclean
pkgver=1.0
pkgrel=1
pkgdesc="A script to clean orphaned packages using pacman"
arch=('any')
license=('GPL')
depends=('pacman')

# The script content
_pacmanclean_script=$(cat <<EOF
#!/bin/bash

cleanup() {
  # Clean orphaned packages
  pacman -Sc --noconfirm &> /dev/null

  # Remove orphaned dependencies
  orphaned=\$(pacman -Qdtq)
  while [[ -n \$orphaned ]]; do
    echo 'Cleaning orphaned dependencies...'
    echo "\$orphaned"  # List orphaned packages
    read -p 'Do you want to remove these packages? (y/N) ' choice
    case \$choice in
      [yY]|[yY][eE][sS])
        pacman -Rns \$orphaned --noconfirm &> /dev/null
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
  echo "$_pacmanclean_script" > "${pkgdir}/usr/bin/pacmanclean"

  # Set the script permissions
  chmod +x "${pkgdir}/usr/bin/pacmanclean"
}