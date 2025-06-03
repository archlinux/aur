# Maintainer: c4 
pkgname=lsr-iouring-git
_pkgname=lsr
pkgver=0.2.0.r19.g2f8e1f0
pkgrel=1
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://tangled.sh/@rockorager.dev/lsr"
license=('MIT')

makedepends=('zig' 'git')
optdepends=(
'anyzig: lets you run any version of zig'
'anyzig-symlinks: symlink anyzig to zig'
)

_pkgsrc="$_pkgname"
source=('git+https://tangled.sh/@rockorager.dev/lsr')
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  # PACKAGING.md -> build.zig.zon
  for i in $(grep '\.url' build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    zig fetch --global-cache-dir $HOME/.cache/zig "$i"
  done
  for i in $(grep '\.url' $HOME/.cache/zig/p/ourio-0.0.0-*/build.zig.zon | sed -E 's&^.* = "(\S+)".*$&\1&'); do
    zig fetch --global-cache-dir $HOME/.cache/zig "$i"
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
    --global-cache-dir $HOME/.cache/zig
    --system $HOME/.cache/zig/p
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
