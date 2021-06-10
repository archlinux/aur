# Maintainer: feinedsquirrel < feinedsquirrel at gmail dot com >

# instructions by photoview author:
# https://photoview.github.io/docs/installation-manual/

pkgname=photoview
pkgver=2.3.4
pkgrel=1
pkgdesc="Photo gallery for self-hosted personal servers"
arch=('x86_64')
url="https://github.com/photoview/photoview"
license=('AGPL3')
_commit="72fd6c39ea0dd42c0aa13132be33576c9b742e5c"
depends=(
  'nodejs'
  'libjpeg-turbo'
  'libheif'
  'blas'
  'cblas'
  'lapack'
  'dlib'
)
makedepends=(
  'git'
  'go'
  'npm'
)
optdepends=(
  'mariadb: for mysql database backend'
  'postgresql: for database backend'
  'sqlite: for database backend'
  'darktable: for RAW image support'
  'ffmpeg: for video file playback in the browser'
  'perl-image-exiftool: for faster and more reliable EXIF metadata parsing'
)
conflicts=(
  'golang-photoview'
)
replaces=(
  'golang-photoview'
)
backup=(
  "etc/${pkgname}.env"
)
install=${pkgname}.install
source=(
  "git+${url}.git#commit=${_commit}"
  "${pkgname}.service"
  "${pkgname}.env.patch"
)
sha512sums=(
  'SKIP'
  '5184097e279dc400e8ca2b811b7ca3101c16e27d8da94b5409105ee8c253098356596be402424a9bfa52a3a2fcbf32780f7c8b21dee09aa3e912cbe7bd5af286'
  '5f1a57316fb1d682bb5df1564bae46f282aaff3fa05a8bf8bd2c7c27a6c015101f2eea158be3ec9822ab63defc3b097156db5cf3afa957b5a31ba27d152b0308'
)

prepare() {
  cd "${srcdir}/${pkgname}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.env.patch"
}

build() {
  cd "${srcdir}/${pkgname}/ui"
  npm install --yes
  npm run build

  cd "${srcdir}/${pkgname}/api"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o photoview .
}

package() {
  # --ui--
  cd "${srcdir}/photoview/ui/dist"
  find * -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/share/webapps/photoview-ui/{}" \;

  # --api--
  # binary
  install -Dm0755 -t "${pkgdir}/usr/lib/${pkgname}" "${srcdir}/${pkgname}/api/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"
  # data/
  cd "${srcdir}/photoview/api"
  find data -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;
  # .env file
  install -Dm0644 "${srcdir}/${pkgname}/api/example.env" "${pkgdir}/etc/${pkgname}.env"

  # systemd unit file
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${pkgname}.service"
  # sqlite and cache dirs
  cd "${pkgdir}"
  install -d "${pkgdir}/var/lib/photoview"
  install -d "${pkgdir}/var/cache/photoview/media_cache"
}
