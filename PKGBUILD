# Maintainer: feinedsquirrel < feinedsquirrel at gmail dot com >

# instructions by photoview author:
# https://photoview.github.io/docs/installation-manual/

pkgname=photoview
pkgver=2.3.6
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
  "${pkgname}.service"
  "${pkgname}.env.patch"
  "${pkgname}.sysusers.conf"
  "${pkgname}.tmpfiles"
)
sha512sums=(
  '36e34b8ab6c52606e6039c304194efd4ca1cec31fdc836b924d9684b03d460723811e4c01a7bb60cbe27427f5356bf93e2172683fb145059bc5b97ed4621154d'
  '85ccf75291f30abd25a3b6679caf52842893a780200fc4dc6bcd067a4578c0dd079821c209fe6b7ea0e1ced120b016c323bc937a79a78a6eb8e81e09569a631b'
  'aa9b3fe32883af83c183a3cf1d0646b6140f2294c5b58d6df3cac4b1f9b89300f955f46fa125d50ccaac866ab60a752d42f547af19772159e6a2f176c0cf6369'
  'ad221c26f04bd8087243a0b069df1f99e41b75e0206543a5573069e677e50a15292c02cec1431c396e71a8b674943b9a4659fc7d46a6ab0e3e0a9020903241ea'
  '67eca71ca6588f94bdc9d97899fc5c480b16fe0ad3c7c82cb6e6af1a43797666a1a051b700d91c912fc078e8139cc089a016e1c911978f968f6626e2f499fa54'
)

prepare() {
  cd "${srcdir}/${_pkg_name_ver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.env.patch"
}

build() {
  cd "${srcdir}/${_pkg_name_ver}/ui"
  npm install --yes
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
  cd "${srcdir}/${_pkg_name_ver}/ui/build"
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

  # systemd unit file
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${pkgname}.service"
  # sqlite and cache dirs
  cd "${pkgdir}"
  install -d "${pkgdir}/var/lib/${pkgname}"
  install -d "${pkgdir}/var/cache/${pkgname}/media_cache"

  # user and group management
  install -Dm0644 "${srcdir}/${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
