# Maintainer: thelostpolaris <me [at] lostpolaris [dot] com>
# Co-maintainer: robertfoster

pkgname=navidrome-git
pkgver=v0.52.0.r29.g09d1fd06
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
depends=(
  'glibc'
  'gcc-libs'
  'zlib'
  'ffmpeg'
  'taglib'
)
makedepends=(
  'git'
  'go'
  'npm'
  'nodejs'
)
source=("${pkgname%%-git}::git+https://github.com/deluan/navidrome.git"
  "${pkgname%%-git}.service"
  "${pkgname%%-git}.sysusers"
  "${pkgname%%-git}.toml"
)
backup=("etc/navidrome/navidrome.toml")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%%-git}"

  # frontend
  pushd ui
  npm install
  npm run build
  popd

  # backend

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X github.com/navidrome/navidrome/consts.gitSha=$_commit \
    -X github.com/navidrome/navidrome/consts.gitTag=$pkgver" \
    -o build \
    .
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  install -Dm755 "${pkgname%%-git}" \
    "${pkgdir}/usr/bin/${pkgname%%-git}"

  install -Dm0644 ../"${pkgname%%-git}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%%-git}.service"
  install -Dm0644 ../"${pkgname%%-git}.toml" \
    "${pkgdir}/etc/navidrome/${pkgname%%-git}.toml"
  install -Dm0644 ../"${pkgname%%-git}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%%-git}.conf"
}

sha256sums=('SKIP'
            '790cdabdffba7163a92e22572f4a0810081c9617338b8c28d3eb8d0a7edb8ae1'
            'ee74a732f807e314f97e22b907882d16d125512d6ee23a36251fde2b3b7e608c'
            '6eb784c54ab2f0c5eb617dd952b2e7a553a5c28b514a3c311300b8c9bf845c43')
