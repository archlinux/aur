# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_name="victoriametrics"
_name_camel="VictoriaMetrics"
pkgname="${_name}-cluster"
pkgver='1.153.0'
pkgrel='1'
pkgdesc='Fast, cost-effective monitoring solution and time series database'
arch=('x86_64' 'aarch64')
_uri="github.com/${_name_camel}"
url="https://${_uri}/${_name_camel}"
license=('Apache')
makedepends=('go' 'git')
conflicts=("${_name}-agent" "${_name}-bin" "${_name}" 'vmutils')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${_name_camel}/tar.gz/refs/tags/v${pkgver}-cluster"
	"vmauth"
	"vmauth.service"
	"vminsert"
	"vminsert.service"
	"vmselect"
	"vmselect.service"
	"vmstorage"
	"vmstorage.service"
	"vmauth.yml"
	"${_name}.sysusers"
	"${_name}.tmpfiles")
sha256sums=('e0c444165176aa5ed5723d2c9d85fa78ab967842d21ff51f682b7d06fbedfa0d'
            '459b40675c3b77b108a597e864d29b72c93870a0ef0d814d8a99f0c293addd54'
            '866078e2049a3e70196f649fec69130ffdc27c020777c83c9770e56d13224c10'
            '5144d6cb0732ae7d12e92ec4e13c36f3373407b7f826c44aedff6da50dd8d17a'
            'ff94ba284b28f9af3fee836cef58cb2ecc69be1217e562a53872255f7c5d5cbb'
            'ce3710d24588c6c7d664efc4a94d7a90db81fa5c3ba1444c81914e5a8f9e0f02'
            'b5a490448d05f1f227a0967f6a27227e316ab82bb26e53b10555ac3dce8eedad'
            'a332a723a399b8541fad9cb3450cc85d6fdcf8140f389360867958138657a6bf'
            '677aff125a371057c970a29b004b3362a9dca4166e7a76ab62434a6773201728'
            '75cb2f253312d814a0418e45e9c430f3ea392720b912f4c7d15a1093ba338415'
            '82d36f90fe6eacde11b387cd3537d049bb67292e2dd0b5c95b555c020e199980'
            'eb972939dace3a330c7be1bd0e0f7a9fb3d9ca449326d4eeac5c208af376a84c')
backup=("etc/${_name}/vmauth.yml"
        "etc/conf.d/vmauth"
        "etc/conf.d/vminsert"
        "etc/conf.d/vmselect"
        "etc/conf.d/vmstorage")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOTMPDIR="${GOPATH}/tmp"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  mkdir -p "${GOPATH}/src/${_uri}"
  mkdir -p "${GOTMPDIR}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${_name_camel}-${pkgver}-cluster" \
  "${GOPATH}/src/${_uri}/${_name}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${_name}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  export GOOS="${GOHOSTOS}"
  export GOARCH="${GOHOSTARCH}"
  export CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}"
  export CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}"
  export LDLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  for app in "vmagent" "vmalert" "vmauth" "vmbackup" "vmctl" "vminsert" \
"vmrestore" "vmselect" "vmstorage"
  do
    go build -x \
      -buildmode="pie" \
      -trimpath \
      -mod="readonly" \
      -modcacherw \
      -ldflags "-linkmode external -compressdwarf=false -extldflags '${LDFLAGS}' \
      -X ${_uri}/${_name_camel}/lib/buildinfo.Version=${pkgver}-${pkgrel}" \
      -o "bin/${app}" "./app/${app}"
  done
}

check() {
  cd "${GOPATH}/src/${_uri}/${_name}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  TMPDIR="${GOPATH}/tmp" GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
    DISABLE_FSYNC_FOR_TESTING=1 go test -modcacherw ./lib/... ./app/...
}

package() {
  for app in "vmagent" "vmalert" "vmauth" "vmbackup" "vmctl" "vminsert" \
"vmrestore" "vmselect" "vmstorage"
  do
    install -Dm0755 "${_name_camel}-${pkgver}-cluster/bin/${app}" -t "${pkgdir}/usr/bin"
  done

  for app in "vmauth" "vminsert" "vmselect" "vmstorage"
  do
    install -Dm0644 "${app}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm0644 "${app}" -t "${pkgdir}/etc/conf.d"
  done

  install -Dm0644 "${GOPATH}/src/${_uri}/${_name}/LICENSE" -t \
"${pkgdir}/usr/share/licenses/${_name}"
  install -Dm0644 "vmauth.yml" -t "${pkgdir}/etc/${_name}"
  install -Dm0644 "${_name}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"
  install -Dm0644 "${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
}
