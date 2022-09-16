# Maintainer: samarthj <dev@samarthj.com>

# shellcheck disable=2034,2148,2154

pkgname=containers-common-git
_pkgname=containers-common
_gitpkgname=common
pkgver=0.49.2_dev.r2080.gfd150ee5
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
  "git+$_baseurl/skopeo.git"
  "git+$_baseurl/storage.git"
  "git+$_baseurl/shortnames.git"
  "mounts.conf"
  "$_pkgname-0.48.0-init_path.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f9a8feacbb210fd9f43a1f2a78b9e81fc90f3bcf8f38d7d6eba3b9b6447fb5e8f688a4f87cc2536d981853910c96828edff5f55f11c5f2b55aa58a499182b7c5'
            '4a6526d01f192f0eb4dcbd28c019a2b0db6dc2128af644e8e89992e5dcfa45a02c739b06ee01e22606b5cb847213c002f8ab5f87a576846ac73f73eed9b2b469')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'ed80ef23a8a258c5fc6db462a6254fc3f84fd2a8817593fdb7ebb808cd8374af20098aa30522141609dbf1fe9d3e9a05d66975f4a3c7421036aef27f6bc07ddb'
        '89e95f468785f6ca1309b0de37921702bd4eb6fb191afc0d93454bec7b7096a1b84e19408b5a0abcdfd89ce2ebd228879cbc42a0d409425fb41caab6a8f049f5')

pkgver() {
  cd "$srcdir/$_gitpkgname" || exit 1
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(grep const version/version.go | sed -re 's|.*"(.*)"$|\1|g')
  echo "${ver//-/_}.${commit}"
}

prepare() {
  sed -r 's/(GOMD2MAN = ).*/\1 go-md2man/' -i storage/docs/Makefile
  patch -Np1 -d $_gitpkgname -i ../$_pkgname-0.48.0-init_path.patch
  mkdir -vp build/{man1,man5}
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  (
    cd "common" || exit 1
    make docs
    for _man_page in docs/*5.md pkg/hooks/docs/*5.md; do
      go-md2man -in "$_man_page" -out "../build/man5/$(basename "${_man_page//.md/}")"
    done
  )
  (
    cd "image" || exit 1
    mkdir -vp man5
    mv -v docs/*.5.md man5/
    for _man_page in docs/*.md; do
      go-md2man -in "$_man_page" -out "../build/man1/$(basename "${_man_page//.md/}").1"
    done
    for _man_page in man5/*.md; do
      go-md2man -in "$_man_page" -out "../build/man5/$(basename "${_man_page//.md/}")"
    done
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
    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  )
  (
    cd "image" || exit 1
    # configs
    install -vDm 644 registries.conf -t "${pkgdir}/etc/containers/"
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
  # man pages
  install -vDm 644 build/man1/*.1 "$pkgdir/usr/share/man/man1/"
  install -vDm 644 build/man5/*.5 "$pkgdir/usr/share/man/man5/"
}
