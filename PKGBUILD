# Maintainer: Cross Nastasi <cross@dill.moe>

pkgname=yaycleaner
pkgver=1.0
pkgrel=1
pkgdesc="A script to clean orphaned packages using yay"
arch=('any')
license=('GPL')
depends=('yay')

# The script content
_yaycleaner_script=$(cat <<EOF
#!/bin/bash

cleanup() {
  # Clean orphaned packages
  yay -Sc --noconfirm &> /dev/null

  # Remove orphaned dependencies
  orphaned=\$(yay -Qdtq)
  while [[ -n \$orphaned ]]; do
    echo 'Cleaning orphaned dependencies...'
    echo "\$orphaned"  # List orphaned packages
    read -p 'Do you want to remove these packages? (y/N) ' choice
    case \$choice in
      [yY]|[yY][eE][sS])
        yay -Rns \$orphaned --noconfirm &> /dev/null
        ;;
      *)
        echo 'Skipping removal of orphaned packages.'
        break
        ;;
    esac
    orphaned=\$(yay -Qdtq)
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
  echo "$_yaycleaner_script" > "${pkgdir}/usr/bin/yaycleaner"
  
  # Set the script permissions
  chmod +x "${pkgdir}/usr/bin/yaycleaner"
}
