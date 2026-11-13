# Maintainer: jamezrin <mrjaime1999@gmail.com>
# Builds the newest stable vX.Y.Z tag, rather than an untagged development commit.
pkgname=outpace-git
pkgver=1.0.1
pkgrel=1
pkgdesc='Open-source streaming engine for public Acestream content (latest stable Git tag)'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/outpace-stream/outpace-engine'
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
optdepends=('ffmpeg: audio normalization and optional media processing')
provides=("outpace=${pkgver}")
conflicts=('outpace')
backup=('etc/outpace/outpace.env')
options=('!lto' '!debug')
source=("outpace-engine::git+${url}.git" 'outpace.sysusers')
sha256sums=('SKIP' '1c8db166cd12f6b57566cdd28d8346ffbcc182cf4c0ad941465633d5a5c4c2bf')

# Numeric tag ordering avoids treating v1.10.0 as older than v1.9.0.
_latest_stable_tag() {
  local tag
  local -a tags
  mapfile -t tags < <(git tag --list 'v[0-9]*' --sort=-version:refname)
  for tag in "${tags[@]}"; do
    if [[ $tag =~ ^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$ ]]; then
      printf '%s\n' "$tag"
      return
    fi
  done
  printf '%s\n' 'No stable vX.Y.Z release tag found' >&2
  return 1
}

prepare() {
  cd outpace-engine
  local tag
  tag=$(_latest_stable_tag) || return
  git checkout --detach "$tag" || return
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

pkgver() {
  cd outpace-engine
  local tag
  tag=$(_latest_stable_tag) || return
  printf '%s\n' "${tag#v}"
}

build() {
  cd outpace-engine
  # Upstream dist enables fat LTO and one codegen unit itself.
  cargo build --frozen --profile dist -p ace-engine --bin outpace
}

check() {
  cd outpace-engine
  cargo test --frozen --workspace
}

package() {
  cd outpace-engine
  install -Dm755 target/dist/outpace "$pkgdir/usr/bin/outpace"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linux/outpace.service "$pkgdir/usr/lib/systemd/system/outpace.service"
  install -Dm644 "$srcdir/outpace.sysusers" "$pkgdir/usr/lib/sysusers.d/outpace.conf"
  install -Dm644 packaging/linux/outpace.env "$pkgdir/etc/outpace/outpace.env"
}
