# Maintainer: Hendrik R. hendrikr_10 [at] yahoo [dot] de

# I didn't test this on i686!
# For any improvements please leave a comment in the AUR
# or send a PR to https://github.com/He-Ro/aur-packages

pkgname=heavybullets-hib
pkgver=1.05
_hibfile=HEAVYBULLETS_105_LNX.tar.gz
pkgrel=1
pkgdesc='A randomized FPS dungeon crawler where players make their way through a colorful maze, while protecting themselves from aggressive creatures and malfunctioning security devices. (Humble Bundle Version)'
url='https://www.devolverdigital.com/games/heavy-bullets'
arch=('i686' 'x86_64')
license=('custom:commercial')
options=()
depends=('glu'
         'gcc-libs-multilib')
depends_x86_64=('lib32-gtk2')
depends_i686=('gtk2')
changelog='hello.txt'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://${_hibfile}"
        "heavybullets.desktop")
sha256sums=('b4b8732bbc87773a8db84cbed3a0d942a5462c14984b317af5dcc154a5272c05'
            'e10ed2722ab1cbe7921c2cc39ca6eb66c5e9d45e0717f26d6171d74137c6f1c7')

package() {
  _target="/opt/${pkgname}"
  case $CARCH in
    i686)
      _arch=x86
  ;;
    x86_64)
      _arch=x86_64
  ;;
  esac

  mkdir -p "${pkgdir}${_target}"
  cp -r "${srcdir}/HEAVY_BULLETS_Data" \
        "${pkgdir}${_target}/"

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 "{}" +
  chown root:root -R "${pkgdir}"

  install -Dm755 "${srcdir}/HEAVY_BULLETS.${_arch}" \
                 "${pkgdir}${_target}/HEAVY_BULLETS"

  # Install desktop entry
  install -Dm644 "${srcdir}/heavybullets.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${pkgdir}${_target}/HEAVY_BULLETS_Data/Resources/UnityPlayer.png" \
                 "${pkgdir}/usr/share/pixmaps/HeavyBullets.png"

  # Install launcher symlink
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/heavybullets"
#!/bin/sh
/opt/${pkgname}/HEAVY_BULLETS
EOF
  chmod 755 "${pkgdir}/usr/bin/heavybullets"
}

# vim: tabstop=2 expandtab
