# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=bindery
pkgver=1.34.0
pkgrel=1
pkgdesc="Automated book download manager for Usenet."
arch=('x86_64')
url="https://github.com/vavallee/bindery"
license=('MIT')
makedepends=('go' 'npm')
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'prowlarr: automatically integrates with and syncs indexers'
  'audiobookshelf: automatically integrates audio books'
  'calibre: push imports to calibre'
  'grimmory: push imports to grimmory'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "bindery.service"
        "bindery.sysusers"
        "bindery.tmpfiles")
b2sums=('fc5fc486d63abe77d29be008da99507109e98762bec9fc3ede074b2fe569017de8ac1677ba983f243a524b311df3359f19b5706df93a7147744799b96d76a3e7'
        'cde79a1296a1b4054aae9d213f905b4d0ecd635cdffa7e7979dcc25a3ee128e733c0903ca398a60736fa0c5e48c6be537ee1c1706442d240b2553f0dddb9e763'
        '21805141f8ce1101fdcc7a0ce9d1f2224d5dec2c7f3b6d24c41623c11ffb59446be5c07c35083295e2347ef2f41e1007df4c5cffac0bfaa6e479fbf0b3f3065e'
        'e86254c28f1ee7bd495e53da384b628c579188ace5905ed2d77ebb0cbc76eb5348a7cc9f5057901639487303f053b6081609a4b664d4ef9d8954a5ffb6386598')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  # Frontend: tsc/vite are devDependencies, so install them first
  cd web
  npm ci --include=dev --cache "${srcdir}/npm-cache"
  npm run build
  cd ..
  # Embed the assets (internal/webui/embed.go uses //go:embed all:dist)
  cp -r web/dist/* internal/webui/dist/

  # Go: upstream builds with CGO_ENABLED=0 (pure-Go sqlite driver)
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="${srcdir}"
  go build -ldflags "-X main.version=${pkgver}" -o bindery ./cmd/bindery
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   export GOPATH="${srcdir}"
#   go test ./...
# }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
