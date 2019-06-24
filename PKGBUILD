# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zerotwo-git
pkgver=0.6.2+beta
pkgrel=4
pkgdesc='AniList anime tracker written with Electron & Vue.js (git)'
arch=(i686 x86_64)
url=https://www.zerotwo.org
license=(GPL3)
provides=(zerotwo)
conflicts=(zerotwo zerotwo-bin)
makedepends=(git npm)
source=(git+https://github.com/NicoAiko/zerotwo
        zerotwo.desktop)
sha512sums=('SKIP'
            '8811f73498b76d5985e819d40d84b1a88919c71b563de8ca58a831e9ffd5b1ec54d525d263a01c053a761385712669deb993824545af98e51d2ce73f96788bd3')

pkgver() {
  cd zerotwo
  git describe --tags | sed 's#v##;s#-#+#'
}

build() {
  cd zerotwo

  # You must generate an API client ID and secret on AniList in order to use the login function
  # Generate them at https://anilist.co/settings/developer
  _api_id=
  _api_secret=
  if [ -z $_api_id ] || [ -z $_api_secret ]; then
    echo "AniList API client ID and secret must be manually set for ZeroTwo to function properly. Quitting..."
    exit
  fi
  echo -e CLIENT_ID=${_api_id}'\n'CLIENT_SECRET=${_api_secret} > .env

  npm i
  NODE_ENV=production \
    ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true \
    npm run build:dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  install -Dm 644 zerotwo.desktop -t "$pkgdir"/usr/share/applications

  cd zerotwo/build

  cp -a linux-unpacked "$pkgdir"/usr/share/zerotwo
  ln -s /usr/share/zerotwo/zerotwo-ui "$pkgdir"/usr/bin/zerotwo

  for i in 16 32 64 128 256 512 1024; do
    install -Dm 644 icons/ZeroTwoAppIcon_$i* "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zerotwo.png
  done
}
