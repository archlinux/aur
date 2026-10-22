# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=mattpocock-skills
pkgver=1.3.1 # renovate: datasource=github-releases depName=mattpocock/skills
pkgrel=1
pkgdesc="Matt Pocock's agent skills (agentskills.io format), linked into ~/.agents/skills via user tmpfiles"
url="https://github.com/mattpocock/skills"
arch=('any')
license=('MIT')
depends=('systemd')
makedepends=('jq')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1847b1dab968d7dc8e87fdcad6613574557fd51301b66ba423c78d306bfa157b')

_datadir="/usr/share/agent-skills/$pkgname"

# Upstream nests skills in buckets (skills/engineering/tdd, ...) but agents scan
# one level deep, so flatten. The promoted set is whatever the Claude plugin
# manifest lists; this also leaves out misc/, in-progress/ and deprecated/.
_skills() {
  jq -r '.skills[] | sub("^\\./"; "")' "$srcdir/skills-$pkgver/.claude-plugin/plugin.json"
}

build() {
  cd "$srcdir/skills-$pkgver"

  local dir name
  declare -A seen
  : >"$srcdir/$pkgname.conf"
  while read -r dir; do
    [[ -f "$dir/SKILL.md" ]] || { echo "missing $dir/SKILL.md" >&2; return 1; }
    name="$(basename "$dir")"
    [[ -z "${seen[$name]:-}" ]] || { echo "flattening collision: $name" >&2; return 1; }
    seen[$name]=1
    # plain L: never replace a skill the user already has under that name
    printf 'L %%h/.agents/skills/%s - - - - %s/%s\n' "$name" "$_datadir" "$name" >>"$srcdir/$pkgname.conf"
  done < <(_skills)
}

package() {
  cd "$srcdir/skills-$pkgver"

  local dir
  while read -r dir; do
    install -dm755 "$pkgdir$_datadir/$(basename "$dir")"
    cp -r --no-preserve=ownership "$dir/." "$pkgdir$_datadir/$(basename "$dir")/"
  done < <(_skills)
  chmod -R u=rwX,go=rX "$pkgdir$_datadir"

  install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/usr/lib/user-tmpfiles.d/$pkgname.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
