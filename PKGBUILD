# Maintainer:  <freddy@facedown>
_pkgbasename=easy-novnc
pkgname=${_pkgbasename}-git
pkgver=v1.1.0.r8.g6e198aa
pkgrel=1
epoch=
pkgdesc="An easy way to run a noVNC instance and proxy with a single binary."
arch=('i686' 'x86_64')
url="https://github.com/pgaskin/easy-novnc/blob/master/LICENSE.md"
license=('MIT')
groups=()
depends=(go)
source=( "git+https://github.com/pgaskin/$_pkgbasename"
         "easy-novnc.config"
         "easy-novnc.sysusers"
         "easy-novnc.service")
md5sums=('SKIP'
         '92fccad62f96b94e90849e03c1bc4920'
         '067b5dc14de5fd7bd712618a70f17d5e'
         'bf2b8cfd73dfc93498dbbe056d285178')
noextract=()

pkgver() {
  # jq -r '.env | to_entries | .[] | [.key, .value.value]| @tsv' \
  #    ./easy-novnc/app.json | awk '{print $1 "=" $2}' > ../config

  cd "$_pkgbasename"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  cd "$_pkgbasename"
  mkdir -p build/
}

build() {
  cd "$_pkgbasename"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/

}

check() {
  cd "$_pkgbasename"
  # go test -v ./... 2&> /dev/null
  echo "OK"
}

package() {
  cd "$_pkgbasename"
  # config env file
  install -vDm 644 "${srcdir}/${_pkgbasename}.config" \
          "${pkgdir}/etc/webapps/easy-novnc/config"
  # systemd service
  install -vDm 644 "${srcdir}/${_pkgbasename}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgbasename}.service"
  # systemd-sysusers
  install -vDm 644 "${srcdir}/${_pkgbasename}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgbasename}.conf"
  # systemd-tmpfiles
  install -Dm755 build/$_pkgbasename "$pkgdir"/usr/bin/$_pkgbasename
}
