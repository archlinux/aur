# Maintainer: feinedsquirrel < feinedsquirrel at gmail dot com >
# Maintainer: edpibu < archlinux at edgarpierre dot fr >

# instructions by photoview author:
# https://photoview.github.io/docs/installation-manual/

pkgname=photoview
pkgver=2.4.0
pkgrel=1
pkgdesc="Photo gallery for self-hosted personal servers"
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL3')
_pkg_name_ver="${pkgname}-${pkgver}"
depends=(
  'nodejs'
  'libjpeg-turbo'
  'libheif'
  'libwebp'
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
  "$url/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.env.patch"
)
sha512sums=('99af3e4f9876fe765636c5f9457b49d906d23119b8926cf6ea4aeaed3b0958e0cef3fddef1020bcb616caf296d5675e5981fa48df51d4bea9fc93fb5f29abe11'
            'aa9b3fe32883af83c183a3cf1d0646b6140f2294c5b58d6df3cac4b1f9b89300f955f46fa125d50ccaac866ab60a752d42f547af19772159e6a2f176c0cf6369')

prepare() {
  cd "${srcdir}/${_pkg_name_ver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.env.patch"
}

build() {
  cd "${srcdir}/${_pkg_name_ver}/ui"
  npm ci --yes --omit=dev --ignore-scripts
  npm run build

  cd "${srcdir}/${_pkg_name_ver}/api"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o photoview .
}

package() {
  # --ui--
  cd "${srcdir}/${_pkg_name_ver}/ui/dist"
  find * -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/share/webapps/${pkgname}-ui/{}" \;

  # --api--
  # binary
  install -Dm0755 -t "${pkgdir}/usr/lib/${pkgname}" "${srcdir}/${_pkg_name_ver}/api/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"
  # data/
  cd "${srcdir}/${_pkg_name_ver}/api"
  find data -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;
  # .env file
  install -Dm0644 "${srcdir}/${_pkg_name_ver}/api/example.env" "${pkgdir}/etc/${pkgname}.env"

  # sqlite and cache dirs
  cd "${pkgdir}"
  install -d "${pkgdir}/var/lib/${pkgname}"
  install -d "${pkgdir}/var/cache/${pkgname}/media_cache"

  # systemd unit file
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_pkg_name_ver}/systemd/${pkgname}.service"
  # user and group management
  install -Dm0644 "${srcdir}/${_pkg_name_ver}/systemd/${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${_pkg_name_ver}/systemd/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
