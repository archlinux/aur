_pkgname=joplin-server
_image=joplin/server

pkgname="$_pkgname-bin"
pkgver=3.7.1
pkgrel=1
pkgdesc='Joplin Server, via Docker image'
arch=('any')
url="https://hub.docker.com/r/$_image"
license=('custom:Joplin-Server-Personal-Use-License')
depends=('nodejs' 'pnpm' 'pm2')
makedepends=('jq')
source=(
  "$_pkgname.service"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
  'https://raw.githubusercontent.com/laurent22/joplin/dev/.env-sample'
)
sha256sums=('adac9f3a6df5a29c4fa865249e9c8b65cd6b582271fb9e69d99c4b9ebc83f5fa'
            '2f3cea9bed6f79d7c93721dd1acb7c3b5c0368be264ae2894bd66034634e694d'
            '55455d0ebfcb6ef72b8c4fe934a69ccfd9089f881058933d7cba0c07d7aaffc0'
            'e85770c7a0391baa7cf18edeeb64b6a8fe2ccb409d31294d2bde4cd8096cf80f')
backup=("etc/$_pkgname.env")
provides=("$_pkgname")
options=(!strip !debug)

_vnd='application/vnd.docker.distribution.manifest.v2+json'
_vndlist='application/vnd.docker.distribution.manifest.list.v2+json'
_accept="$_vnd,$_vndlist"
_service=registry.docker.io
_registry=registry-1.docker.io

_path=home/joplin/packages

prepare() {
  echo "Authenticating to '$_service'"
  token="$(curl -s "https://auth.docker.io/token?service=$_service&scope=repository:$_image:pull" | jq -r .access_token)"
  echo "Looking up image '$_image:$pkgver' via '$_registry'"
  idigest="$(curl -s -H "Authorization: Bearer $token" -H "Accept: $_accept" "https://$_registry/v2/$_image/manifests/$pkgver" \
    | jq -r 'if .mediaType == "'"$_vndlist"'" then .manifests[0] else . end | .digest')"
  echo "Listing layers for manifest '$idigest'"
  curl -s -H "Authorization: Bearer $token" -H "Accept: $_vnd" "https://$_registry/v2/$_image/manifests/$idigest" \
    | jq -r '.layers[].digest' \
    | while read ldigest; do
        echo "Fetching layer '$ldigest'"
        count=$(curl -s --follow -H "Authorization: Bearer $token" "https://$_registry/v2/$_image/blobs/$ldigest" \
          | 2>&1 tar xzv $_path | grep -Ev 'Not found in archive|Exiting with failure status' | wc -l)
        if [ $count -gt 0 ]; then echo "* unpacked $count files"; fi
      done
}

package() {
  install -d -m 0755 "$pkgdir/usr/lib/$_pkgname"
  cp -a "$_path/"* "$pkgdir/usr/lib/$_pkgname/"
  install -D -m 0644 "$_path/server/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m 0640 .env-sample "$pkgdir/etc/$_pkgname.env"
  ln -s '/var/lib/joplin/logs' "$pkgdir/usr/lib/$_pkgname/server/logs"
  ln -s '/var/lib/joplin/temp' "$pkgdir/usr/lib/$_pkgname/server/temp"
  install -D -m 0644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -D -m 0644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -D -m 0644 "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
