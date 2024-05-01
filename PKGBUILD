# Maintainer: Object42 <object42 at tutamail.com>
pkgname=ente-server-git
_pkgname_alt=museum
pkgver=r26258.eb64cd8
pkgrel=1
pkgdesc="Self hosted server for Ente (mobile) clients"
arch=(x86_64)
url="https://github.com/ente-io"
license=('AGPL-3.0-only')
depends=('go' 'libsodium' 'minio' 'minio-client' 'postgresql')
makedepends=('git' 'go' 'go-md2man' 'sed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(
    "etc/${pkgname%-git}/local.yaml"
)
options=('!debug')
source=(
    "ente-server-git::git+https://github.com/ente-io/ente.git"
    "${pkgname%-git}-man.1.md"
    "${pkgname%-git}-nginx.conf"
    "${pkgname%-git}-sysusers.conf"
    "${pkgname%-git}-tmpfiles.conf"
    "${pkgname%-git}.service"
    "${pkgname%-git}.yaml"
    "http_security_headers.conf"
    "https_security_headers.conf"
    "usr.bin.${pkgname%-git}"
)
sha256sums=(
    "SKIP"
    "3af23aa9925e197d41aa77ae5d51ae956e7e78ae0ea213000d6e3458a776e3b2"
    "2d5221aaa83f32bbc8c75c2d7c70f9ff8021d451b544f230c99fe29b84fcba75"
    "72c23c4ba9d3468a1b089d182917123cb15b8bf8b52b3955b98a0357d29b5cbd"
    "6ba953245f2a285dbd82ce65635d19410eab1dcd92821c398bdf7ffba9451a9b"
    "f5ae64093463a66fa66ecc4627f603ff0f9e17841e1d681dbcc68b1bad95100e"
    "9a10d967adca272d3d04666adf6d39c74122941f2431d95a4bc2f8acd4f4cffb"
    "405365bd47efa25b8bcefc93a5c0535fd50cce22b5d8dcea070098aa432ff87e"
    "a1149c57e233f7be2f12668f5ef0f03409bd5ad37b1a223bb56d2ae865cf6358"
    "297bc7d90c473758c9054aaaa6155b4e7232d0dfea761a4e55ed8b743f289f86"
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${srcdir}/${pkgname}/server/cmd/${_pkgname_alt}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw -mod=mod"
  mkdir -p ../../build
  # patch cleanup -> reduce delay from 45 days to 5 minutes
  sed -i 's@DeleteObjectQueue:         45 \* 24 \* 60, \/\/ 45 days in minutes@DeleteObjectQueue:                    5, // 5 minutes@' "${srcdir}/${pkgname}/server/pkg/repo/queue.go"
  go build -o ../../build/ente-server -v
  cd ../../tools
  for tool in *; do
      [ "${tool}" == 'pkg' ] && continue
      cd "${tool}"
      go build -o ../../build -v
      cd -
  done
  #go clean -modcache
}

package() {
  cd "${srcdir}/${pkgname}/server/build"

  # binary files and link
  install -dvm755 "${pkgdir}/usr/bin"
  install -Dvm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  for tool in *; do
      [ "${tool}" == "${pkgname%-git}" ] && continue
      install -Dvm755 "${tool}" "${pkgdir}/usr/bin/${pkgname%-git}-${tool}"
  done

  cd "${srcdir}/${pkgname}/server"

  # data files
  install -Dvm644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
  find migrations -type f -exec install -Dvm644 "{}" -t "${pkgdir}/usr/lib/${pkgname%-git}/migrations/" \;
  find mail-templates -type f -exec install -Dvm644 "{}" -t "${pkgdir}/usr/lib/${pkgname%-git}/mail-templates/" \;

  # config
  install -dvm755 "${pkgdir}/etc/${pkgname%-git}/"
  ln -s "/etc/${pkgname%-git}" "${pkgdir}/usr/lib/${pkgname%-git}/configurations"
  install -Dvm644 'configurations/local.yaml' -t "${pkgdir}/usr/lib/${pkgname%-git}/"
  install -Dvm640 "$srcdir/${pkgname%-git}.yaml" "${pkgdir}/etc/${pkgname%-git}/local.yaml"
  install -Dvm644 "$srcdir/${pkgname%-git}-nginx.conf" -t "${pkgdir}/usr/lib/${pkgname%-git}/"
  install -Dvm644 "$srcdir/usr.bin.${pkgname%-git}" -t "${pkgdir}/usr/lib/${pkgname%-git}/"

  # systemd
  install -Dm644 "$srcdir/${pkgname%-git}-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -Dm644 "$srcdir/${pkgname%-git}-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
  install -Dm644 "$srcdir/${pkgname%-git}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"

  # man page
  install -dvm755 "${pkgdir}/usr/share/man/man1"
  go-md2man -in "${srcdir}/${pkgname%-git}-man.1.md" -out "$pkgdir/usr/share/man/man1/${pkgname%-git}.1.gz"
}
