# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zerotwo-git
pkgver=0.6.2beta+r1+g3f49920
pkgrel=1
pkgdesc='AniList anime tracker written with Electron & Vue.js (git)'
arch=(i686 x86_64)
url=https://www.zerotwo.org
license=(GPL3)
provides=(zerotwo)
conflicts=(zerotwo zerotwo-bin)
depends=(alsa-lib atk at-spi2-atk cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libcups libglvnd libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango)
makedepends=(git npm)
source=(git+https://gitlab.com/NicoAiko/zerotwo
        zerotwo.desktop)
sha512sums=('SKIP'
            'd322d1fc1e78086a0dad38d3272fe1bebde3db750f0cd38c5995e7b2c819ab60d3a941792056d5fe2b431c968adae47b01b22d0d1bd8646b74967ad8000d789a')

pkgver() {
  cd zerotwo
  if [ $(git describe --tags | grep beta) ]; then
    git describe --tags | sed 's#v##;s#-#+#g;s#+\([a-zA-Z]\)#\1#;s#+\([0-9]\)#+r\1#'
  else git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
  fi
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
  cd zerotwo/build

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a linux-unpacked "$pkgdir"/usr/lib/zerotwo
  ln -s /usr/lib/zerotwo/zerotwo-ui "$pkgdir"/usr/bin/zerotwo

  install -Dm 644 ../../zerotwo.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 32 64 128 256 512 1024; do
    install -Dm 644 icons/ZeroTwoAppIcon_$i.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/zerotwo.png
  done

  install -Dm 644 ../LICENSE -t "$pkgdir"/usr/share/licenses/zerotwo
}
