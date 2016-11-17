# Maintainer: Hendrik R. hendrikr_10 [at] yahoo [dot] de

pkgname=riskofrain-hib
pkgver=1.3.0
pkgrel=2
pkgdesc='A roguelike action platformer/adventure game with randomized elements. (Humble Bundle Version)'
url='http://riskofraingame.com'
arch=('i686' 'x86_64')
license=('custom:commercial')
# WARNING: i686 is untested
depends_i686=('libxrandr'
              'openal'
              'glu'
              'libcurl-compat-nostatic')
depends_x86_64=('lib32-libxrandr'
                'lib32-openal'
                'lib32-glu'
                'lib32-libcurl-compat-nostatic')
options=()
install=${pkgname}.install
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/bin/sh -c echo\ Could\ not\ find\ %u.\ Manually\ download\ it\ to\ \\"$PWD\\",\ or\ set\ up\ a\ hib://\ DLAGENT\ in\ /etc/makepkg.conf.;exit\ 1')
_installer="Risk_of_Rain_v${pkgver}_DRM-Free_Linux_.zip"
source=("hib://${_installer}"
        "riskofraingame_com-RiskOfRain_1.desktop")
sha256sums=('9ef8004ba52bd34d0a72caa2dc1cf45d8a2ee59a8ad39a1caa8a3bf137a72a11'
            'c020cf568151ab85737d6cd87d0e80137aa24be08d54fc8ff0e0a53a60670e57')

package() {
  case $CARCH in i686) _lib_dir="/usr/lib";; x86_64) _lib_dir="/usr/lib32";; esac

  _target="/opt/${pkgname}"
  mkdir -p ${pkgdir}${_target}
  cd "${pkgdir}${_target}"
  unzip ${srcdir}/${_installer}

  # Fix permissions
  find "${pkgdir}${_target}" -type f -exec chmod 644 "{}" +
  find "${pkgdir}${_target}" -type d -exec chmod 755 "{}" +
  chmod 755 ${pkgdir}${_target}/Risk_of_Rain
  chown root:root -R "${pkgdir}"

  # Install desktop entry
  install -Dm644 "${srcdir}/riskofraingame_com-RiskOfRain_1.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${pkgdir}${_target}/assets/icon.png" \
                 "${pkgdir}/usr/share/pixmaps/RiskOfRain.png"

  # Install launcher symlink
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/riskofrain"
#!/bin/sh
LD_PRELOAD=${_lib_dir}/libcurl.so.3 /opt/${pkgname}/Risk_of_Rain
EOF
  chmod 755 "${pkgdir}/usr/bin/riskofrain"
}
