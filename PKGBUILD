# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_name="victoriametrics"
_name_camel="VictoriaMetrics"
pkgname="${_name}-cluster"
pkgver='1.114.0'
pkgrel='1'
pkgdesc='Fast, cost-effective monitoring solution and time series database'
arch=('x86_64' 'aarch64')
_uri="github.com/${_name_camel}"
url="https://${_uri}/${_name_camel}"
license=('Apache')
makedepends=('go' 'git')
conflicts=("${_name}-agent" "${_name}-bin" "${_name}" 'vmutils')
source=("${url}/archive/refs/tags/v${pkgver}-cluster.tar.gz"
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
sha256sums=('57921aaf680751f48a9e4c197e64ddfa60a38dd43f40c4504e4bc01b3b6d94ca'
            '459b40675c3b77b108a597e864d29b72c93870a0ef0d814d8a99f0c293addd54'
            'dbac6a2c04e7e25cd9aa8f2cddf40830be30b2870f44ea58649fd993262fa9e6'
            '5144d6cb0732ae7d12e92ec4e13c36f3373407b7f826c44aedff6da50dd8d17a'
            '15d7e15b15791b51b592560b01101a500fe57a9b842799189c78a58f4c2d1b6b'
            'ce3710d24588c6c7d664efc4a94d7a90db81fa5c3ba1444c81914e5a8f9e0f02'
            '0cb5339104652ff722a15fc47bb8db745414d7a977fbec4785b16d15fff796d6'
            'a332a723a399b8541fad9cb3450cc85d6fdcf8140f389360867958138657a6bf'
            'c10178ed075bc9db83926787f815e5f541eafc15ae46f8e2efcddaf90059036a'
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
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
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

  for app in "vmagent" "vmalert" "vmauth" "vmbackup" "vmctl" "vminsert" \
"vmrestore" "vmselect" "vmstorage"
  do
    go build -x \
      -buildmode="pie" \
      -trimpath \
      -mod="readonly" \
      -modcacherw \
      -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
      -X ${_uri}/${_name_camel}/lib/buildinfo.Version=${pkgver}-${pkgrel}" \
      -o "bin/${app}" "./app/${app}"
  done
}

check() {
  cd "${GOPATH}/src/${_uri}/${_name}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
    DISABLE_FSYNC_FOR_TESTING=1 go test ./lib/... ./app/...
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
