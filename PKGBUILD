# Maintainer: samarthj <dev@samarthj.com>

# shellcheck disable=2034,2148,2154

pkgname=containers-common-git
_pkgname=containers-common
_gitpkgname=common
pkgver=0.47.4+dev.r1683.ge28d5678
pkgrel=1
pkgdesc="Configuration files and manpages for containers (git)"
arch=('any')
makedepends=('go-md2man' 'git' 'libgpgme.so')
provides=("$_pkgname")
conflicts=("$_pkgname")
_baseurl="https://github.com/containers"
url="$_baseurl/$_gitpkgname.git"
license=(Apache)
backup=(
  'etc/containers/containers.conf'
  'etc/containers/mounts.conf'
  'etc/containers/policy.json'
  'etc/containers/registries.conf'
  'etc/containers/seccomp.json'
  'etc/containers/storage.conf'
)
options=('emptydirs')
source=("git+$url"
  "git+$_baseurl/image.git"
  "git+$_baseurl/podman.git"
  "git+$_baseurl/skopeo.git"
  "git+$_baseurl/storage.git"
  "git+$_baseurl/shortnames.git"
  'mounts.conf'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ae96bbb4a2a3e10759b1506754724bff0fa05feaf16958d19c73124e6b3fed45')

pkgver() {
  cd "$srcdir/$_gitpkgname" || exit 1
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(grep const version/version.go | sed -re 's|.*"(.*)"$|\1|g')
  echo "${ver//-/_}.${commit}"
}

prepare() {
  sed -r 's/(GOMD2MAN = ).*/\1 go-md2man/' -i storage/docs/Makefile
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  (
    cd "common" || exit 1
    make docs
  )
  (
    cd "image" || exit 1
    make docs
  )
  (
    cd "podman" || exit 1
    go-md2man -in pkg/hooks/docs/oci-hooks.5.md \
      -out oci-hooks.5
  )
  (
    cd "storage" || exit 1
    make docs
  )
}

package() {
  # directories
  install -vdm 755 "${pkgdir}/etc/containers/oci/hooks.d/"
  install -vdm 755 "${pkgdir}/etc/containers/registries.conf.d/"
  install -vdm 755 "${pkgdir}/usr/share/containers/oci/hooks.d/"
  install -vdm 755 "${pkgdir}/var/lib/containers/"

  # configs
  install -vDm 644 mounts.conf -t "${pkgdir}/etc/containers/"

  (
    cd "common" || exit 1
    # copy configs to other locations
    install -vDm 644 pkg/config/containers.conf -t "${pkgdir}/etc/containers/"
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/usr/share/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "${pkgdir}/etc/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "${pkgdir}/usr/share/containers/"
    # man pages (the makefile has a bug can't use the install target)
    install -vDm 644 docs/*.5 -t "$pkgdir/usr/share/man/man5/"
    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  )
  (
    cd "image" || exit 1
    # configs
    install -vDm 644 registries.conf -t "${pkgdir}/etc/containers/"
    # man pages
    make install-docs DESTDIR="$pkgdir"
  )
  (
    cd "podman" || exit 1
    install -vDm 644 ./*.5 -t "${pkgdir}/usr/share/man/man5/"
  )
  (
    cd "skopeo" || exit 1
    # configs
    install -vDm 644 default-policy.json "${pkgdir}/etc/containers/policy.json"
    install -vDm 644 default.yaml -t "${pkgdir}/etc/containers/registries.d/"
  )
  (
    cd "storage" || exit 1
    # configs
    install -vDm 644 storage.conf -t "${pkgdir}/etc/containers/"
    install -vDm 644 storage.conf -t "${pkgdir}/usr/share/containers/"
    # man pages (the makefile has a bug can't use the install target)
    install -vDm 644 docs/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -vDm 644 docs/*.5 -t "$pkgdir/usr/share/man/man5/"
  )
  (
    cd "shortnames" || exit 1
    install -vDm 644 shortnames.conf "$pkgdir/etc/containers/registries.conf.d/00-shortnames.conf"
  )
}
