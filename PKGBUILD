# Maintainer: Victor M. Varela <vmvarela at gmail dot com>
pkgname=takeoff
pkgver=0.4.1
pkgrel=1
pkgdesc="Release automation for Zig projects"
arch=('x86_64')
url="https://github.com/vmvarela/takeoff"
license=('MIT')
options=('!strip')
source=("https://github.com/vmvarela/takeoff/releases/download/v0.4.1/takeoff-v0.4.1-linux-x86_64.tar.gz")
sha256sums=('3e97414050d3c6bb389dfcb70826d62002dcff06d3e42dda6f99c2679c3ccd46')

package() {
  local _dir="takeoff-0.4.1"

  install -Dm755 "$srcdir/$_dir/bin/takeoff" "$pkgdir/usr/bin/takeoff"

  install -Dm644 "$srcdir/$_dir/LICENSE" "$pkgdir/usr/share/licenses/takeoff/LICENSE"

  while IFS= read -r -d '' _f; do
    local _rel="${_f#*/man/}"
    install -Dm644 "$_f" "$pkgdir/usr/share/man/${_rel}"
  done < <(find "$srcdir/$_dir" -type f -path "*/man/*" -print0)

  while IFS= read -r -d '' _f; do
    if [[ "$_f" == */completions/bash/* ]]; then
      local _rel="${_f#*/completions/bash/}"
      install -Dm644 "$_f" "$pkgdir/usr/share/bash-completion/completions/${_rel}"
    elif [[ "$_f" == */completions/zsh/* ]]; then
      local _rel="${_f#*/completions/zsh/}"
      install -Dm644 "$_f" "$pkgdir/usr/share/zsh/site-functions/${_rel}"
    elif [[ "$_f" == */completions/fish/* ]]; then
      local _rel="${_f#*/completions/fish/}"
      install -Dm644 "$_f" "$pkgdir/usr/share/fish/vendor_completions.d/${_rel}"
    fi
  done < <(find "$srcdir/$_dir" -type f -path "*/completions/*" -print0)
}
