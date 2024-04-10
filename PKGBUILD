# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=yayclean
pkgver=1.0
pkgrel=1
pkgdesc="A script to clean orphaned packages using yay"
arch=('any')
url="https://github.com/dillfrescott/yayclean"
license=('GPL')
depends=('yay')

# The script content
_yayclean_script="#!/bin/bash

cleanup() {
  # Clean orphaned packages
  yay -Sc --noconfirm &> /dev/null
  
  # Remove orphaned dependencies
  orphaned=\$(yay -Qdtq)
  while [[ -n \$orphaned ]]; do
    echo 'Cleaning orphaned dependencies...'
    yay -Rns \$orphaned --noconfirm &> /dev/null
    orphaned=\$(yay -Qdtq)
  done
  
  echo 'No more orphaned packages or dependencies.'
}

echo 'Cleaning orphaned packages...'
cleanup
"

package() {
  # Create the directory structure
  mkdir -p "${pkgdir}/usr/bin"
  
  # Write the script content to the destination
  echo "$_yayclean_script" > "${pkgdir}/usr/bin/yayclean"
  
  # Set the script permissions
  chmod +x "${pkgdir}/usr/bin/yayclean"
}
