pkgname=unpackerr
pkgver=0.14.5
pkgrel=797
pkgdesc='Extracts downloads so Radarr, Sonarr, Lidarr or Readarr may import them.'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'pentium4')
url='https://golift.io/unpackerr'
license=('MIT')
makedepends=('go' 'gzip')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Unpackerr/unpackerr/archive/v0.14.5.tar.gz")
sha512sums=('f932541524f27718daf6759d22f710b043d7130dae84d7cebddb432cf4439b411830865c2b1ca35522d83ed431e25fb0d3c1385a4318d41275212851c3f87fa0')

backup=("etc/${pkgname}/${pkgname}.conf")

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  export VLDFLAGS="-w -s -X 'golift.io/version.Branch=main (${sha512sums[0]:0:11})' \
    -X golift.io/version.BuildDate=$(date -u +%Y-%m-%dT%H:%M:00Z) \
    -X golift.io/version.BuildUser=$(whoami) \
    -X golift.io/version.Revision=${pkgrel} \
    -X golift.io/version.Version=${pkgver}"

  go build -o unpackerr -ldflags "$VLDFLAGS" .
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual unpackerr --version ${pkgver} --date "${DATE}" README.md
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual unpackerr --version ${pkgver} --date "${DATE}" examples/MANUAL.md
  gzip -9 examples/MANUAL
  mv examples/MANUAL.gz ${pkgname}.1.gz
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Directories.
  install -d -m 775 "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}" "${pkgdir}/etc/${pkgname}"

  # Install the binary
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install configuration file(s).
  install -D -m 644 "examples/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -D -m 644 "examples/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}/${pkgname}.conf.example"

  # License, documentation, manual.
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 644 *.html examples/* "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m 644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # Install the systemd service unit and system user account.
  install -D -m 644 "init/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  echo "u ${pkgname} - \"${pkgname} daemon\"" > "${pkgname}.sysusers"
  install -D -m 644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  rm "${pkgname}.sysusers"
}
