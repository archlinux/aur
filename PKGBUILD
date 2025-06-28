# Maintainer: c4 
pkgname=lsr-iouring-git
_pkgname=lsr
_zig_cache=$(zig env | jq .global_cache_dir | tr -d '"')
pkgver=1.0.0.r1.g0c4dc41
pkgrel=1
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://tangled.sh/@rockorager.dev/lsr"
license=('MIT')

makedepends=('zig' 'git')
optdepends=(
'anyzig: lets you run any version of zig'
)

_pkgsrc="$_pkgname"
source=('git+https://tangled.sh/@rockorager.dev/lsr')
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  # PACKAGING.md -> build.zig.zon
  for i in $(grep '\.url' build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    zig fetch --global-cache-dir "$_zig_cache" "$i"
  done
}

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -rV | head -1)
  local _version"=${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "$_zig_cache"
    --system "$_zig_cache""/p"
    -Dtarget=native-native-gnu
    -Dcpu=native
    -Doptimize=ReleaseSmall
  )

  cd "$_pkgsrc"
  DESTDIR="build" zig build "${_zig_options[@]}"
}

package() {
  cd "$_pkgsrc"
  cp --reflink=auto -a build/* "$pkgdir"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
