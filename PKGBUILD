# Maintainer: Antonin Dach <dach@protonmail.com>
pkgname=librewolf-firefox-shim
pkgver=100.0.2
pkgrel=1
pkgdesc="A symlink for using librewolf as a firefox"
arch=('any')
url="https://librewolf-community.gitlab.io/"
license=('MIT')
depends=('librewolf')
provides=(
  "firefox=${pkgver}"
)
conflicts=(
  "firefox"
)

pkgver() {
  if [[ $CI == true ]]; then
    # Assuming build runner is without extra and has online access
    git ls-remote https://gitlab.com/librewolf-community/browser/arch | perl -lne 'print $1 if /refs\/tags\/v(.*)/' | grep -oE '[0-9]{3}\.[0-9]*\.[0-9]*' | tail -n 1
  else
    pacman -Qi librewolf | grep -E '^Version[[:space:]]*:' | head -n 1 | awk -F ':' '{print $2}' | sed -E 's|-.*||' | tr -d '[[:space:]]'
  
  fi
}

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/librewolf "$pkgdir"/usr/bin/firefox
}
