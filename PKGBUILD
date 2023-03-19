pkgname=redis-insight-bin
pkgver=2.20.0
pkgrel=1
pkgdesc="GUI for Redis"
arch=('x86_64')
url='https://redis.com/redis-enterprise/redis-insight'
conflicts=(redisinsight)
provides=(redis-insight)
license=('custom:SSPL')
depends=()
makedepends=(
curl
yq
gendesk
)
_static_image=RedisInsight-v2-linux-x86_64.AppImage
_static_meta=latest-linux.yml
source=("$pkgname-$pkgver.AppImage::https://download.redisinsight.redis.com/latest/${_static_image}")

cksums=(SKIP)

pkgver() {
  curl -s https://download.redisinsight.redis.com/latest/${_static_meta} | yq -r '.version'
}

prepare() {
  _sha=$(curl -s https://download.redisinsight.redis.com/latest/latest-linux.yml | yq -r '.sha512' | base64 -d | od -t x1 -An | tr -d ' \n') 
  echo "${_sha}  ${pkgname}-${pkgver}.AppImage" > csum.txt
  sha512sum -c csum.txt
  rm csum.txt
  chmod +x ${pkgname}-${pkgver}.AppImage
  rm -rf squashfs-root
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
  cd squashfs-root

  install -Dm644 usr/share/icons/hicolor/512x512/apps/redisinsight.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "RedisInsight" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development' \
          --icon "${pkgname}"
  msg2 "${pkgname%-bin}.desktop"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 resources/LICENSE.redisinsight.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR . "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}

