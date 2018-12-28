# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-git
pkgver=v1.0.1.r0.g9a7482bd
pkgrel=1
pkgdesc="A Kubernetes-native serverless framework that lets you deploy small bits of code without having to worry about the underlying infrastructure plumbing."
arch=('x86_64')
groups=()
depends=(
  "filesystem"
  "glibc"
  "iana-etc"
  "linux-api-headers"
  "tzdata"
)
makedepends=(
  "go"
  "git"
  "wget"
)
_builddepends_bins_path="/tmp/build/bin"
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
license=("Apache")
_manifest_non_rbac="${_upstream_pkgname}-non-rbac.yaml"
_manifest_openshift="${_upstream_pkgname}-openshift.yaml"
_manifest_rbac="${_upstream_pkgname}.yaml"
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
# https://github.com/kubeless/kubeless/archive/v1.0.0.tar.gz
source=("${_upstream_pkgname}::git+https://github.com/${_pkgauthor}/${_upstream_pkgname}.git"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "SKIP"
  "SKIP"
)


prepare() {
  # https://github.com/kubeless/kubeless/blob/master/Makefile#L104-L113
  # have to copy/paste this section because the upstream maintainers are using sudo during this section of the Makefile
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p ${_builddepends_bins_path}
  echo "=== fetching kubecfg"
  wget -q -O "${_builddepends_bins_path}/kubecfg" https://github.com/ksonnet/kubecfg/releases/download/v0.9.0/kubecfg-$(go env GOOS)-$(go env GOARCH); \
    chmod +x "${_builddepends_bins_path}/kubecfg";
  echo "=== fetching kubectl"
  KUBECTL_VERSION=$(wget -qO- https://storage.googleapis.com/kubernetes-release/release/stable.txt); \
    wget -q -O "${_builddepends_bins_path}/kubectl" https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/$(go env GOOS)/$(go env GOARCH)/kubectl; \
    chmod +x "${_builddepends_bins_path}/kubectl";

  mkdir -p "${srcdir}/gopath/{bin,src,pkg}"
  mkdir -p "${srcdir}/gopath/src/github.com/${_pkgauthor}"
  cp -r "${srcdir}/${_upstream_pkgname}" "${srcdir}/gopath/src/github.com/${_pkgauthor}/${_upstream_pkgname}"
  # debug
	cd "${srcdir}/${_upstream_pkgname}"

	echo "pkgver: $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
  # debug
}

pkgver() {
	cd "${srcdir}/${_upstream_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="${srcdir}/gopath"
  export PATH="${_builddepends_bins_path}:${PATH}"
  cd "${srcdir}/gopath/src/github.com/${_pkgauthor}/${_upstream_pkgname}"
  # https://github.com/kubeless/kubeless/blob/master/.circleci/config.yml#L77-L105
  go get -u golang.org/x/lint/golint
  make bootstrap
  # make VERSION=${CONTROLLER_TAG} binary
  make VERSION="${pkgver}" binary
  make test
  make validation
  make all-yaml
  mkdir build-manifests
  MANIFESTS="kubeless kubeless-non-rbac kubeless-openshift"; \
  IFS=' ' read -r -a manifests <<< "$MANIFESTS"; \
  for f in "${manifests[@]}"; do \
    sed -i.bak 's/:latest/'":${CONTROLLER_TAG}"'/g' ${f}.yaml; \
    cp ${f}.yaml build-manifests/; \
  done
}


package() {
  install -Dm755 "${srcdir}/gopath/bin/${_upstream_pkgname}" "${pkgdir}/usr/bin/${_upstream_pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"

  mkdir -p "${pkgdir}/usr/share/${_upstream_pkgname}/manifests"
  cp "${srcdir}/gopath/src/github.com/${_upstream_pkgname}/${_pkgauthor}/build-manifests/${_manifest_non_rbac}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  cp "${srcdir}/gopath/src/github.com/${_upstream_pkgname}/${_pkgauthor}/build-manifests/${_manifest_openshift}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  cp "${srcdir}/gopath/src/github.com/${_upstream_pkgname}/${_pkgauthor}/build-manifests/${_manifest_rbac}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  chmod 644 "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"*.yaml
}
